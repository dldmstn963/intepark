package com.c4.intepark.auction.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.c4.intepark.auction.model.service.AuctionService;
import com.c4.intepark.auction.model.vo.Auction;

@Controller
public class AuctionController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	private AuctionService auctionService;
	//@Autowired 애노테이션을 사용하면 get/set 접근 메서드를 더 이상 만들지 않아도  SpringFramework 이 설정 파일을 통해서 알아서 get/set 접근 메서드 대신 실행함.
public AuctionController() {}

@RequestMapping("auctionList2.do")
public String auctionList(HttpServletRequest request,HttpServletResponse response) {
	
	ArrayList<Auction> list = auctionService.auctionList();
	request.setAttribute("list", list);
	return "auction/auctionList";
}

@RequestMapping("auction2.do")
public String auctionEnrollPage() {
	
	return "auction/auctionEnroll";
}

@RequestMapping("auctionEnd2.do")
public String auctionEndList() {
	
	return "auction/auctionEndList2";
}

	 @RequestMapping(value="auctionEnroll2.do", method=RequestMethod.POST) 
	 public String auctionEnroll(Auction auction, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {

		 List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
		 String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
	String ofile = "";	
	String rfile = "";	
	

	for (MultipartFile mf : fileList) {
	
		if(mf.getSize() != 0) {  //가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
		String originalFileName = null;
		String renameFileName = null;
		try {
			mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
			originalFileName = mf.getOriginalFilename();
			if(originalFileName != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
						+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				//파일명을 바꾸려면 File 객체의 renameTo() 사용함
				File originFile = new File(savePath + "\\" + originalFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);
				
				//파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
				if(!originFile.renameTo(renameFile)) {
					//파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
					int read = -1;
					byte[] buf = new byte[1024];  //한 번에 읽어서 저장할 바이트 배열
					
					FileInputStream fin = new FileInputStream(originFile);
					FileOutputStream fout = new FileOutputStream(renameFile);
					
					while((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}
					
					fin.close();
					fout.close();
					originFile.delete();  //원본 파일 삭제함.
				}
			}
		} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
		}	
	ofile += originalFileName + "/";
	rfile += renameFileName + "/";
	
	 String ofile1 = ofile.substring(0, ofile.length()-1);
	 String rfile1 = rfile.substring(0, rfile.length()-1);
	

	auction.setOfile(ofile1);
	auction.setRfile(rfile1);
	}
		}

	int result = auctionService.auctionEnroll(auction); 
		
	logger.info("auction : " + auction);

	 return "redirect:main.do";
}
	
	 
}