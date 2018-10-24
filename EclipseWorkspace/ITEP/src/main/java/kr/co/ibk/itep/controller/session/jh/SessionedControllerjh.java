package kr.co.ibk.itep.controller.session.jh;


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
import kr.co.ibk.itep.dto.AthJoinedEmpJoinedBri;
import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.jh.Service;
import kr.co.ibk.itep.dto.JoinForEdulist; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerjh {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerjh.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/authority")
	public String authority( Model model, AthJoinedEmpJoinedBri athJoinedEmpJoinedBri) {
		List<AthJoinedEmpJoinedBri> auth_list = new ArrayList<>();
		
		logger.info( athJoinedEmpJoinedBri.getKeyword());

		auth_list = service.getAuthList(athJoinedEmpJoinedBri);
		model.addAttribute("auth_list", auth_list);
		model.addAttribute("searchOption", athJoinedEmpJoinedBri.getSearchOption());
		model.addAttribute("keyword", athJoinedEmpJoinedBri.getKeyword());

		
		return "authority";
	} 
	
	@RequestMapping("/updateAuthority.do")
	public String updateAuthority(@RequestParam String updateData, Model model) {
				System.out.println(updateData+"1");
		HashMap<String, String> authorityInfo = new HashMap<String, String>();
		
		String split[] = updateData.split(";", 0);
		String auth_cd = "";

		if(split[1].equals("교육관리자")) {
			auth_cd = "01";			
		}else if(split[1].equals("서무차장")) {
			auth_cd = "02";
		}else if(split[1].equals("서무담당")) {
			auth_cd = "03";
		}else if(split[1].equals("교육관리자")) {
			auth_cd = "04";
		}
		
		System.out.println(auth_cd);
	
		authorityInfo.put("emn", split[0]);	
		authorityInfo.put("auth_cd", auth_cd);

		service.changeAuth(authorityInfo);
		System.out.println(authorityInfo.get("emn"));
		return "authority";
	} 	
	
	
	
//	@RequestMapping("/authority")
//	public String delete_auth(Model model, AthJoinedEmpJoinedBri athJoinedEmpJoinedBri) {
		
//		List<AthJoinedEmpJoinedBri> auth_cha = new ArrayList<>();
//		auth_cha = service.changeAuthList(athJoinedEmpJoinedBri);
		
//		return "authority";
//	}

	
}
