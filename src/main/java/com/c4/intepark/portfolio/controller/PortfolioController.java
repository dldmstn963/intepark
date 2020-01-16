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
import com.c4.intepark.request.model.vo.Request;
import com.c4.intepark.review.model.vo.Review;
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
		  //logger.info(list);
		  ArrayList<RvAvg> rv = portfolioService.selectAllReview();
		  
		  if (list.size() > 0) {
			  model.addAttribute("list", list);
			  model.addAttribute("rv", rv);
			  return "portfolio/portfolioListView";
		  } else { 
			  model.addAttribute("message", "시공사 리스트 조회 실패!");
			  return "common/error";
		  }
	}
	
	@RequestMapping("pfOne5.do")
	public ModelAndView pfOne(@RequestParam(value="consid", required=true) String consid, ModelAndView mv) {
		//logger.info(consid);
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);
	
		if(cons != null) {
			mv.addObject("cons", cons);
			mv.addObject("rv", rv);
			mv.addObject("review", review);
			mv.setViewName("portfolio/portfolioDetailView");
		}else {
			mv.addObject("message", cons.getCompanyname() + "  시공사 상세 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="writeIntroductionForm5.do", method=RequestMethod.POST)
	public String writeIntroductionForm(@RequestParam(value="consid", required=true) String consid, Model model) {
		//System.out.println("출력이다 : " + consid);
		
		Constructors cons = portfolioService.selectOneCons(consid);
		RvAvg rv = portfolioService.selectReview(consid);
		ArrayList<Review> review = portfolioService.selectConsReviewList(consid);	//생략가능
		
		 if (cons != null) {
			 model.addAttribute("cons", cons);
			 model.addAttribute("rv", rv);
			 model.addAttribute("review", review);	//생략가능
			 return "portfolio/writeIntroduction";
		  } else { 
			 model.addAttribute("message", "소개글 작성페이지 조회 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="updateIntroduction5.do", method=RequestMethod.POST)
	public String updateIntroduction(@RequestParam(value="consid", required=true) String consid, HttpServletRequest request, Model model) {
		String pfintroduction = request.getParameter("ir1");
		//logger.info("스마트에디터다 : " + pfintroduction );
		
		Constructors cons = new Constructors();
		cons.setConsid(consid);
		cons.setPfintroduction(pfintroduction);
		
		int result = portfolioService.updateIntroduction(cons);
		
		if (result > 0) {
			 return "forward:pfOne5.do";
		  } else { 
			 model.addAttribute("message", "소개글 작성 실패!");
			 return "common/error";
		  }	
	}
	
	@RequestMapping(value="test5.do", method=RequestMethod.POST)
	public String test5() {
		return "review/test";
	}
	
	
	
	//private static final int RESULT_EXCEED_SIZE = -2;	//용량초과
    //private static final int RESULT_UNACCEPTED_EXTENSION = -1;	//잘못된 확장자 업로드
    //private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 20 * 1024 * 1024;
    
    @ResponseBody
    @RequestMapping(value="testSubmit5.do", method=RequestMethod.POST)
    public int multiImageUpload(@RequestParam("files")List<MultipartFile> images, HttpServletRequest request) throws IllegalStateException, IOException {
        long sizeSum = 0;
        int i = 0;
        
        int count = images.size();
        if(count > 5 ) {
        	
        	return 3;
        }
       
      //해당 웹 컨테이너의 구동 중인 웹 애플리케이션 안의 파일 저장 폴더 지정
        String savePath = request.getSession().getServletContext().getRealPath("/resources/review_file");
        
        for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            
            // 확장자 검사
            if(!isValidExtension(originalName)){
                return -1;	//잘못된 확장자 업로드
            }
            
            //용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return -2;	//용량초과
            }
            
            //TODO 저장..  
            
          //첨부된 파일이 있다면, 파일명 바꾸기 처리
    		//"yyyyMMddhhmmss.확장자" 형식으로 바꿈
    			//바꿀 파일명에 대한 포맷 설정함
    			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss" + i);
    			//바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
    			String renameFile = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalName.substring(originalName.lastIndexOf(".") + 1);
    			
    			//현재 지정된 폴더에 저장된 원본파일의 파일명을 바꾸기하기 위해서
    			//File 객체를 생성함.
    			//File originFile = new File(savePath + "\\" + originalName);
    			//File renameFile = new File(savePath + "\\" + renameFileName);  
            
    			MultipartFile file = image;
    			file.transferTo(new File(savePath + "\\" + renameFile));

            System.out.println("확인이다 : " + originalName + "\n");
            
            i++;
            
        }//for문 끝
        
        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
        return 1;
    }
        
    //required above jdk 1.7 - switch(String)
    private boolean isValidExtension(String originalName) {
        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
        switch(originalNameExtension) {
        case "jpg":
        case "png":
        case "gif":
            return true;
        }
        return false;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="insertpf5.do", method=RequestMethod.POST)
	public String insertportfolio(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = portfolioService.insertportfolio(portfolio);
		int pfnum = portfolioService.selectpfnum();
		portfolioFile.setPfnum(pfnum);
		int result2 = portfolioService.insertportfolioFile(portfolioFile);
		
		return null;
	}
	
	@RequestMapping(value="updatepf5.do", method=RequestMethod.POST)
	public String updateportfolio(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = portfolioService.updateportfolio(portfolio);
		int pfnum = portfolio.getPfnum();
		//int result2 = portfolioService.updateportfolioFile(pfnum);
		
		return null;
	}
	

	
	@RequestMapping(value="deletepf5.do", method=RequestMethod.POST)
	public String deleteportfolio(@RequestParam(value="reqnum", required=true) String reqnum) {
		
		int result = portfolioService.deleteportfolio(reqnum);
		
		return null;
	}
	
	
}




















