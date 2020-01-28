package com.c4.intepark.album.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.c4.intepark.album.model.service.AlbumService;
import com.c4.intepark.album.model.vo.Album;
import com.c4.intepark.album.model.vo.AlbumImgs;
import com.c4.intepark.album.model.vo.AlbumReply;
import com.c4.intepark.common.CommonPage;

@Controller
public class AlbumController {
	
	@Autowired
	private AlbumService albumService;
	
	@RequestMapping("albumWrite6.do")
	public String albumWritePage() {
		return "album/albumWrite";
	}
	
	@RequestMapping("albumlist6.do")
	public String albumListPage(@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			CommonPage cpage, Model model) {
		//전체페이지 수찾기(검색포함)
		int listCount=0;		
		listCount = albumService.selectAllListCount(cpage);
		cpage.pageUpdate(6, 10, listCount, currentPage);
		ArrayList<Album> albumList = albumService.selectList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("albumList", albumList);
		return "album/albumList";
	}
	
	@RequestMapping("albumView.do")
	public String albumViewPage(@RequestParam("anum") int anum,
		@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
		
		Album album = albumService.selectOneAlbum(anum);
		int aReplyCount = albumService.selectReplyCount(anum);
		ArrayList<AlbumImgs> imglist = albumService.selectImgList(anum);
		ArrayList<AlbumReply> aReply = albumService.selectOneAlbumReply(anum);
		//조회수증가
		albumService.updateReadCount(anum);
		
		model.addAttribute("album", album);
		model.addAttribute("aReplyCount", aReplyCount);
		model.addAttribute("aReply", aReply);
		model.addAttribute("imglist", imglist);
		model.addAttribute("page", page);
		return "album/albumView";
	}
	
