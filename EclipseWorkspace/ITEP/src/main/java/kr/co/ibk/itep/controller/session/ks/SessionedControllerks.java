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
	
	@RequestMapping("/admin")
	public String admin(String ssoid, Model model) {
		model.addAttribute("ssoid", ssoid);
		return "admin";
	} 
	

	@RequestMapping("/eduUploadExcel")
	public String eduUploadExcel(Model model) {
		return "eduUploadExcel";
	}
	
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
}
