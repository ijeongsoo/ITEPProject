﻿package kr.co.ibk.itep.controller.session.js;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;


import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.CountInfo;
import kr.co.ibk.itep.dto.Edu002r;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.Edu003r;
import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.js.Service;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.RegistEduPullInfo; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerjs {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerjs.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	

	
	
	@RequestMapping("/home")
	public String home( Model model, String result) {
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		String emn = empJoinedDep.getEmn();
		
		ArrayList<EduJoinedEcd> top8List = new ArrayList<>();
		ArrayList<EduJoinedEcd> top8List1 = new ArrayList<>();
		ArrayList<EduJoinedEcd> top8List2 = new ArrayList<>();
		ArrayList<EduJoinedEcd> ddayList = new ArrayList<>();
		ArrayList<EduJoinedEcd> categoryList = new ArrayList<>();
		
		List<RegistEduPullInfo> myRegistList = new ArrayList<>();
		List<RegistEduPullInfo> myStudyList = new ArrayList<>();
		List<RegistEduPullInfo> mySurveyList = new ArrayList<>();
		List<RegistEduPullInfo> myRecentList = new ArrayList<>();
		
		


		
		top8List = service.getTop8Edu();
		for(int i=0; i<top8List.size(); i++){
			if( i/4 < 1){
				top8List1.add(top8List.get(i));
			}else{
				top8List2.add(top8List.get(i));
			}
		}
		
		ddayList = service.getDDayEdu();
		categoryList = service.getCategoryEdu();
		
		myRegistList = service.getMyRegistList(emn);
		myStudyList = service.getMyStudyList(emn);
		mySurveyList = service.getMySurveyList(emn);
		myRecentList = service.getMyRecentList(emn);

		model.addAttribute("top8List1", top8List1);
		model.addAttribute("top8List2", top8List2);

		model.addAttribute("ddayList", ddayList);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("myRegistList", myRegistList);
		model.addAttribute("myStudyList", myStudyList);
		model.addAttribute("mySurveyList", mySurveyList);
		model.addAttribute("myRecentList", myRecentList);
		
		model.addAttribute("myRegistListCount", myRegistList.size());
		model.addAttribute("myStudyListCount", myStudyList.size());
		model.addAttribute("mySurveyListCount", mySurveyList.size());
		model.addAttribute("myRecentListCount", myRecentList.size());

		if(result != null){
			model.addAttribute("result", result);
		}
		
		return "home";
	} 
	
	
	@RequestMapping("/file")
	public void download(String svr_img_file_nm, String img_file_type, String source, HttpServletResponse r,
			@RequestHeader("User-Agent") String userAgent) throws IOException {
		String fileName = svr_img_file_nm;
		String encFileName;
		if (userAgent.contains("MSIE") || userAgent.contains("Trident") || userAgent.contains("Edge")) {
			encFileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			encFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		r.addHeader("Content-Disposition", "attachment; filename=\"" + encFileName + "\"");
		// 2. 파일의 종류
		r.addHeader("Content-Type", img_file_type);
		// 3. 파일의 크기(옵션)
		r.addHeader(fileName, fileName);
		File file = null;

		if(source == null){
			file = new File(servletContext.getRealPath("/WEB-INF/upload/eduImg/" + fileName));

		}else if(source.equals("reg")){
			file = new File(servletContext.getRealPath("/WEB-INF/upload/reg/" + fileName));

		}else if(source.equals("plan")){
			file = new File(servletContext.getRealPath("/WEB-INF/upload/plan/" + fileName));

		}
		

		long fileSize = file.length();
		r.addHeader("Content-Length", String.valueOf(fileSize));

		
		OutputStream os = r.getOutputStream();
		FileInputStream fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, os);
		
		os.flush();
		fis.close();
		os.close();

	}
	
	
	@RequestMapping("/eduDetail")
	public String eduDetail( String course_cd, Model model) {
		
		logger.info(course_cd);
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		Edu002rAttach eduConfirm = new Edu002rAttach();
		eduConfirm.setEmn(empJoinedDep.getEmn());
		eduConfirm.setCourse_cd(course_cd);
		
		EduPullInfo edu = service.getEduByCourseCD(course_cd);
		int result = service.regConfirm(eduConfirm);
		
		model.addAttribute("edu", edu);
		model.addAttribute("result", result);

		
		return "eduDetail";
	} 
	
	@RequestMapping("/infoDetail")
	public String infoDetail( String course_cd, Model model) {
		
		logger.info(course_cd);
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		RegistEduPullInfo myEdu = new RegistEduPullInfo();
		myEdu.setEmn(empJoinedDep.getEmn());
		myEdu.setCourse_cd(course_cd);
		
		RegistEduPullInfo edu = service.getEdu(myEdu);
		
		model.addAttribute("edu", edu);

		
		return "infoDetail";
	}
	
	@RequestMapping("/recentDetail")
	public String recentDetail( String course_cd, Model model) {
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		RegistEduPullInfo myEdu = new RegistEduPullInfo();
		myEdu.setEmn(empJoinedDep.getEmn());
		myEdu.setCourse_cd(course_cd);
		
		RegistEduPullInfo edu = service.getFinishedEdu(myEdu);
		
		logger.info(edu.getEmn());
		logger.info(edu.getCourse_nm());
		logger.info(String.valueOf(edu.getSur_point()));
		
		
		model.addAttribute("edu", edu);

		
		return "recentDetail";
	}

	@RequestMapping("/survayDetail")
	public String survayDetail( String course_cd, Model model) {
		
		logger.info(course_cd);
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		RegistEduPullInfo myEdu = new RegistEduPullInfo();
		myEdu.setEmn(empJoinedDep.getEmn());
		myEdu.setCourse_cd(course_cd);
		
		RegistEduPullInfo edu = service.getEdu(myEdu);
		
		model.addAttribute("edu", edu);

		
		return "survayDetail";
	} 
	
	
	
	@RequestMapping(value = "/regEdu", method = RequestMethod.POST)
	public void regEdu( Edu002rAttach edu, HttpServletResponse response ) throws IllegalStateException, IOException {
		edu.setOrigin_reg_file_nm(edu.getRegAttach().getOriginalFilename()); 
		edu.setReg_file_type(edu.getRegAttach().getContentType());
		String regfileName = new Date().getTime() + "-" + edu.getOrigin_reg_file_nm();
		edu.setSvr_reg_file_nm(regfileName);
		
		edu.setOrigin_plan_file_nm(edu.getPlanAttach().getOriginalFilename());
		edu.setPlan_file_type(edu.getPlanAttach().getContentType());
		String planfileName = new Date().getTime() + "-" + edu.getOrigin_plan_file_nm();
		edu.setSvr_plan_file_nm(planfileName);
		

		
		int result = service.registEdu(edu);


		if(result == 1){
			String regfileRealPath = servletContext.getRealPath("/WEB-INF/upload/reg/");
			String planfileRealPath = servletContext.getRealPath("/WEB-INF/upload/plan/");

			File regfile = new File(regfileRealPath + regfileName);
			File planfile = new File(planfileRealPath + planfileName);
			
			edu.getRegAttach().transferTo(regfile);
			edu.getPlanAttach().transferTo(planfile);
			
		}
		
		List<RegistEduPullInfo> myRegistList = service.getMyRegistList(edu.getEmn());

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		jsonObject.put("list",myRegistList );
		jsonObject.put("count", myRegistList.size());

		String json = jsonObject.toString();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw;
		
		pw=response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
		

	}
	
	@RequestMapping(value = "/survay", method = RequestMethod.POST)
	public void survay( Edu003r edu003r, HttpServletResponse response) throws IOException {
				
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		


		edu003r.setEmn(empJoinedDep.getEmn());
		
		
		JSONObject jsonObject = new JSONObject();

		try{
			service.survay(edu003r);
			jsonObject.put("result", 1);

		}catch(Exception e){
			jsonObject.put("result", 0);
			
		}finally{
			List<RegistEduPullInfo> mySurveyList = service.getMySurveyList(empJoinedDep.getEmn());
			List<RegistEduPullInfo> myRecentList = service.getMyRecentList(empJoinedDep.getEmn());
			CountInfo countInfo = service.getCountInfo(empJoinedDep.getEmn());

			jsonObject.put("survayList",mySurveyList );
			jsonObject.put("recentList",myRecentList );
			jsonObject.put("totalCount",countInfo.getTotalCount() );
			jsonObject.put("totalHour",countInfo.getTotalHour() );
			jsonObject.put("totalAmount",countInfo.getTotalAmount() );

			jsonObject.put("survayCount", mySurveyList.size());
			jsonObject.put("recentCount", myRecentList.size());
			String json = jsonObject.toString();
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter pw;
			
			pw=response.getWriter();
			pw.write(json);
			pw.flush();
			pw.close();

		}


	} 
	
	
	@RequestMapping("/myInfomation")
	public String myInfomation( Model model) {
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		String emn = empJoinedDep.getEmn();
		long totalAmount = service.getTotalAmount(emn);

		
		List<RegistEduPullInfo> myRegistList = new ArrayList<>();
		List<RegistEduPullInfo> myStudyList = new ArrayList<>();
		List<RegistEduPullInfo> mySurveyList = new ArrayList<>();
		List<RegistEduPullInfo> myRecentList = new ArrayList<>();
		
		CountInfo countInfo = new CountInfo();
		
		myRegistList = service.getMyRegistList(emn);
		myStudyList = service.getMyStudyList(emn);
		mySurveyList = service.getMySurveyList(emn);
		myRecentList = service.getMyRecentList(emn);
		countInfo = service.getCountInfo(emn);
		
		
		model.addAttribute("myRegistList", myRegistList);
		model.addAttribute("myStudyList", myStudyList);
		model.addAttribute("mySurveyList", mySurveyList);
		model.addAttribute("myRecentList", myRecentList);
		
		model.addAttribute("myRegistListCount", myRegistList.size());
		model.addAttribute("myStudyListCount", myStudyList.size());
		model.addAttribute("mySurveyListCount", mySurveyList.size());
		model.addAttribute("myRecentListCount", myRecentList.size());
				
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("countInfo", countInfo);
		
		

		return "myInfomation";
	} 

	
}