	@RequestMapping(value="albumReplyWrite.do", method=RequestMethod.POST)
	public String albumReplyWrite(AlbumReply aReply, @RequestParam("page") int page) {
		int result = albumService.insertAlbumReply(aReply);
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	@RequestMapping(value="albumRReplyWrite.do", method=RequestMethod.POST)
	public String albumRReplyWrite(AlbumReply aReply, @RequestParam("page") int page) {

		int minGroupOrder = albumService.selectMinGroupOrder(aReply);
		if(minGroupOrder == -1) { //맨밑으로 가는형태라면
			int maxGroupOrder = albumService.selectMaxGroupOrder(aReply);
			aReply.setAlbumreplygrouporder(maxGroupOrder);
		}else { //중간에 껴들어가는 형태라면
			aReply.setAlbumreplygrouporder(minGroupOrder);
			int uResult = albumService.updateReply(aReply);
		}
		int iResult = albumService.insertRReply(aReply);	
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	@RequestMapping("albumReplyDelete.do")
	public String replyDelete(@RequestParam("page") int page, @RequestParam("anum") int anum,
								@RequestParam("replyno") int replyNo) {

		int dResult= albumService.updateReplyDelete(replyNo);
		return "redirect:/albumView.do?anum="+anum+"&page="+page;
	}
	
	@RequestMapping(value="albumReplyUpdate.do", method=RequestMethod.POST)
	public String replyUpdate(@RequestParam("page") int page, AlbumReply aReply) {

		int dResult= albumService.updateReplyContents(aReply);
		return "redirect:/albumView.do?anum="+aReply.getAlbumnum()+"&page="+page;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "albumImgUpload.do", method = RequestMethod.POST)
	public String multiImageUpload(@RequestParam("file") MultipartFile image,
			HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		String year = time1.substring(0, 4);
		String Month = time1.substring(5, 7);
		String day = time1.substring(8, 10);
		
		String path = request.getSession().getServletContext().getRealPath("/resources/albumImgs/"+year+"/"+Month+"/"+day);

		File file = new File(path);

		if(!file.exists()){
			//폴더가 존재안하면 폴더 생성해줌.
			file.mkdirs();
		}

		String originalName = image.getOriginalFilename();

		String renameFile = UUID.randomUUID().toString()+originalName.substring(originalName.lastIndexOf("."));

		image.transferTo(new File(path + "\\" + renameFile));

		JSONObject job = new JSONObject();
		
		job.put("oriname", URLEncoder.encode(originalName, "utf-8"));
		job.put("root", year+"/"+Month+"/"+day);
		job.put("rename", renameFile);
		
		return job.toJSONString();
	}
	
	@RequestMapping(value="albumImgDelete.do",method = RequestMethod.POST)
	public void imgDelete(@RequestParam("rename") String rename, @RequestParam("root") String root,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String path = request.getSession().getServletContext().getRealPath("/resources/albumImgs/"+root);
			File file = new File(path + "\\" + rename);
			if (file.exists() == true)
				file.delete();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();	
	}
	//엘범인서트
	@RequestMapping(value="albumInsert.do",method = RequestMethod.POST)
	public String insertAlbum(Album album, @RequestParam("oriname") List<String> oriname,
			@RequestParam("rename") List<String> rename,@RequestParam("imgroot") List<String> imgroot, HttpServletRequest request, Model model){

		int result = albumService.insertAlbum(album);
		if(result==1) {
			int albumnum = albumService.selectMaxAlbumNum(album.getUserid());
			AlbumImgs aImg= new AlbumImgs();
			aImg.setAlbumnum(albumnum);
			for(int i=0; i<oriname.size(); i++) {
				aImg.setAlbumoriginalimgname(oriname.get(i));
				aImg.setAlbumrenameimgname(rename.get(i));
				aImg.setAlbumimgroot(imgroot.get(i));
				albumService.insertAlbumImg(aImg);
			}
		}else {
			model.addAttribute("message", "앨범 저장에 실패하였습니다.");
			return "common.error";
		}

			return "redirect:/albumlist6.do";
	}
	@RequestMapping("albumDelete.do")
	public String deleteAlbum(@RequestParam("anum") int anum, HttpServletRequest request) {
		//서버에서 파일을 먼저 삭제해준다.
		ArrayList<AlbumImgs> imglist = albumService.selectImgList(anum);

		for(AlbumImgs aimg : imglist) {
		String root = aimg.getAlbumimgroot();
		String rename = aimg.getAlbumrenameimgname();

		String path = request.getSession().getServletContext().getRealPath("/resources/albumImgs/"+root);
		File file = new File(path + "\\" + rename);
		if (file.exists() == true)
			file.delete();
		}
		//디비는 cascade로 글삭제시 전부삭제
		albumService.deleteAlbum(anum);
		return "redirect:/albumlist6.do";
	}
	
	@RequestMapping("albumUpdatePage.do")
	public String albumUpdatePage(@RequestParam("anum") int anum, Model model) {
			Album album = albumService.selectOneAlbum(anum);
			ArrayList<AlbumImgs> imglist = albumService.selectImgList(anum);

			model.addAttribute("album", album);
			model.addAttribute("imglist", imglist);
			
			return "album/albumUpdate";
		}
	//업데이트시 이미지 첨부
	@ResponseBody
	@RequestMapping(value = "albumUpdateImgUpload.do", method = RequestMethod.POST)
	public String updatemultiImageUpload(@RequestParam("file") MultipartFile image,@RequestParam("anum") int anum,
			HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		String year = time1.substring(0, 4);
		String Month = time1.substring(5, 7);
		String day = time1.substring(8, 10);
		String root = year+"/"+Month+"/"+day;
		
		String path = request.getSession().getServletContext().getRealPath("/resources/albumImgs/"+root);

		File file = new File(path);

		if(!file.exists()){
			//폴더가 존재안하면 폴더 생성해줌.
			file.mkdirs();
		}

		String originalName = image.getOriginalFilename();

		String renameFile = UUID.randomUUID().toString()+originalName.substring(originalName.lastIndexOf("."));

		image.transferTo(new File(path + "\\" + renameFile));

		//디비에입력
		AlbumImgs aimg = new AlbumImgs();
		aimg.setAlbumnum(anum);
		aimg.setAlbumoriginalimgname(originalName);
		aimg.setAlbumrenameimgname(renameFile);
		aimg.setAlbumimgroot(root);
		albumService.insertAlbumImg(aimg);
		
		JSONObject job = new JSONObject();
		job.put("oriname", URLEncoder.encode(originalName, "utf-8"));
		job.put("root", root);
		job.put("rename", renameFile);
		
		return job.toJSONString();
	}
	//업데이트시 이미지제거
	@RequestMapping(value="albumUpdateImgDelete.do",method = RequestMethod.POST)
	public void updateImgDelete(@RequestParam("rename") String rename,
			@RequestParam("anum") int anum,@RequestParam("root") String root,
			HttpServletRequest request,HttpServletResponse response) throws IOException {

		String path = request.getSession().getServletContext().getRealPath("/resources/albumImgs/"+root);
			File file = new File(path + "\\" + rename);
			if (file.exists() == true)
				file.delete();
			
			//디비에서삭제
			AlbumImgs aimg = new AlbumImgs();
			aimg.setAlbumrenameimgname(rename);
			aimg.setAlbumnum(anum);
			albumService.deleteAlbumImg(aimg);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("ok");
			out.flush();
			out.close();	
	}
	
	//수정
	@RequestMapping(value="albumUpdate.do",method = RequestMethod.POST)
	public String albumUpdate(Album album, Model model){
		
		int result = albumService.updateAlbum(album);
		
		if(result!=1) {
			model.addAttribute("message", "앨범 수정에 실패하였습니다.");
			return "common.error";
		}
		return "redirect:/albumlist6.do";
	}
	@RequestMapping("albumtop4.do")
	public void albumtop4(HttpServletResponse response) throws IOException {
		ArrayList<Album> albumList = albumService.selectAlbumTop4();
				//전송용 json 객체 생성
				JSONObject sendJson = new JSONObject();
				//list에 옮겨 저정할 json 배열 객체 생성
				JSONArray jarr = new JSONArray();
				
				for(Album album : albumList) {
					JSONObject job = new JSONObject();
					job.put("albumnum", album.getAlbumnum());
					job.put("userid", album.getUserid());
					job.put("albumreadcount", album.getAlbumreadcount());
					job.put("albumimgroot", album.getAlbumimgroot());
					job.put("albumrenameimgname", album.getAlbumrenameimgname());
					
					jarr.add(job);
				}
				
				sendJson.put("list", jarr);
				
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out =response.getWriter();
				out.write(sendJson.toJSONString());
				out.flush();
				out.close();
	}
	
}

























