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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.c4.intepark.auction.model.service.AuctionService;
import com.c4.intepark.auction.model.vo.Auction;
import com.c4.intepark.auction.model.vo.AuctionAttend;
import com.c4.intepark.auction.model.vo.NonAuction;
import com.c4.intepark.common.CommonPage;
import com.c4.intepark.common.Search;

@Controller
public class AuctionController {

	private static final Logger logger = LoggerFactory.getLogger(AuctionController.class);
	@Autowired
	private AuctionService auctionService;

	// @Autowired 애노테이션을 사용하면 get/set 접근 메서드를 더 이상 만들지 않아도 SpringFramework 이 설정 파일을
	// 통해서 알아서 get/set 접근 메서드 대신 실행함.
	public AuctionController() {
	}

//이중 검색 페이징
	@RequestMapping("auctionList2.do")
	public String auctionList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range,
			@RequestParam(value = "page1", required = false, defaultValue = "1") int page1,
			@RequestParam(value = "range1", required = false, defaultValue = "1") int range1,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "searchType1", required = false, defaultValue = "title") String searchType1,
			@RequestParam(value = "keyword1", required = false) String keyword1, Model model) {
		System.out.println("1" + searchType + ", 2" + keyword + ", 3" + searchType1 + ", 4" + keyword1);
		Search search = new Search();
		System.out.println(search.getKeyword());
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		int listCnt = auctionService.selectAuctionCount(search);
		System.out.println(listCnt);

		search.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", search);
		ArrayList<Auction> list = auctionService.auctionList(search);
		model.addAttribute("list", list);

		Search search1 = new Search();
		search1.setSearchType(searchType1);
		search1.setKeyword(keyword1);
		int listCnt1 = auctionService.selectNonAuctionCount(search1);
		System.out.println(listCnt1);
		search1.pageInfo(page1, range1, listCnt1);
		model.addAttribute("pagination1", search1);
		ArrayList<NonAuction> list1 = auctionService.NonAuctionList(search1);
		model.addAttribute("list1", list1);

		return "auction/auctionList";
	}

	@RequestMapping("auction2.do")
	public String auctionEnrollPage() {

		return "auction/auctionEnroll";
	}

	@RequestMapping("nonAuction2.do")
	public String nonAuctionEnrollPage() {

		return "auction/nonAuctionEnroll";
	}


	@RequestMapping("auctionChange2.do")
	public String selectAuctionChangePage(HttpServletRequest request, Auction auction, Model model,
			NonAuction nonauction) {
		String auc = request.getParameter("auc");
		String nonauc = request.getParameter("nonauc");

		logger.info("나는a야 : " + auc);
		logger.info("나는b야 : " + nonauc);

		if (auc != null) {
			auction = auctionService.auctionDetailView(auc);
			logger.info(auction.toString());
			logger.info("auctionfile : " + auction.getRfile());
			String[] rfile = null;
			if (auction.getRfile() != null) {
				rfile = auction.getRfile().split("/");
			}
			model.addAttribute("auction", auction);
			model.addAttribute("rfile", rfile);
		}
		if (nonauc != null) {
			nonauction = auctionService.nonAuctionDetailView(nonauc);
			logger.info(nonauction.toString());
			String[] rfile = null;
			if (nonauction.getRfile() != null) {
				rfile = nonauction.getRfile().split("/");
			}
			model.addAttribute("auction", nonauction);
			model.addAttribute("rfile", rfile);
		}
		if(nonauc != null) {
			nonauction = auctionService.nonAuctionDetailView(nonauc);
			logger.info(nonauction.toString());
			String[] rfile = null;
			if(nonauction.getRfile() != null) {
			rfile = nonauction.getRfile().split("/");
			}
			model.addAttribute("auction", nonauction);
			model.addAttribute("rfile", rfile);
					}
		/*
		 * if(nonauc != null) { NonAuction nonauction =
		 * auctionService.nonAuctionDetailView(nonauc); request.setAttribute("auction",
		 * nonauction); }
		 */
		return "auction/auctionChangePage";
	}

	@RequestMapping(value = "auctionEnroll2.do", method = RequestMethod.POST)
	public String auctionEnroll(Auction auction, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
		String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
		String ofile = "";
		String rfile = "";

		int i = 1;
		for (MultipartFile mf : fileList) {
			if (mf != null) { // 가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
				String originalFileName = null;
				String renameFileName = null;
				try {
					mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
					originalFileName = mf.getOriginalFilename();
					if (originalFileName != null) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
						i += 1;
						logger.info(originalFileName);
						logger.info(renameFileName + "," + "리네임 파일");
						// 파일명을 바꾸려면 File 객체의 renameTo() 사용함
						File originFile = new File(savePath + "\\" + originalFileName);
						File renameFile = new File(savePath + "\\" + renameFileName);

						// 파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
						if (!originFile.renameTo(renameFile)) {
							// 파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
							int read = -1;
							byte[] buf = new byte[1024]; // 한 번에 읽어서 저장할 바이트 배열

							FileInputStream fin = new FileInputStream(originFile);
							FileOutputStream fout = new FileOutputStream(renameFile);

							while ((read = fin.read(buf, 0, buf.length)) != -1) {
								fout.write(buf, 0, read);
							}

							fin.close();
							fout.close();
							originFile.delete(); // 원본 파일 삭제함.
						}
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				ofile += originalFileName + "/";
				rfile += renameFileName + "/";

				String ofile1 = ofile.substring(0, ofile.length() - 1);
				String rfile1 = rfile.substring(0, rfile.length() - 1);

				auction.setOfile(ofile1);
				auction.setRfile(rfile1);
			}
		}

		int result = auctionService.auctionEnroll(auction);

		logger.info("auction : " + auction);

		return "redirect:auctionList2.do";
	}

	@RequestMapping(value = "nonAuctionEnroll2.do", method = RequestMethod.POST)
	public String nonAuctionEnroll(NonAuction nonauction, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
		String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
		String ofile = "";
		String rfile = "";

		int i = 1;
		for (MultipartFile mf : fileList) {

			if (mf != null) { // 가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
				String originalFileName = null;
				String renameFileName = null;
				try {
					mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
					originalFileName = mf.getOriginalFilename();
					if (originalFileName != null) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
						i += 1;
						// 파일명을 바꾸려면 File 객체의 renameTo() 사용함
						File originFile = new File(savePath + "\\" + originalFileName);
						File renameFile = new File(savePath + "\\" + renameFileName);

						// 파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
						if (!originFile.renameTo(renameFile)) {
							// 파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
							int read = -1;
							byte[] buf = new byte[1024]; // 한 번에 읽어서 저장할 바이트 배열

							FileInputStream fin = new FileInputStream(originFile);
							FileOutputStream fout = new FileOutputStream(renameFile);

							while ((read = fin.read(buf, 0, buf.length)) != -1) {
								fout.write(buf, 0, read);
							}

							fin.close();
							fout.close();
							originFile.delete(); // 원본 파일 삭제함.
						}
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				ofile += originalFileName + "/";
				rfile += renameFileName + "/";

				String ofile1 = ofile.substring(0, ofile.length() - 1);
				String rfile1 = rfile.substring(0, rfile.length() - 1);

				nonauction.setOfile(ofile1);
				nonauction.setRfile(rfile1);
			}
		}

		int result = auctionService.nonAuctionEnroll(nonauction);

		logger.info("nonauction : " + nonauction);

		return "redirect:auctionList2.do";
	}

	@RequestMapping("auctionDetailView2.do")
	public String selectAuctionView(HttpServletRequest request, HttpServletResponse response) {
		String auc = request.getParameter("auc");
		String nonauc = request.getParameter("nonauc");

		logger.info("나는a야 : " + auc);
		logger.info("나는b야 : " + nonauc);
		if (auc != null) {
			Auction auction = auctionService.auctionDetailView(auc);
			logger.info("auctionfile : " + auction.getRfile());
			String[] rfile = null;
			if (auction.getRfile() != null) {
				rfile = auction.getRfile().split("/");
			}
			request.setAttribute("auction", auction);
			request.setAttribute("rfile", rfile);
		}
		if (nonauc != null) {
			NonAuction nonauction = auctionService.nonAuctionDetailView(nonauc);
			logger.info("auctionfile : " + nonauction.getRfile());
			String[] rfile = null;
			if (nonauction.getRfile() != null) {
				rfile = nonauction.getRfile().split("/");
			}
			request.setAttribute("auction", nonauction);
			request.setAttribute("rfile", rfile);
		}

		return "auction/auctionDetailView";
	}

	// 수정
	@RequestMapping(value = "AuctionUpdate2.do", method = RequestMethod.POST)
	public String auctionUpdate(Auction auction, HttpServletRequest request, MultipartHttpServletRequest mtfRequest,
			NonAuction nonauction) {
		String auc = request.getParameter("auctionno");
		String nonauc = request.getParameter("nonauctionno");

		logger.info("나는a야 : " + auc);
		logger.info("나는b야 : " + nonauc);

		if (auc != null) {
			auction.setAuctionno(Integer.parseInt(auc));
			List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
			String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
			String ofile = "";
			String rfile = "";
			int i = 1;
			if (fileList != null) {
				// 파일이 새로 업로드 될시 파일 삭제
				String rfile11 = mtfRequest.getParameter("rfile1");
				String rfile2 = mtfRequest.getParameter("rfile2");
				String rfile3 = mtfRequest.getParameter("rfile3");
				System.out.println(rfile11 + ", " + rfile2 + ", " + rfile3);
				if (rfile11 != null) {
					File originFile1 = new File(savePath + "\\" + rfile11);
					originFile1.delete();
					if (rfile2 != null) {
						File originFile2 = new File(savePath + "\\" + rfile2);
						originFile2.delete();
						if (rfile3 != null) {
							File originFile3 = new File(savePath + "\\" + rfile3);
							originFile3.delete();
						}
					}
				}
				for (MultipartFile mf : fileList) {
					if (mf != null) { // 가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
						String originalFileName = null;
						String renameFileName = null;
						try {
							mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
							originalFileName = mf.getOriginalFilename();
							if (originalFileName != null) {
								SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
								renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
										+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
								i += 1;
								logger.info(originalFileName);
								logger.info(renameFileName + "," + "리네임 파일");
								// 파일명을 바꾸려면 File 객체의 renameTo() 사용함
								File originFile = new File(savePath + "\\" + originalFileName);
								File renameFile = new File(savePath + "\\" + renameFileName);

								// 파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
								if (!originFile.renameTo(renameFile)) {
									// 파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
									int read = -1;
									byte[] buf = new byte[1024]; // 한 번에 읽어서 저장할 바이트 배열

									FileInputStream fin = new FileInputStream(originFile);
									FileOutputStream fout = new FileOutputStream(renameFile);

									while ((read = fin.read(buf, 0, buf.length)) != -1) {
										fout.write(buf, 0, read);
									}

									fin.close();
									fout.close();
									originFile.delete(); // 원본 파일 삭제함.
								}
							}
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						ofile += originalFileName + "/";
						rfile += renameFileName + "/";

						String ofile1 = ofile.substring(0, ofile.length() - 1);
						String rfile1 = rfile.substring(0, rfile.length() - 1);

						auction.setOfile(ofile1);
						auction.setRfile(rfile1);

					}
				}
			}
			logger.info("auction수정 : " + auction);
			int result = auctionService.auctionUpdate(auction);

		}
		if (nonauc != null) {
			nonauction.setAuctionno(Integer.parseInt(nonauc));
			List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
			String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
			String ofile = "";
			String rfile = "";
			int i = 1;
			if (fileList != null) {
				// 파일이 새로 업로드 될시 파일 삭제
				String rfile11 = mtfRequest.getParameter("rfile1");
				String rfile2 = mtfRequest.getParameter("rfile2");
				String rfile3 = mtfRequest.getParameter("rfile3");
				System.out.println(rfile11 + ", " + rfile2 + ", " + rfile3);
				if (rfile11 != null) {
					File originFile1 = new File(savePath + "\\" + rfile11);
					originFile1.delete();
					if (rfile2 != null) {
						File originFile2 = new File(savePath + "\\" + rfile2);
						originFile2.delete();
						if (rfile3 != null) {
							File originFile3 = new File(savePath + "\\" + rfile3);
							originFile3.delete();
						}
					}
				}
				for (MultipartFile mf : fileList) {
					if (mf != null) { // 가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
						String originalFileName = null;
						String renameFileName = null;
						try {
							mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
							originalFileName = mf.getOriginalFilename();
							if (originalFileName != null) {
								SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
								renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
										+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
								i += 1;
								logger.info(originalFileName);
								logger.info(renameFileName + "," + "리네임 파일");
								// 파일명을 바꾸려면 File 객체의 renameTo() 사용함
								File originFile = new File(savePath + "\\" + originalFileName);
								File renameFile = new File(savePath + "\\" + renameFileName);

								// 파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
								if (!originFile.renameTo(renameFile)) {
									// 파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
									int read = -1;
									byte[] buf = new byte[1024]; // 한 번에 읽어서 저장할 바이트 배열

									FileInputStream fin = new FileInputStream(originFile);
									FileOutputStream fout = new FileOutputStream(renameFile);

									while ((read = fin.read(buf, 0, buf.length)) != -1) {
										fout.write(buf, 0, read);
									}

									fin.close();
									fout.close();
									originFile.delete(); // 원본 파일 삭제함.
								}
							}
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						ofile += originalFileName + "/";
						rfile += renameFileName + "/";

						String ofile1 = ofile.substring(0, ofile.length() - 1);
						String rfile1 = rfile.substring(0, rfile.length() - 1);

						nonauction.setOfile(ofile1);
						nonauction.setRfile(rfile1);

					}
				}
			}
			logger.info("auction수정 : " + auction);

			int result = auctionService.NonAuctionUpdate(nonauction);

		}
		return "redirect:main.do";
	}

	@RequestMapping("auctionDelete2.do")
	public String deleteAuction(HttpServletRequest request) {
		String auction = request.getParameter("auc");
		logger.info("auction : " + auction);

		int result = auctionService.deleteAuction(auction);

		return "redirect:main.do";
	}
	/*
	 * @RequestMapping(value="auctionAttend2.do", method=RequestMethod.POST,
	 * produces="text/plain; charset=UTF-8") //produces="text/plain; charset=UTF-8"
	 * 인코딩하기
	 * 
	 * @ResponseBody // 리턴하는 json 문자열을 response 객체에 담아서 보내라는 의미의 어노테이션임 public
	 * String selectAuctionAttend(HttpServletRequest request, HttpServletResponse
	 * response) { System.out.println("실행됨");
	 * 
	 * int auction = Integer.parseInt(request.getParameter("auc"));
	 * logger.info("실행됨 : " + auction); ArrayList<AuctionAttend> list =
	 * auctionService.auctionAttendList(auction); logger.info("실행됨 : " +
	 * list.toString()); // 전송용 json 객체 JSONObject sendJson = new JSONObject(); //
	 * json 배열 객체 JSONArray jarr = new JSONArray();
	 * 
	 * for (AuctionAttend auc : list) { JSONObject job = new JSONObject();
	 * job.put("auctionno", auc.getAuctionno()); job.put("consid", auc.getConsid());
	 * job.put("title", auc.getTitle()); job.put("possibledate",
	 * auc.getPossibledate().toString()); job.put("price", auc.getPrice());
	 * job.put("ofile", auc.getOfile()); job.put("rfile", auc.getRfile());
	 * job.put("etc", auc.getEtc()); job.put("progress", auc.getProgress());
	 * 
	 * jarr.add(job); } logger.info("실행됨 : " + jarr); sendJson.put("list", jarr);
	 * 
	 * return sendJson.toJSONString(); }
	 */

	@RequestMapping("auctionEndList2.do")
	public String auctionEndList() {

		return "auction/auctionEndList2";
	}

	@RequestMapping("auctionAttend2.do")
	public String selectAuctionAttend(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, CommonPage cpage,
			Model model) {
		int listCount = 0;
		logger.info("실행됨 : " + cpage);
		listCount = auctionService.auctionAttendListCount(cpage);
		cpage.pageUpdate(6, 10, listCount, currentPage);
		ArrayList<AuctionAttend> list = auctionService.auctionAttendList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("list", list);

		return "auction/auctionAttendList";
	}

	@RequestMapping("auctionAttend22.do")
	public String auctionAttendlink(HttpServletRequest request) {
		int auction = Integer.parseInt(request.getParameter("auc"));
		logger.info("실행됨 : " + auction);
		request.setAttribute("auctionno", auction);
		return "auction/auctionAttend";
	}

	// 시공사 경매 참가
	@RequestMapping(value = "auctionAttendEnroll2.do", method = RequestMethod.POST)
	public String insertAuctionAttendEnroll(AuctionAttend att, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
		MultipartFile file = mtfRequest.getFile("upfile1");

		String savePath = request.getSession().getServletContext().getRealPath("resources/auctionUpFile");
		String ofile = "";
		String rfile = "";

		int i = 1;
		for (MultipartFile mf : fileList) {

			if (mf != null) { // 가지고있는 파일크기가 0이아니면 파일이있는 거라 true 가 발생함
				String originalFileName = null;
				String renameFileName = null;
				try {
					mf.transferTo(new File(savePath + "\\" + mf.getOriginalFilename()));
					originalFileName = mf.getOriginalFilename();
					if (originalFileName != null) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
						i += 1;
						// 파일명을 바꾸려면 File 객체의 renameTo() 사용함
						File originFile = new File(savePath + "\\" + originalFileName);
						File renameFile = new File(savePath + "\\" + renameFileName);

						// 파일 이름바꾸기 실행함 >> 실패한 경우에는 직접 바꾸기함
						if (!originFile.renameTo(renameFile)) {
							// 파일 입출력 스트림 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
							int read = -1;
							byte[] buf = new byte[1024]; // 한 번에 읽어서 저장할 바이트 배열

							FileInputStream fin = new FileInputStream(originFile);
							FileOutputStream fout = new FileOutputStream(renameFile);

							while ((read = fin.read(buf, 0, buf.length)) != -1) {
								fout.write(buf, 0, read);
							}

							fin.close();
							fout.close();
							originFile.delete(); // 원본 파일 삭제함.
						}
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				ofile += originalFileName + "/";
				rfile += renameFileName + "/";

				String ofile1 = ofile.substring(0, ofile.length() - 1);
				String rfile1 = rfile.substring(0, rfile.length() - 1);

				att.setOfile(ofile1);
				att.setRfile(rfile1);
			}
		}
		try {
			file.transferTo(new File(savePath + "\\" + file.getOriginalFilename()));
			att.setPanorama(file.getOriginalFilename());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		int result = auctionService.auctionAttendEnroll(att);

		logger.info("auctionAttend : " + att);

		return "redirect:main.do";
	}

	@RequestMapping("auctionAttendPop2.do")
	public String selectAuctionAttendPop(HttpServletRequest request, AuctionAttend auction) {
		int auctionno = Integer.parseInt(request.getParameter("auctionno"));
		String consname = request.getParameter("consname");
		auction.setAuctionno(auctionno);
		auction.setConsname(consname);

		AuctionAttend auctionAttend = auctionService.auctionAttendDetail(auction);
		// 진행상황 확인
		Auction auction1 = auctionService.AuctionProgress2(auctionno);
		String[] rfile = null;
		if (auctionAttend.getRfile() != null) {
			rfile = auctionAttend.getRfile().split("/");
		}
		request.setAttribute("att", auctionAttend);
		request.setAttribute("auc", auction1);
		if (rfile != null) {
			request.setAttribute("rfile", rfile);
		}
		return "auction/auctionAttendPop";
	}

	@RequestMapping("auctionAttendDelete2.do")
	public String deleteAuctionAttend(HttpServletRequest request, AuctionAttend auction) {
		int auctionno = Integer.parseInt(request.getParameter("auctionno"));
		String consname = request.getParameter("consname");
		auction.setAuctionno(auctionno);
		auction.setConsname(consname);
		logger.info(auctionno + " ," + consname);
		int result = auctionService.auctionAttendDelete(auction);

		return "redirect:main.do";
	}

	@RequestMapping(value = "nonAuctionDelete2.do", method = RequestMethod.POST)
	public String deleteNonAuction(HttpServletRequest request) {
		int auctionno = Integer.parseInt(request.getParameter("nonauc"));
		int result = auctionService.deleteNonAuction(auctionno);
		logger.info("실행됨" + auctionno);

		return "redirect:main.do";
	}

	@RequestMapping(value = "auctionAttendProgess2.do", method = RequestMethod.POST)
	public void updateAuctionAttendProgress(AuctionAttend att) {
		logger.info(att.toString());

		int result = auctionService.AuctionAttendProgress(att);
		int result2 = 0;
		if (result >= 1) {
			result2 = auctionService.AuctionProgress(att);
		}

	}

	/*
	 * @RequestMapping("auctionAttendUpdateView2.do") public String
	 * selectAttendUpdateView(HttpServletRequest request,Model model,AuctionAttend
	 * att) { int auctionno = Integer.parseInt(request.getParameter("auctionno"));
	 * AuctionAttend auctionAttend = auctionService.auctionAttendDetail(att);
	 * 
	 * model.addAttribute("att", auctionAttend);
	 * 
	 * return "auction/auctionAttendUpdateView"; }
	 */
	@RequestMapping("MyAuctionAttendList2.do")
	public String selectMyAuctionAttendList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, CommonPage cpage,
			Model model) {
		int listCount = 0;
		logger.info("실행됨 : " + cpage);
		listCount = auctionService.MyAuctionAttendListCount(cpage);
		cpage.pageUpdate(6, 10, listCount, currentPage);
		ArrayList<AuctionAttend> list = auctionService.MyAuctionAttendList(cpage);
		model.addAttribute("commonPage", cpage);
		model.addAttribute("list", list);

		return "auction/MyAuctionAttendList";
	}
}