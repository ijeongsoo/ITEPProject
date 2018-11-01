package kr.co.ibk.itep.controller.session.ks;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.NotFoundException;
import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
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
import kr.co.ibk.itep.dto.Ecd002m;
import kr.co.ibk.itep.dto.Ecd005m;
import kr.co.ibk.itep.dto.Ecd006m;
import kr.co.ibk.itep.dto.Ecd007m;
import kr.co.ibk.itep.dto.EcdCode;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EduEditList;
import kr.co.ibk.itep.dto.EduExcelUpload;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.ks.Service;
import kr.co.ibk.itep.dto.JoinForEdulist; 

@Controller
@SessionAttributes("login_info")
public class SessionedControllerks {
	private static final Logger logger = LoggerFactory.getLogger(SessionedControllerks.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	
	// 관리자페이지 호출
	@RequestMapping("/admin")
	public String admin(String ssoid, Model model) {
		model.addAttribute("ssoid", ssoid);
		return "admin";
	} 
	
	// 교육등록 페이지 호출
	@RequestMapping("/eduUploadExcel")
	public String eduUploadExcel(Model model) {
		ArrayList<Edu001m> eduList = new ArrayList<Edu001m>();
		
		// 교육 관련 코드 json으로 만들어서 내려주기
		List<Ecd002m> ecd002m = service.selectEcd002mList();
		JSONArray jArr002 = new JSONArray();
		for(int i=0; i<ecd002m.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("text", ecd002m.get(i).getOrg_nm());
			obj.put("value", ecd002m.get(i).getOrg_cd());
			jArr002.put(obj);
		}
		List<Ecd005m> ecd005m = service.selectEcd005mList();
		JSONArray jArr005 = new JSONArray();
		for(int i=0; i<ecd005m.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("text", ecd005m.get(i).getHigh_cls_nm());
			obj.put("value", ecd005m.get(i).getHigh_cls_cd());
			jArr005.put(obj);
		}
		List<Ecd006m> ecd006m = service.selectEcd006mList();
		JSONArray jArr006 = new JSONArray();
		for(int i=0; i<ecd006m.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("text", ecd006m.get(i).getMid_cls_nm());
			obj.put("value", ecd006m.get(i).getMid_cls_cd());
			jArr006.put(obj);
		}
		List<Ecd007m> ecd007m = service.selectEcd007mList();
		JSONArray jArr007 = new JSONArray();
		for(int i=0; i<ecd007m.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("text", ecd007m.get(i).getLow_cls_nm());
			obj.put("value", ecd007m.get(i).getLow_cls_cd());
			jArr007.put(obj);
		}
		
		model.addAttribute("ecd002m", jArr002.toString());
		model.addAttribute("ecd005m", jArr005.toString());
		model.addAttribute("ecd006m", jArr006.toString());
		model.addAttribute("ecd007m", jArr007.toString());
		
		return "eduUploadExcel";
	}
	
	// 그리드 업로드로 교육등록
	@RequestMapping(value = "/uploadGrid", method = RequestMethod.POST)
	public String uploadGrid(String edu001m) {
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		JSONArray jArr = new JSONArray(edu001m);
		ArrayList<Edu001m> gridList = new ArrayList<Edu001m>();
		for(int i=0; i<jArr.length(); i++) {
			JSONObject obj = jArr.getJSONObject(i);
			Edu001m edu = new Edu001m(obj);
			edu.setReg_id(ssoid);
			gridList.add(edu);
		}
		service.insertGridToDB(gridList);
		return "redirect:eduEdit";
	}
	
	// 엑셀 파일 업로드로 교육 등록 기능
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String upload(EduExcelUpload excel) throws IllegalStateException, IOException, NotFoundException {
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		// 엑셀 파일 읽기
		excel.setOriginalFileName(excel.getExcelFile().getOriginalFilename());
		//excel.setFileType(excel.getExcelFile().getContentType());
		String fileName = new Date().getTime() + "-" + excel.getOriginalFileName();
		excel.setFileType(fileName.substring(fileName.lastIndexOf(".") + 1).trim());
		excel.setSavedFileName(fileName);

		String realPath = servletContext.getRealPath("/WEB-INF/upload/eduExcel/");
		File file = new File(realPath + fileName);
		excel.getExcelFile().transferTo(file);
		
		// 확장자별 처리로직
		if(excel.getFileType().equals("xlsx")) {
			// 신버전 엑셀
			XSSFWorkbook wb = new XSSFWorkbook(file.getPath());
            XSSFExcelExtractor extractor = new XSSFExcelExtractor(wb);
            extractor.setFormulasNotResults(true);
            extractor.setIncludeSheetNames(false);
            
            service.insertExcelToDB(wb.getSheetAt(0), "xlsx", fileName, ssoid);
            
		}
		else if(excel.getFileType().equals("xls")) {
			// 구버전 엑셀
			HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(file));
            ExcelExtractor extractor = new ExcelExtractor(wb);
            extractor.setFormulasNotResults(true);
            extractor.setIncludeSheetNames(false);
            
            service.insertExcelToDB(wb.getSheetAt(0), "xls", fileName, ssoid);
		}
		else {
			// 엑셀이 아닌 파일 업로드
			// 에러페이지 표시
			return "error";
		}
		return "redirect:eduEdit";
	}
	
