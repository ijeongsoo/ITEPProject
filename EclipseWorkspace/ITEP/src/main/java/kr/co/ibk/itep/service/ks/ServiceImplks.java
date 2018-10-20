package kr.co.ibk.itep.service.ks;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ibk.itep.dao.ks.Dao;
import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Bri001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;

@Component
public class ServiceImplks implements Service {
	private static final Logger logger = LoggerFactory.getLogger(ServiceImplks.class);
	@Autowired
	private Dao dao;
	@Override
	public void insertExcelToDB(Object sheet, String flag, String fileName) {
		// TODO Auto-generated method stub
		Row titles = null;
		
		ArrayList<Edu001m> eduList = new ArrayList<Edu001m>();

        // 시트 전체 처리하기 위한 반복문
        for (Row row : (flag.equals("xls") ? (HSSFSheet) sheet : (XSSFSheet) sheet)) {
            if (row.getRowNum() == 0) {
                titles = row;
                continue;
            }
            // 건건이 처리하는 함수
            
            // 한 행별로 데이터 처리하는 함수, titles는 컬럼명 로우, row는 처리할 데이터 로우
            String colName = null;
            String colValue = null;
            Edu001m edu = new Edu001m();
     
            // FOR Section (S)
            for (Cell cell : row) {
                if (titles.getCell(cell.getColumnIndex()) == null || titles.getCell(cell.getColumnIndex()).equals("")) {
                    break;
                }
     
                colName = titles.getCell(cell.getColumnIndex()).getRichStringCellValue().getString().trim();
     
                switch (cell.getCellType()) {
                case STRING:
                    colValue = cell.getRichStringCellValue().getString();
                    break;
                case NUMERIC:
                    if (DateUtil.isCellDateFormatted(cell)) {
                        colValue = cell.getDateCellValue().toString();
                    } else {
                        Long roundVal = Math.round(cell.getNumericCellValue());
                        Double doubleVal = cell.getNumericCellValue();
                        if (doubleVal.equals(roundVal.doubleValue())) {
                            colValue = String.valueOf(roundVal);
                        } else {
                            colValue = String.valueOf(doubleVal);
                        }
                    }
                    break;
                case BOOLEAN:
                    colValue = String.valueOf(cell.getBooleanCellValue());
                    break;
                case FORMULA:
                    colValue = cell.getCellFormula();
                    break;
     
                default:
                    colValue = "";
                }
     
                colValue = colValue.trim();
                
                if (!colValue.isEmpty()) {
                	// 컬럼명 별로 데이터 처리
                	switch (colName) {
                	case "COURSE_CD":
                		edu.setCourse_cd(colValue);
                		break;
                	case "ORG_CD":
                		edu.setOrg_cd(colValue);
                		break;
                	case "CLS_CD":
                		edu.setCls_cd(colValue);
                		break;
                	case "COURSE_NM":
                		edu.setCourse_nm(colValue);
                		break;
                	case "EDU_HOUR":
                		edu.setEdu_hour(Integer.parseInt(colValue));
                		break;
                	case "REG_ST_DT":
                		edu.setReg_st_dt(colValue);
                		break;
                	case "REG_ED_DT":
                		edu.setReg_ed_dt(colValue);
                		break;
                	case "EDU_ST_DT":
                		edu.setEdu_st_dt(colValue);
                		break;
                	case "EDU_ED_DT":
                		edu.setEdu_ed_dt(colValue);
                		break;
                	case "EDU_COST":
                		edu.setEdu_cost(Integer.parseInt(colValue));
                		break;
                	case "LOC":
                		edu.setLocation(colValue);
                		break;
                	case "REFUND_YN":
                		edu.setRefund_yn(colValue);
                		break;
                	}
                    
                }
            }
            // 생성된 객체 추가
            eduList.add(edu);
        }
        // 시트 전체 처리 반복문 끝
        // dao 처리 시작
        dao.insertCourseList(eduList);
	}



}
