package com.c4.intepark.review.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	
	@RequestMapping(value="insertReview5.do", method=RequestMethod.POST)
	public String insertReview(Review rv, ReviewFile rvFile, HttpServletRequest request) {
		//logger.info(review.toString());
		//logger.info(rvFile.toString());
		//logger.info(rv.toString());
		
		int rvkind = rv.getRvkind();
		int rvprice = rv.getRvprice();
		int rvquality = rv.getRvquality();
		int rvprofessional = rv.getRvprofessional();
		int rvresponsible = rv.getRvresponsible();
		String consid = rv.getConsid();
		
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
		
			if(!rvFile.getRvoriginalname().equals("")) {
				
			int rvnum = reviewService.selectrvnum(rv.getUserid());
			
			String oriname[] = rvFile.getRvoriginalname().split(",");
			String rename[] = rvFile.getRvrename().split(",");
			
			for(int i = 0; i < oriname.length; i++) {
				ReviewFile rvfile = new ReviewFile();
				rvfile.setRvoriginalname(oriname[i]);
				rvfile.setRvrename(rename[i]);
				rvfile.setRvnum(rvnum);
				rvfile.setConsid(rv.getConsid());
				reviewService.insertRvfile(rvfile);
			}		
		}
		return "redirect:pfOne5.do?consid=" + consid;
	}
	
	
		//private static final int RESULT_EXCEED_SIZE = -2;	//용량초과
	    //private static final int RESULT_UNACCEPTED_EXTENSION = -1;	//잘못된 확장자 업로드
	    //private static final int RESULT_SUCCESS = 1;
	    private static final long LIMIT_SIZE = 20 * 1024 * 1024;

	    //로직은 언제나 Service에서 짜도록 하자.
	    //중간실패시 rollback은 고려하지 않았음.
	    @ResponseBody
	    @RequestMapping(value="insertImgUpload5.do", method=RequestMethod.POST)
	    public String multiImageUpload(@RequestParam("files")List<MultipartFile> images, HttpServletRequest request) throws IllegalStateException, IOException {
	    	
			long sizeSum = 0;
	        int i = 1;
			
	        int count = images.size();
	      //  if(count > 5 ) {
	       // 	job.put("3", 3);
	        //	sendJson.put("3", 3);
	        //	return sendJson.toJSONString();
	       // }
	        
	      //해당 웹 컨테이너의 구동 중인 웹 애플리케이션 안의 파일 저장 폴더 지정
	        String savePath = request.getSession().getServletContext().getRealPath("/resources/review_file");
	        
	        String oriname = "";
	        String rename = "";
	        
	        for(MultipartFile image : images) {
	            String originalName = image.getOriginalFilename();
	            
	            //확장자 검사
	          //  if(!isValidExtension(originalName)){
	          //  	job.put("-1", -1);
	          //  	sendJson.put("-1", -1);
		       // 	return sendJson.toJSONString();
		       // 	return job.toJSONString();	//잘못된 확장자 업로드
	           // }
	            
	            //용량 검사
	         //   sizeSum += image.getSize();
	         //   if(sizeSum >= LIMIT_SIZE) {
	         //   	job.put("-2", -2);
	         //   	sendJson.put("-2", -2);
		      //  	return sendJson.toJSONString();
		      //  	return job.toJSONString();	//용량초과
	          //  }
	            
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
	    			
	    			if(i < count) {
	    				oriname += originalName + ",";
		    			rename += renameFile + ",";
	    			}else {
	    				oriname += originalName;
		    			rename += renameFile;
	    			}
	    			
	            //System.out.println("확인이다 : " + oriname + "\n");
	            //System.out.println("확인이다 : " + rename + "\n");

	            i++;
	        }//for문 끝
	        
			//list 를 jarr 로 옮겨 저장 (복사)
	        
				//reviewfile 객체 저장할 json 객체
				JSONObject job = new JSONObject();
				
				job.put("rvoriginalname", URLEncoder.encode(oriname, "utf-8"));
				job.put("rvrename", rename);
				
			return job.toJSONString();	//JsonView 로 리턴할 경우
			
	        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
	        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
			
	    }
	    
	    //required above jdk 1.7 - switch(String)
	 //   private boolean isValidExtension(String originalName) {
	  //      String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
	  //      switch(originalNameExtension) {
	  //      case "jpg":
	  //      case "png":
	 //       case "gif":
	  //          return true;
	  //      }
	  //      return false;
	 //   }
	    
	    
	    
	    @RequestMapping(value="deleteReview5.do", method=RequestMethod.POST)
		public String deleteReview(@RequestParam(value="rvnum", required=true) int rvnum, 
												@RequestParam(value="consid", required=true) String consid, HttpServletRequest request) {
			
			ArrayList<ReviewFile> rvFile = reviewService.selectRvRename(rvnum);
	    	
			String path="";
			
			for(ReviewFile i : rvFile) {
				//System.out.println(i.getRvrename() + "\n");
				path = request.getSession().getServletContext().getRealPath("/resources/review_file/"); // 삭제할 파일의 경로
				
					File file = new File(path + "\\" + i.getRvrename());
					if(file.exists() == true){
					file.delete();
				}
			}
				
			int result = reviewService.deleteReview(rvnum);			
			
			return "redirect:pfOne5.do?consid=" + consid + "&message=review";
		}
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
}



