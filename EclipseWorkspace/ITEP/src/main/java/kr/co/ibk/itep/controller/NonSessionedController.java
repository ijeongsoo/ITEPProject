package kr.co.ibk.itep.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.Service;



@Controller
@SessionAttributes("login_info")
public class NonSessionedController {
	private static final Logger logger = LoggerFactory.getLogger(NonSessionedController.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	
	//@Scheduled(cron="0 0 20 * * * ")

	
	
	@RequestMapping("/")
	public String root() {
		return "root";
	} 
	
	
	@RequestMapping(value = "ssoLogin", method = RequestMethod.POST)
	public String ssoLogin(@ModelAttribute EmpJoinedDep login_info, String emn, Model model) {
		try{
			
			EmpJoinedDep empJoinedDep = service.ssoLogin(emn);
			
			if (empJoinedDep == null) {
				model.addAttribute("result", 0);
				return "loginFail";
			} else {
				model.addAttribute("login_info", empJoinedDep);
				return "home";
			}
			
		}catch(Exception e){
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "loginFail";
		}
		

	}
	
	
	@RequestMapping("/logIn")
	public String logIn() {
		return "logIn";
	} 
	
	@RequestMapping("/error")
	public String error() {
		return "error";
	} 	


	
	
}
