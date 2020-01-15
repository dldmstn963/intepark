package com.c4.intepark.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.c4.intepark.portfolio.controller.PortfolioController;
import com.c4.intepark.portfolio.model.vo.Portfolio;
import com.c4.intepark.portfolio.model.vo.PortfolioFile;
import com.c4.intepark.review.model.service.ReviewService;
import com.c4.intepark.review.model.vo.Review;
import com.c4.intepark.review.model.vo.ReviewFile;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	public ReviewController() {}
	
	
	@RequestMapping("selectReviewForm5.do")
	public String selectReviewForm(@RequestParam(value="consid", required=true) String consid, Model model) {
		//logger.info("아이디 : " + consid);
		
		Constructors cons = reviewService.selectReviewForm(consid);
		
		if(cons != null) {
			model.addAttribute("cons", cons);
			return "review/reviewFormView";
		}else {
			model.addAttribute("message", cons.getCompanyname() + "  시공사 리뷰작성 조회 실패!");
			return "common/error";
		}
		
	}
	
	
	
	
	
	//private static final int RESULT_EXCEED_SIZE = -2;	//용량초과
    //private static final int RESULT_UNACCEPTED_EXTENSION = -1;	//잘못된 확장자 업로드
    //private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 20 * 1024 * 1024;
    
    @ResponseBody
	@RequestMapping(value="insertReview5.do", method=RequestMethod.POST)
	public String insertReview(Review rv, ReviewFile rvFile, HttpServletRequest request, @RequestParam("filedata")List<MultipartFile> images) throws IllegalStateException, IOException {
		//logger.info(review.toString());
		
		int rvkind = rv.getRvkind();
		int rvprice = rv.getRvprice();
		int rvquality = rv.getRvquality();
		int rvprofessional = rv.getRvprofessional();
		int rvresponsible = rv.getRvresponsible();
		
		double rvavg = (rvkind+rvprice+rvquality+rvprofessional+rvresponsible)/5.0;
		rv.setRvavg(rvavg);	//리뷰평균점수
		
		
		String rvperiod2 = request.getParameter("rvperiod2");	//월 값
		String rvperiod = rv.getRvperiod() + " " + rvperiod2;
		rv.setRvperiod(rvperiod);
		
		String rvregion2 = request.getParameter("rvregion2"); //구 값
		if(rvregion2 != null) {
			String rvregion = rv.getRvregion() + " " + rvregion2;
			rv.setRvregion(rvregion);
		}
		
		int result = reviewService.insertReview(rv);
		
		
		
		
		long sizeSum = 0;
        int i = 0;
        
        int count = images.size();
        if(count > 5 ) {
        	
        	return "3";
        }
       
      //해당 웹 컨테이너의 구동 중인 웹 애플리케이션 안의 파일 저장 폴더 지정
        String savePath = request.getSession().getServletContext().getRealPath("/resources/review_file");
        
        for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            
            
         // 확장자 검사
            if(!isValidExtension(originalName)){
                return "-1";	//잘못된 확장자 업로드
            }
            
            //용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return "-2";	//용량초과
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
		
		
		
		
		
		

		return "forward:pfOne5.do";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("selectrvList5.do")
	public String selectrvList(Model model) {
		
		  ArrayList<Review> list = reviewService.selectrvList();
		  //logger.info(list);
		
		/*
		 * if (list.size() > 0) { model.addAttribute("list", list); return
		 * "portfolio/portfolioListView"; } else { model.addAttribute("message",
		 * "업체 리스트 조회 실패!"); return "common/error"; }
		 */
		  return null;
	}
	
	@RequestMapping("selectrvOne5.do")
	public ModelAndView selectrvOne(@RequestParam(value="rvnum", required=true) int rvnum, ModelAndView mv) {
		//logger.info(consid);
		
		Review review = reviewService.selectrvOne(rvnum);
		
		/*
		 * if(cons != null) { mv.addObject("cons", cons);
		 * mv.setViewName("portfolio/portfolioDetailView"); }else {
		 * mv.addObject("message", cons.getCompanyname() + "  업체 상세 조회 실패!");
		 * mv.setViewName("common/error"); } return mv;
		 */
		return null;
	}
	
	
	
	
	
	@RequestMapping(value="updateReview5.do", method=RequestMethod.POST)
	public String updateReview(Portfolio portfolio, PortfolioFile portfolioFile) {
		
		int result = reviewService.updateReview(portfolio);
		//int pfnum = portfolio.getPfnum();
		//int result2 = portfolioService.updateportfolioFile(pfnum);
		
		return null;
	}
	

	
	@RequestMapping(value="deleteReview5.do", method=RequestMethod.POST)
	public String deleteReview(@RequestParam(value="rvnum", required=true) int rvnum) {
		
		int result = reviewService.deleteReview(rvnum);
		
		return null;
	}
	
	
}