	// 교육수정 리스트 페이지 호출
	@RequestMapping("/eduEdit")
	public String eduChange(Model model) {
		try{
			// 등록자 사번 가져오기
			RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
			EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
			String ssoid = empJoinedDep.getEmn();
			
			List<EduEditList> edulist = service.selectEduEditList();
			model.addAttribute("edulist", edulist);
			model.addAttribute("ssoid", ssoid);
			return "eduEdit";
		}catch(Exception e){
			logger.error(e.getStackTrace().toString());
			model.addAttribute("result", 1);
			return "error";
		}
	}
	
	// 교육수정 모달 페이지 호출
	@RequestMapping("/eduEditDetail")
	public String eduEditDetail(String course_cd, Model model){
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		// 해당 교육 정보 읽어오기
		Edu001m edu = service.selectEduInfo(course_cd);
		// 코드값 정보 리스트 불러오기
		List<Ecd002m> org = service.selectEcd002mList();
		List<Ecd005m> high = service.selectEcd005mList();
		List<Ecd006m> mid = service.selectEcd006mList();
		List<Ecd007m> low = service.selectEcd007mList();
		
		model.addAttribute("edu", edu);
		model.addAttribute("ssoid", ssoid);
		model.addAttribute("org", org);
		model.addAttribute("high", high);
		model.addAttribute("mid", mid);
		model.addAttribute("low", low);
		
		return "eduEditDetail";
	}
	
	// 교육수정 모달에서 저장 기능
	@RequestMapping(value = "/eduSave", method = RequestMethod.POST)
	public String eduSave(Edu001m edu) {
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		edu.setChg_id(ssoid);
		
		service.updateEduInfo(edu);
		
		return "redirect:eduEdit";
	}
	
	// 교육코드관리 페이지 호출
	@RequestMapping("/eduCode")
	public String eduCode(Model model){
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		// 기존 코드값 정보 리스트 불러오기
		List<Ecd002m> org = service.selectEcd002mList();
		List<Ecd005m> high = service.selectEcd005mList();
		List<Ecd006m> mid = service.selectEcd006mList();
		List<Ecd007m> low = service.selectEcd007mList();
		
		// 교육기관 json
		JSONArray orgJsonArr = new JSONArray();
		for(int i=0; i<org.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("org_cd", org.get(i).getOrg_cd());
			obj.put("org_nm", org.get(i).getOrg_nm());
			orgJsonArr.put(obj);
		}
		
		// 대분류 json
		JSONArray highJsonArr = new JSONArray();
		for(int i=0; i<high.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("high_cls_cd", high.get(i).getHigh_cls_cd());
			obj.put("high_cls_nm", high.get(i).getHigh_cls_nm());
			highJsonArr.put(obj);
		}
		
		// 중분류 json
		JSONArray midJsonArr = new JSONArray();
		JSONArray midCombo = new JSONArray();
		for(int i=0; i<mid.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("mid_cls_cd", mid.get(i).getMid_cls_cd());
			obj.put("mid_cls_nm", mid.get(i).getMid_cls_nm());
			midJsonArr.put(obj);
			
			JSONObject combo = new JSONObject();
			combo.put("text", mid.get(i).getMid_cls_nm());
			combo.put("value", mid.get(i).getMid_cls_cd());
			midCombo.put(combo);
		}
		
		// 소분류 json
		JSONArray lowJsonArr = new JSONArray();

		for(int i=0; i<low.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("low_cls_cd", low.get(i).getLow_cls_cd());
			obj.put("low_cls_nm", low.get(i).getLow_cls_nm());
			obj.put("mid_cls_cd", low.get(i).getMid_cls_cd());
			lowJsonArr.put(obj);
		}
		
		model.addAttribute("ssoid", ssoid);
		model.addAttribute("orgList", orgJsonArr.toString());
		model.addAttribute("highList", highJsonArr.toString());
		model.addAttribute("midList", midJsonArr.toString());
		model.addAttribute("lowList", lowJsonArr.toString());
		model.addAttribute("midCombo", midCombo.toString());
		
		return "eduCode";
	}
	
