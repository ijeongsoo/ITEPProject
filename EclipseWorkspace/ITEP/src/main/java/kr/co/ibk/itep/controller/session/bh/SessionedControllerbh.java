package kr.co.ibk.itep.controller.session.bh;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

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
import kr.co.ibk.itep.service.bh.Service;
import kr.co.ibk.itep.dto.JoinForEdulist; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerbh {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerbh.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	


	//결재 페이지
	@RequestMapping("/approval")
	public String adminApproval( Model model) {
		
		//사용자의 개인정보
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		//접속한 사용자의 직번 획득
		String ssoid = empJoinedDep.getEmn();

		//접속한 사용자의 권한 획득
		String auth = empJoinedDep.getAuth_cd();
		

		try {
			//관리자 또는 서무만 접속 가능
			if(!auth.equals("04")) {
				List<EduApproval> adminApprovalList = service.selectDepApprovalList(ssoid);
				model.addAttribute("adminApproval_List", adminApprovalList);
				model.addAttribute("empJoinedDep_info", empJoinedDep);
				if(auth.equals("01")){
					
				}else if(auth.equals("02")){
					
				}else if(auth.equals("03")){
					
				}
				
				return "approval";
			}

			//model.addAttribute("ssoid", ssoid);
			return "error";
		}catch(Exception e){
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "error";
		}

	} 
	
	
	//결재 페이지
	@RequestMapping("/updateApproval.do")
	public String permissionApproval(@RequestParam List<String> pmlist, Model model) {
		
		//직번
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);

		//접속한 사용자의 권한 획득
		String auth = empJoinedDep.getAuth_cd();

		HashMap<String, String> approvalInfo = new HashMap<String, String>();
		
		for(int i =0; i<pmlist.size(); i++) {
		
			String split[] = pmlist.get(i).split(";", 0);
			
			approvalInfo.put("auth", auth);
			approvalInfo.put("emn", split[0]);
			approvalInfo.put("course_cd", split[1]);
			
			
			System.out.println(pmlist.get(i).toString());			
		}
		

		try {
			//관리자 또는 서무만 접속 가능
			if(!auth.equals("04")) {
				for(int i=0; i<approvalInfo.size(); i++) {
					service.updateDepApproval(approvalInfo);					
				}
				
				return "approval";
			}

			//model.addAttribute("ssoid", ssoid);
			return "error";
		}catch(Exception e){
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "error";
		}

	} 	
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);

		model.addAttribute("empJoinedDep_info", empJoinedDep);
		return "dashboard";
	} 	

	
}
