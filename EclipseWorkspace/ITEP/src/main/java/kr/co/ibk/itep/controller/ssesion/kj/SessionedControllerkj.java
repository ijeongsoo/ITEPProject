package kr.co.ibk.itep.controller.ssesion.kj;


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
import kr.co.ibk.itep.service.kj.Service;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.JoinForPostEdulist; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerkj {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerkj.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/EduList")
	public String EduList(String ssoid, Model model) {
		try{
			
			List<JoinForEdulist> joinForEdulist = service.selectEdulist();
			List<JoinForPostEdulist> joinForPostEdulist = service.selectPostEdulist();
				model.addAttribute("edu_list", joinForEdulist);
				model.addAttribute("post_edulist",joinForPostEdulist);
				model.addAttribute("ssoid", ssoid);
				return "EduList";
		}catch(Exception e){
			
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "error";
		}
	}
	

	
}