	// 교육코드관리 저장 기능
	@RequestMapping(value = "/saveCode", method = RequestMethod.POST)
	public String saveCode(String ecd002m, String ecd005m, String ecd006m, String ecd007m) {
		// 등록자 사번 가져오기
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info", RequestAttributes.SCOPE_SESSION);
		String ssoid = empJoinedDep.getEmn();
		
		// 기존데이터 리스트 세팅
		List<Ecd002m> orgOldList = service.selectEcd002mList();
		List<Ecd005m> highOldList = service.selectEcd005mList();
		List<Ecd006m> midOldList = service.selectEcd006mList();
		List<Ecd007m> lowOldList = service.selectEcd007mList();
		
		// 교육기관 파싱
		JSONArray jArr002 = new JSONArray(ecd002m);
		ArrayList<Ecd002m> orgNewList = new ArrayList<Ecd002m>();
		for(int i=0; i<jArr002.length(); i++) {
			JSONObject obj = jArr002.getJSONObject(i);
			Ecd002m org = new Ecd002m(obj);
			orgNewList.add(org);
		}
		// 대분류 파싱
		JSONArray jArr005 = new JSONArray(ecd005m);
		ArrayList<Ecd005m> highNewList = new ArrayList<Ecd005m>();
		for(int i=0; i<jArr005.length(); i++) {
			JSONObject obj = jArr005.getJSONObject(i);
			Ecd005m high = new Ecd005m(obj);
			highNewList.add(high);
		}
		// 중분류 파싱
		JSONArray jArr006 = new JSONArray(ecd006m);
		ArrayList<Ecd006m> midNewList = new ArrayList<Ecd006m>();
		for(int i=0; i<jArr006.length(); i++) {
			JSONObject obj = jArr006.getJSONObject(i);
			Ecd006m mid = new Ecd006m(obj);
			midNewList.add(mid);
		}
		// 소분류 파싱
		JSONArray jArr007 = new JSONArray(ecd007m);
		ArrayList<Ecd007m> lowNewList = new ArrayList<Ecd007m>();
		for(int i=0; i<jArr007.length(); i++) {
			JSONObject obj = jArr007.getJSONObject(i);
			Ecd007m low = new Ecd007m(obj);
			lowNewList.add(low);
		}
		
		// 교육기관 리스트 insert + update
		ArrayList<EcdCode> insertCodeList = new ArrayList<EcdCode>();
		ArrayList<EcdCode> updateCodeList = new ArrayList<EcdCode>();
		for(int i=orgOldList.size(); i<orgNewList.size(); i++) {
			Ecd002m org = orgNewList.get(i);
			org.setReg_id(ssoid);
			org.setEcdName("Ecd002m");
			insertCodeList.add(org);
		}
		for(int i=0; i<orgOldList.size(); i++) {
			if(!orgOldList.get(i).isEqual(orgNewList.get(i))) {
				// 동일하지 않다면
				Ecd002m org = orgNewList.get(i);
				org.setChg_id(ssoid);
				org.setEcdName("Ecd002m");
				updateCodeList.add(org);
			}
		}
		
		// 대분류 리스트 insert + update
		for(int i=highOldList.size(); i<highNewList.size(); i++) {
			Ecd005m high = highNewList.get(i);
			high.setReg_id(ssoid);
			high.setEcdName("Ecd005m");
			insertCodeList.add(high);
		}
		for(int i=0; i<highOldList.size(); i++) {
			if(!highOldList.get(i).isEqual(highNewList.get(i))) {
				// 동일하지 않다면
				Ecd005m high = highNewList.get(i);
				high.setChg_id(ssoid);
				high.setEcdName("Ecd005m");
				updateCodeList.add(high);
			}
		}
		
		// 중분류 리스트 insert + update
		for(int i=midOldList.size(); i<midNewList.size(); i++) {
			Ecd006m mid = midNewList.get(i);
			mid.setReg_id(ssoid);
			mid.setEcdName("Ecd006m");
			insertCodeList.add(mid);
		}
		for(int i=0; i<midOldList.size(); i++) {
			if(!midOldList.get(i).isEqual(midNewList.get(i))) {
				// 동일하지 않다면
				Ecd006m mid = midNewList.get(i);
				mid.setChg_id(ssoid);
				mid.setEcdName("Ecd006m");
				updateCodeList.add(mid);
			}
		}
		
		// 소분류 리스트 insert + update
		for(int i=lowOldList.size(); i<lowNewList.size(); i++) {
			Ecd007m low = lowNewList.get(i);
			low.setReg_id(ssoid);
			low.setEcdName("Ecd007m");
			insertCodeList.add(low);
		}
		for(int i=0; i<lowOldList.size(); i++) {
			if(!lowOldList.get(i).isEqual(lowNewList.get(i))) {
				// 동일하지 않다면
				Ecd007m low = lowNewList.get(i);
				low.setChg_id(ssoid);
				low.setEcdName("Ecd007m");
				updateCodeList.add(low);
			}
		}
		
		// 서비스 호출
		service.insertCodeAll(insertCodeList);
		service.updateCodeAll(updateCodeList);
		
		return "eduCode";
	}
}
