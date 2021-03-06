package com.c4.intepark.notice.model.controller;


import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.activation.CommandMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.c4.intepark.notice.model.service.NoticeService;
import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.dao.NoticeDao;
import com.c4.intepark.notice.model.vo.NoticePage;
import com.c4.intepark.common.CommonPage;

@Controller	//현재 클래스를 컨트롤러 빈 등록
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	//의존관계 주입
	@Autowired
	NoticeService noticeService;
	
	public NoticeController() {}
	
	//01. 게시글 전체목록 보기
	@RequestMapping(value="nlist1.do", method=RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request) {
		
		//개시글 전체 목록 조회를 위한 패이징 처리 컨트롤러 생성
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int limit = 10;	//한 페이지에 출력할 목록 갯수 출력
		
		int listCount = noticeService.getListCount();//테이블의 전체 목록 갯수 조회를 위해 서비스단에 보낼 객체생성
		//총 페이지 수 계산하기
		int maxPage = listCount / limit;
		if (listCount % limit > 0) {
			maxPage++;
		}
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산하기
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		int endPage = beginPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		
		
		//조회할 목록의 시작행 끝행 서비스단으로 보내기
		ArrayList<Notice> list = noticeService.selectList(new NoticePage(startRow, endRow)); // 공지사항 전체목록 조회
		
		
		
		if (list.size() > 0) {
			model.addAttribute("list",list);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			
			return "notice/noticeListView"; //뷰 (뷰 리졸버)에 내보낼 값
		}else {
			model.addAttribute("message", "공지사항 목록 보기실패!");
			
			return "common/error"; //뷰 (뷰 리졸버)에 내보낼 값
		}
			
		}	
		
		
	
	  //02. 게시글 상세보기
	  @RequestMapping(value="ndetail2.do", method=RequestMethod.GET) 
	  public String noticeDetail(Model model, HttpServletRequest request) {
		  
		  int noticeno = Integer.parseInt(request.getParameter("no"));
		  String currentPage = (String)request.getParameter("page");
		  //리런 후 db정보 보낼 패이지
		  String view = "notice/noticeDetailView";
		  
		  
		  
		  Notice notice = noticeService.selectOne(noticeno);
		  System.out.println("notice 정보 : "+ notice);
		//조회수 증가 서비스보내기
		   noticeService.updateReadCount(noticeno);//조회수 1증가 처리 보내기
		  if (notice != null) {
			  model.addAttribute("notice", notice);
			  
			  model.addAttribute("currentPage", currentPage);
		}else {
			model.addAttribute("message", "공지사항 상세보기실패!");
			view = "common/error";
		}
		  return view;
	  }
	  
	  //03. 게시글 작성화면이동처리 컨트롤러
	  @RequestMapping(value="nwrite3.do", method=RequestMethod.GET)
	  public String noticeWriteFrom(){
			return "notice/noticeWriteForm";	
		}
		  
	  //04. 게시글 작성 db이동 처리 컨트롤러(파일업로드 글작성처리)
	  @RequestMapping(value="ninsert4.do",  method = RequestMethod.POST)
	  public String noticeInsert(Model model, Notice notice, HttpServletRequest request,@RequestParam(name="file", required=false) MultipartFile file) {
		  logger.info("notice옴 : " + notice);
		  logger.info("file 옴 : " + file.getOriginalFilename());
		  
		  
		  String view = "redirect:/nlist1.do";
		  //파일을 커멘드 겍체로 직접 보내기
		  
		  //파일 저장 폴더 경로 지정하기
		  String savePath = request.getSession().getServletContext().getRealPath("resources/noticeupfiles");
		  try {
				file.transferTo(new File(savePath + "\\" + file.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		  
		  notice.setNoticeoriginalfilename(file.getOriginalFilename());
		  
		  //글작성 정보 서비스단으로 보내는 객체 생성
		  int result = noticeService.insertNotice(notice);
		  
		  
		  
		  
		  //글 작성 성공 / 실패 화면
		  if (result >= 0) {
			model.addAttribute(notice);
		  }else {
			  model.addAttribute("message", "공지사항 글 등록 실패!");
				view = "common/error"; 
		  }
		
			return view;
	  }
	
	 
	 //파일 다운로드 처리용 메소드 
	 @RequestMapping("nfiledown5.do") 
	 public ModelAndView noticeFileDown(HttpServletRequest request,@RequestParam("ofile") String fileName) {
		 logger.info("fdown.do : " + fileName);
		 
		 String savePath = request.getSession().getServletContext().getRealPath("resources/noticeupfiles");
		 File downFile = new File(savePath + "\\" + fileName);
		 
		 return new ModelAndView("filedown", "downFile", downFile); 
	 }
	 
	 
	 
	 
	 
	 //게시글 수정 페이지 이동처리 컨트롤러
	 @RequestMapping(value="nupdatemoveview6.do", method=RequestMethod.GET)
	 public String noticeUpMoveView(Model model, Notice notice, HttpServletRequest request) {
		 
		 //받아들일 객체 정보 생성
		 
		 int noticeno = Integer.parseInt(request.getParameter("no"));
		 String currentPage = (String)request.getParameter("page");
		  //리런 후 db정보 보낼 패이지
		  String view = "notice/noticeUpdateView";
		  
		  notice = noticeService.selectOne(noticeno);
		  
		  if (notice != null) {
			  model.addAttribute("notice", notice);
			  
			  model.addAttribute("currentPage", currentPage);
 
		}else {
			model.addAttribute("message", "공지사항 수정페이지 이동 실패!");
			view = "common/error";
		}
	
		 return view;
	 }
	 
	 
	 
	 
	 
	 
	 //게시글 수정처리 컨트롤러
	 @RequestMapping(value="nupdate7.do",method = RequestMethod.POST)
	 public String noticeUpdate(Model model, Notice notice, HttpServletRequest request,
			 @RequestParam(name="page") int page,@RequestParam(name="file", required=false) MultipartFile file) {
		  logger.info("notice옴 : " + notice);
		  logger.info("file 옴 : " + file.getOriginalFilename());
		  
		  //저장 경로 설정
		  String view = "redirect:/nlist1.do";
		//파일 저장 폴더 경로 지정하기
		  String savePath = request.getSession().getServletContext().getRealPath("resources/noticeupfiles");
		  try {
				file.transferTo(new File(savePath + "\\" + file.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		  
		  notice.setNoticeoriginalfilename(file.getOriginalFilename());
		  
		  //글작성 정보 서비스단으로 보내는 객체 생성
		  int result = noticeService.updateNotice(notice);
		  
		  
		//글 작성 성공 / 실패 화면
		  if (result >= 0) {
			model.addAttribute(notice);
			model.addAttribute(page);
		  }else {
			  model.addAttribute("message", "공지사항 글 수정 실패!");
				view = "common/error"; 
		  }
		  
		 
		  return view;
	 }
	 
	 
	//개시글 삭제 처리 컨트롤러
	@RequestMapping(value="ndelete8.do") 
	 public String noticeDelete(@RequestParam("no") int no, Model model) {
		
		//서비스 단으로 보내기
		int result = noticeService.deleteNotice(no);
		
		//삭제 완료 후 나올 경로 설정
		String view = "redirect:/nlist1.do";
		//삭제 성공 실패 여부 만들기
		if (result >= 0) {
			
			
			
		}else {
			model.addAttribute("message", "공지사항 글 수정 실패!");
			view = "common/error";
		}
		
		
		
		return view;
	}
	 
	 
	/* 
	 * //전달할 뷰의 이름 if (notice != null) { mv.addObject("notice", notice);
	 * mv.setViewName("notice/noticeDetailView"); }else { mv.addObject("message",
	 * "공지사항 상세보기 실패!"); mv.setViewName("common/error"); }
	 * 
	 * return mv; }
	 * 
	 * //03. 게시글 검색하기
	 * 
	 * @RequestMapping(value="noticesearch3.do") public ModelAndView
	 * noticeSearch(@RequestParam("search_option") String search) {
	 * ArrayList<Notice> list = noticeService.selectNoticeSearch(search); return
	 * null;
	 * 
	 * }
	 * 
	 * //04. 게시글 파일 다운 처리
	 * 
	 * @RequestMapping(value="noticefiledown4.do",method = RequestMethod.GET) //get
	 * 방식으로 받기 public ModelAndView noticeFileDown(@RequestParam(value = "noticeno")
	 * String noticeno, HttpServletRequest request) throws Exception { //해당 객체의 파일
	 * 천제 경로 값 받기 Notice notice = noticeService.noticeFileDown(noticeno); String
	 * filePath = request.getSession().getServletContext().getRealPath("파일경로"); //전체
	 * 경로를 인자로 넣을 파일 객체 생성 File downFile = new
	 * File(notice.getNoticeoriginalfilename()); File downloadFile = new
	 * File(filePath + notice.getNoticerenamefilename()); // 생성된 객체 파일과 view들을 인자로
	 * 넣어 새 ModelAndView 객체를 생성하며 파일을 다운로드 // (자동 rendering 해줌) return new
	 * ModelAndView("fileDownloadView", "downloadFile", downloadFile); }
	 * 
	 * //05. 게시글 작성화면 이동 처리
	 * 
	 * @RequestMapping(value="noticewrite5.do", method = RequestMethod.GET) public
	 * String noticeWrite() {
	 * 
	 * return "notice/noticeWriteForm"; }
	 * 
	 * //06. 게시글 작성처리
	 * 
	 * @RequestMapping(value="noticeinsert6.do", method = RequestMethod.POST) public
	 * String noticeInsert(@ModelAttribute Notice notice,Model model) { int result =
	 * noticeService.noticeInsert(notice); String viewFileName = "main"; //결과 출력 조건
	 * if (result <= 0) { //회원가입 실패시 model.addAttribute("message", "공지사항 글 등록 실패!");
	 * viewFileName = "common/error"; }
	 * 
	 * return viewFileName; }
	 * 
	 * //07. 게시글 수정처리
	 * 
	 * @RequestMapping(value="noticeupdate7.do", method= {RequestMethod.POST,
	 * RequestMethod.GET}) public ModelAndView
	 * noticeUpdate(@RequestParam(value="idx") int idx, @ModelAttribute("notice")
	 * Notice notice ) { ModelAndView mv = new ModelAndView("update"); Notice
	 * notice1 = noticeService.noticeUpdate(idx);
	 * 
	 * mv.addObject("notice", notice1);
	 * 
	 * return mv; }
	 * 
	 * //08. 게시글 삭제처리
	 * 
	 * @RequestMapping(value="noticedelete8.do",method = RequestMethod.POST) public
	 * void noticeDelete(@RequestParam("noticeno") int noticeno, HttpServletResponse
	 * response) throws IOException{ int result =
	 * noticeService.noticeDelete(noticeno);
	 * response.setContentType("text/html charset=utf-8"); PrintWriter out =
	 * response.getWriter(); if (result > 0) {
	 * out.println("<script>alert('삭제 성공!');</script>"); } else {
	 * out.println("<script>alert('삭제 실패!');</script>"); } }
	 */
	
	
	
	
	
	
}























