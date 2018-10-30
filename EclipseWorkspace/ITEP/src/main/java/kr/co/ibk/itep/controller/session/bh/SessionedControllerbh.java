package kr.co.ibk.itep.controller.session.bh;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.bh.Service;

@Controller
@SessionAttributes("login_info")
public class SessionedControllerbh {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerbh.class);
	
	@Autowired
	private Service service;


	//결재 페이지
	@RequestMapping("/approval")
	public String adminApproval( Model model) {
		
		//사용자의 개인정보
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		//접속한 사용자의 직번 획득
		String ssoid = empJoinedDep.getEmn();

		EmpJoinedDep empJoinedDep_2 = service.ssoLogin(ssoid);
		
		//접속한 사용자의 권한 획득
		String auth = empJoinedDep_2.getAuth_cd();
		

		try {
			//관리자 또는 서무만 접속 가능
			if(!auth.equals("04")) {
				if(auth.equals("01")){
					List<EduApproval> adminApprovalList = service.selectAllApprovalList();
					model.addAttribute("adminApproval_List", adminApprovalList);
				}else {
					List<EduApproval> adminApprovalList = service.selectDepApprovalList(ssoid);
					model.addAttribute("adminApproval_List", adminApprovalList);
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
	@RequestMapping("/approvalDetail")
	public String adminApprovalDetail( Model model) {
		
		//사용자의 개인정보
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		
		//접속한 사용자의 직번 획득
		String ssoid = empJoinedDep.getEmn();

		EmpJoinedDep empJoinedDep_2 = service.ssoLogin(ssoid);
		
		//접속한 사용자의 권한 획득
		String auth = empJoinedDep_2.getAuth_cd();
		

		try {
			//관리자 또는 서무만 접속 가능
			if(!auth.equals("04")) {
				if(auth.equals("01")){
					List<EduApproval> adminApprovalDetailList = service.selectDetailAllApprovalList();
					model.addAttribute("adminDetailApproval_List", adminApprovalDetailList);
				}else {
					List<EduApproval> adminApprovalDetailList = service.selectDetailDepApprovalList(ssoid);
					model.addAttribute("adminDetailApproval_List", adminApprovalDetailList);
				}
				
				return "approvalDetail";
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

		String emn = empJoinedDep.getEmn();
		
		EmpJoinedDep empJoinedDep_2 = service.ssoLogin(emn);
		
		//접속한 사용자의 권한 획득
		String auth = empJoinedDep_2.getAuth_cd();

		HashMap<String, String> approvalInfo = new HashMap<String, String>();

		try {
			//관리자 또는 서무만 접속 가능
			if(!auth.equals("04")) {
				for(int i =0; i<pmlist.size(); i++) {
					
					String split[] = pmlist.get(i).split(";", 0);
					
					approvalInfo. put("auth", auth);
					approvalInfo.put("emn", split[0]);
					approvalInfo.put("course_cd", split[1]);
					
					service.updateDepApproval(approvalInfo);	
					System.out.println(pmlist.get(i).toString());			
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
	
	//대시보드
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);

		//대시보드 막대그래프 (해당 월에 교육을 듣는 부서별 교육 수(인원 X))
		List<Map<String, Integer>> brcdEduCountList = service.selectBrcdEduCount();
		
		int[] BrCount = {15,21,12,7,14,10};

		
		for(int i=0; i<brcdEduCountList.size(); i++) {
			
			if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT기획부")) {
				BrCount[0] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT정보부")) {
				BrCount[1] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT수신카드부")) {
				BrCount[2] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT여신외환부")) {
				BrCount[3] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT채널부")) {
				BrCount[4] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(brcdEduCountList.get(i).get("KRN_BRM")).equals("IT시스템운영팀")) {
				BrCount[5] = Integer.parseInt(String.valueOf(brcdEduCountList.get(i).get("COUNT")));
			}

		}
		
		//대시보드 선그래프(당해년도 월별 교육 수강 현황)
		List<Map<String, Integer>> yearEduCountList = service.selectYearEduCount();
		
		int[] YrCount = {10,20,30,40,50,60,50,40,30,40,50,60};
		
		for(int i=0; i<yearEduCountList.size(); i++) {
			
			if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("01")) {
				YrCount[0] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("02")) {
				YrCount[1] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("03")) {
				YrCount[2] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("04")) {
				YrCount[3] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("05")) {
				YrCount[4] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("06")) {
				YrCount[5] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("07")) {
				YrCount[6] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("08")) {
				YrCount[7] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("09")) {
				YrCount[8] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("10")) {
				YrCount[9] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("11")) {
				YrCount[10] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCountList.get(i).get("MONTH")).equals("12")) {
				YrCount[11] = Integer.parseInt(String.valueOf(yearEduCountList.get(i).get("COUNT")));				
			}
		}
		
		//대시보드 파이그래프(당해년도 교육 카테고리별 수강 현황)
		List<Map<String, Integer>> yearEduCTCountList = service.selectYearCTEduCount();
		
		int[] YrCTCount = {5,2,3,4,1,6,5,4};		
		
		for(int i=0; i<yearEduCTCountList.size(); i++) {
			if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("프로그래밍")) {
				YrCTCount[0] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("데이터베이스")) {
				YrCTCount[1] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("서버")) {
				YrCTCount[2] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("네트워크")) {
				YrCTCount[3] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("OS")) {
				YrCTCount[4] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("보안")) {
				YrCTCount[5] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("웹")) {
				YrCTCount[6] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}else if(String.valueOf(yearEduCTCountList.get(i).get("MID_CLS_NM")).equals("모바일")) {
				YrCTCount[7] = Integer.parseInt(String.valueOf(yearEduCTCountList.get(i).get("COUNT")));				
			}			
		}
		
		//대시보드 상단 정보표(전체 교육 등록 수, 전체 교육 신청 수, 당월 교육 신청 수)
		int selectAllEduCount = service.selectAllEduCount();
		
		int selectYearAppEduCount = service.selectYearAppEduCount();
		
		int selectMonthAppEduCount = service.selectMonthAppEduCount();
		
		try {
			model.addAttribute("selectAllEduCount", selectAllEduCount);
			model.addAttribute("selectYearAppEduCount", selectYearAppEduCount);
			model.addAttribute("selectMonthAppEduCount", selectMonthAppEduCount);
			
			model.addAttribute("BrCount", BrCount);	
			model.addAttribute("YrCount", YrCount);
			model.addAttribute("YrCTCount", YrCTCount);
			
			model.addAttribute("empJoinedDep_info", empJoinedDep);		
		}
		catch(Exception e){
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "error";
		}

		return "dashboard";
	} 	
	
	//추후 고도화
	public int[] resultDataSet(String dataName, List<Map<String, Integer>> dataList) {

		int num=0;
		
		if(dataName.equals("부서별")) {
			num=6;
		}else if(dataName.equals("연간월별")) {
			num=12;
		}else if(dataName.equals("연간분야별")) {
			num=8;
		}
		int[] data = new int[num];
		
		//각 data 종류에 따른 for문 구현 필요
		
		
		
		return data;
	}

	
}
