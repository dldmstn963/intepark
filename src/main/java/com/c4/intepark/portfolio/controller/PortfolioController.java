package com.c4.intepark.portfolio.controller;

import java.io.File;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.portfolio.model.service.PortfolioService;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.portfolio.model.vo.PortfolioView;
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;
import com.c4.intepark.review.model.vo.RvAvg;

@Controller
public class PortfolioController {
	// 로그 처리용 객체 의존성주입 처리함 (종속객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);

	@Autowired
	private PortfolioService portfolioService;

	public PortfolioController() {}

	@RequestMapping("conslist5.do")
	public String pfList(Model model) {
		
		  ArrayList<Constructors> list = portfolioService.selectList();
		  
		  ArrayList<RvAvg> rv = portfolioService.selectAllReview();
		  ArrayList<Portfolio> pfPhotoList = portfolioService.selectPfPhotoList();
		  
		  if (list.size() > 0) {
			  model.addAttribute("list", list);
			  model.addAttribute("rv", rv);
			  model.addAttribute("pfPhotoList", pfPhotoList);
			  return "portfolio/portfolioListView";
		  } else { 
			  model.addAttribute("message", "시공사 리스트 조회 실패!");
			  return "common/error";
		  }
	}
	
	@RequestMapping("pfOne5.do")
	public ModelAndView pfOne(@RequestParam(value="consid", required=true) String consid, 
											@RequestParam(value="message",	required=true, defaultValue="소개글") String message, ModelAndView mv) {
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);
		ArrayList<ReviewFile> rvFile = portfolioService.selectConsRvFileList(consid);
		ArrayList<PortfolioView> pfOneList = portfolioService.selectPfOneList(consid);
		
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.addObject("rv", rv);
			mv.addObject("review", review);
			mv.addObject("rvFile", rvFile);
			mv.addObject("pfOneList", pfOneList);
			mv.addObject("message", message);
			mv.setViewName("portfolio/portfolioDetailView");
		}else {
			mv.addObject("message", cons.getCompanyname() + " 상세 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="writeIntroductionForm5.do", method=RequestMethod.POST)
	public String writeIntroductionForm(@RequestParam(value="consid", required=true) String consid, Model model) {
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		//ArrayList<Review> review = portfolioService.selectConsReviewList(consid);	//생략가능
		
		 if (cons != null) {
			 model.addAttribute("cons", cons);
			 model.addAttribute("rv", rv);
			 model.addAttribute("consid", consid);
			 //model.addAttribute("review", review);	//생략가능
			 return "portfolio/writeIntroduction";
		  } else { 
			 model.addAttribute("message", "소개글 작성페이지 조회 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="updateIntroduction5.do", method=RequestMethod.POST)
	public String updateIntroduction(@RequestParam(value="consid", required=true) String consid, HttpServletRequest request, Model model) {
		String pfintroduction = request.getParameter("ir1");
		
		Constructors cons = new Constructors();
		cons.setConsid(consid);
		cons.setPfintroduction(pfintroduction);
		
		int result = portfolioService.updateIntroduction(cons);
		
		if (result > 0) {
			 return "redirect:pfOne5.do?consid=" + consid;
		  } else { 
			 model.addAttribute("message", "소개글 작성 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="selectPfOne5.do")
	public String selectPfOne(@RequestParam(value="consid", required=true) String consid,
										@RequestParam(value="pfnum", required=true) int pfnum, Model model) {
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<PortfolioFile> pfOne = portfolioService.selectPfOne(pfnum);
		
		int selectpfnum = 0;
		for(PortfolioFile i : pfOne) {
			selectpfnum = i.getPfnum();
		}
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);	//생략가능
		
		if (cons != null) {
			 model.addAttribute("cons", cons);
			 model.addAttribute("rv", rv);
			 model.addAttribute("pfOne", pfOne);
			 model.addAttribute("pfnum", selectpfnum);
			 model.addAttribute("consid", consid);
			 model.addAttribute("review", review);	//생략가능
			 return "portfolio/portfolioDetailPhoto";
		  } else { 
			 model.addAttribute("message", "포트폴리오 조회 실패!");
			 return "common/error";
		  }

	}
	
	@RequestMapping(value="writePF_Form5.do", method=RequestMethod.POST)
	public String writePF_Form(@RequestParam(value="consid", required=true) String consid, Model model) {
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		//ArrayList<Review> review = portfolioService.selectConsReviewList(consid);	//생략가능
		
		if (cons != null) {
			 model.addAttribute("cons", cons);
			 model.addAttribute("rv", rv);
			 model.addAttribute("consid", consid);
			 //model.addAttribute("review", review);	//생략가능
			 return "portfolio/writePortfolio";
		  } else { 
			 model.addAttribute("message", "포트폴리오 작성페이지 조회 실패!");
			 return "common/error";
		  }

	}
	
	@RequestMapping(value="deletePfOne5.do")
	public String deletepfOne(@RequestParam(value="consid", required=true) String consid,
										@RequestParam(value="pfnum", required=true) String pfnum1, HttpServletRequest request) {
		
		int pfnum = Integer.parseInt(pfnum1);
		
		ArrayList<PortfolioFile> pfFile = portfolioService.selectPfRename(pfnum);
    	
		String path="";
		
		for(PortfolioFile i : pfFile) {
			//System.out.println(i.getRvrename() + "\n");
			path = request.getSession().getServletContext().getRealPath("/resources/portfolio_file/"); // 삭제할 파일의 경로
			
				File file = new File(path + "\\" + i.getPfrename());
				if(file.exists() == true){
				file.delete();
			}
		}
			
		int result = portfolioService.deletePortfolio(pfnum);
		
		if(result > 0) {
			return "redirect:pfOne5.do?consid=" + consid + "&message=portfolio";
		}else {
			request.setAttribute("message", "포트폴리오 삭제 실패!");
			 return "common/error";
		}
			 
	}

	@RequestMapping(value="insertPF5.do", method=RequestMethod.POST)
	public String insertPF(Portfolio pf, PortfolioFile pfFile, @RequestParam("files")List<MultipartFile> images, @RequestParam("pfcoment2")List<String> pfcoment2, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println(pfcoment2.toString());
	
		int result = portfolioService.insertPF(pf); //portfolio값 입력
		
        int pfnum = portfolioService.selectpfnum(pf.getConsid()); //입력한 portfolio의 pfnum값 조회해오기
        
        String consid = pf.getConsid();
        
        pfFile.setPfnum(pfnum);
        pfFile.setConsid(consid);
        
        int i = 0;
		
		//해당 웹 컨테이너의 구동 중인 웹 애플리케이션 안의 파일 저장 폴더 지정
        String savePath = request.getSession().getServletContext().getRealPath("/resources/portfolio_file");
        
        for(MultipartFile image : images) {
        	
            String originalName = image.getOriginalFilename();
          //첨부된 파일이 있다면, 파일명 바꾸기 처리
    		//"yyyyMMddhhmmss.확장자" 형식으로 바꿈
    			//바꿀 파일명에 대한 포맷 설정함
    			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss" + i);
    			//바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
    			String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalName.substring(originalName.lastIndexOf(".") + 1);
    			
    			MultipartFile file = image;
    			file.transferTo(new File(savePath + "\\" + renameFile));
    			
    			pfFile.setPforiginalname(originalName);
    			pfFile.setPfrename(renameFile);
    			pfFile.setPfcoment(pfcoment2.get(i));
    			
    			portfolioService.insertPfFile(pfFile);
    			
            i++;
        }//for문 끝
        
		return "redirect:pfOne5.do?consid=" + consid + "&message=portfolio";
	}
	
	
	
	
	
	
}




