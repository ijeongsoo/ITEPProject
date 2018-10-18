﻿package kr.co.ibk.itep.controller.session.js;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.js.Service;
import kr.co.ibk.itep.dto.JoinForEdulist; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerjs {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerjs.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	

	
	
	@RequestMapping("/home")
	public String home( Model model) {
		ArrayList<EduJoinedEcd> top8List = new ArrayList<>();
		ArrayList<EduJoinedEcd> top8List1 = new ArrayList<>();
		ArrayList<EduJoinedEcd> top8List2 = new ArrayList<>();
		ArrayList<EduJoinedEcd> ddayList = new ArrayList<>();
		ArrayList<EduJoinedEcd> categoryList = new ArrayList<>();

		
		top8List = service.getTop8Edu();
		logger.info( " ####################"+ top8List.size() );
		for(int i=0; i<top8List.size(); i++){
			if( i/4 < 1){
				top8List1.add(top8List.get(i));
			}else{
				top8List2.add(top8List.get(i));
			}
		}
		
		ddayList = service.getDDayEdu();
		categoryList = service.getCategoryEdu();

		model.addAttribute("top8List1", top8List1);
		model.addAttribute("top8List2", top8List2);

		model.addAttribute("ddayList", ddayList);
		model.addAttribute("categoryList", categoryList);

		return "home";
	} 
	
	
	@RequestMapping("/file")
	public void download(String svr_img_file_nm, String img_file_type, HttpServletResponse r,
			@RequestHeader("User-Agent") String userAgent) throws IOException {
		logger.info(svr_img_file_nm);
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

		file = new File(servletContext.getRealPath("/WEB-INF/upload/eduImg/" + fileName));

		long fileSize = file.length();
		r.addHeader("Content-Length", String.valueOf(fileSize));

		OutputStream os = r.getOutputStream();
		FileInputStream fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, os);
		os.flush();
		fis.close();
		os.close();

	}

	
}