package kr.co.ibk.itep.service.ks;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dao.ks.Dao;
import kr.co.ibk.itep.dto.Ecd002m;
import kr.co.ibk.itep.dto.Ecd005m;
import kr.co.ibk.itep.dto.Ecd006m;
import kr.co.ibk.itep.dto.Ecd007m;
import kr.co.ibk.itep.dto.EcdCode;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduEditList;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;

@Component
public class ServiceImplks implements Service {
	private static final Logger logger = LoggerFactory.getLogger(ServiceImplks.class);
	@Autowired
	private Dao dao;
	
	@Override
	public EmpJoinedDep ssoLogin(String emn) {
		// TODO Auto-generated method stub
		EmpJoinedDep empJoinedDep = dao.selectByEmn(emn);

		return empJoinedDep;
	}
	
	@Override
	public void insertExcelToDB(Object sheet, String flag, String fileName, String ssoid) throws NotFoundException {
		// TODO Auto-generated method stub
		Row titles = null;
		
		ArrayList<Edu001m> eduList = new ArrayList<Edu001m>();

		List<Ecd002m> ecd002m = dao.selectEcd002mList();
		List<Ecd005m> ecd005m = dao.selectEcd005mList();
		List<Ecd006m> ecd006m = dao.selectEcd006mList();
		List<Ecd007m> ecd007m = dao.selectEcd007mList();
		
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
                	case "ORG_CD":
                		// 코드이름 찾기
                		for(int i=0; i<ecd002m.size(); i++) {
                			if(ecd002m.get(i).getOrg_nm().equals(colValue)) {
                				edu.setOrg_cd(ecd002m.get(i).getOrg_cd());
                				break;
                			}
                			if(i==ecd002m.size()-1) {
                				// 같은 값이 없다면 Exception throw
                        		throw new NotFoundException("ORG_CD");
                			}
                		}
                		break;
                	case "HIGH_CLS_CD":
                		// 코드이름 찾기
                		for(int i=0; i<ecd005m.size(); i++) {
                			if(ecd005m.get(i).getHigh_cls_nm().equals(colValue)) {
                				edu.setHigh_cls_cd(ecd005m.get(i).getHigh_cls_cd());
                				break;
                			}
                			if(i==ecd005m.size()-1) {
                				// 같은 값이 없다면 Exception throw
                        		throw new NotFoundException("HIGH_CLS_CD");
                			}
                		}
                		break;
                	case "MID_CLS_CD":
                		// 코드이름 찾기
                		for(int i=0; i<ecd006m.size(); i++) {
                			if(ecd006m.get(i).getMid_cls_nm().equals(colValue)) {
                				edu.setMid_cls_cd(ecd006m.get(i).getMid_cls_cd());
                				break;
                			}
                			if(i==ecd006m.size()-1) {
                				// 같은 값이 없다면 Exception throw
                        		throw new NotFoundException("MID_CLS_CD");
                			}
                		}
                		break;
                	case "LOW_CLS_CD":
                		// 코드이름 찾기 및 서버 이미지 디폴트 값 생성
                		for(int i=0; i<ecd007m.size(); i++) {
                			if(ecd007m.get(i).getLow_cls_nm().equals(colValue)) {
                				edu.setLow_cls_cd(ecd007m.get(i).getLow_cls_cd());
                				edu.setOrigin_img_file_nm(ecd007m.get(i).getDefault_origin_img_nm());
                				edu.setSvr_img_file_nm(ecd007m.get(i).getDefault_svr_img_nm());
                				edu.setImg_file_type(ecd007m.get(i).getDefault_img_type());
                				break;
                			}
                			if(i==ecd007m.size()-1) {
                				// 같은 값이 없다면 Exception throw
                        		throw new NotFoundException("LOW_CLS_CD");
                			}
                		}
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
                		edu.setLoc(colValue);
                		break;
                	case "REFUND_YN":
                		edu.setRefund_yn(colValue);
                		break;
                	}
                }
            }
        	// 등록자 사번 세팅
        	edu.setReg_id(ssoid);
        	
            // db에서 시퀀스 채번
        	String courseCd = dao.selectCourseSeq();
        	edu.setCourse_cd(courseCd);
        	
            // 생성된 객체 추가
            eduList.add(edu);
        }
        // 시트 전체 처리 반복문 끝
        // dao 처리 시작
        dao.insertCourseList(eduList);
	}
	
	@Override
	public List<EduEditList> selectEduEditList() {
		// TODO Auto-generated method stub
		List<EduEditList> eduList = dao.selectEduEditList();
		return eduList;
	}

	@Override
	public Edu001m selectEduInfo(String course_cd) {
		// TODO Auto-generated method stub
		Edu001m edu = dao.selectEduInfo(course_cd);
		return edu;
	}

	@Override
	public void updateEduInfo(Edu001m edu) {
		// TODO Auto-generated method stub
		dao.updateEduInfo(edu);
	}

	@Override
	public List<Ecd002m> selectEcd002mList() {
		// TODO Auto-generated method stub
		List<Ecd002m> ecd002m = dao.selectEcd002mList();
		return ecd002m;
	}

	@Override
	public List<Ecd005m> selectEcd005mList() {
		// TODO Auto-generated method stub
		List<Ecd005m> ecd005m = dao.selectEcd005mList();
		return ecd005m;
	}

	@Override
	public List<Ecd006m> selectEcd006mList() {
		// TODO Auto-generated method stub
		List<Ecd006m> ecd006m = dao.selectEcd006mList();
		return ecd006m;
	}

	@Override
	public List<Ecd007m> selectEcd007mList() {
		// TODO Auto-generated method stub
		List<Ecd007m> ecd007m = dao.selectEcd007mList();
		return ecd007m;
	}

	@Override
	public void insertGridToDB(ArrayList<Edu001m> gridList) {
		// TODO Auto-generated method stub
		List<Ecd007m> ecd007m = dao.selectEcd007mList();
		
		// 서버 이미지 디폴트 값 생성, 날짜 값 포맷 수정, 키값 세팅
		for(int i=0; i<gridList.size(); i++) {
			// 이미지 디폴트
    		for(int j=0; j<ecd007m.size(); j++) {
    			if(gridList.get(i).getLow_cls_cd().equals(ecd007m.get(j).getLow_cls_cd())) {
    				gridList.get(i).setOrigin_img_file_nm(ecd007m.get(j).getDefault_origin_img_nm());
    				gridList.get(i).setSvr_img_file_nm(ecd007m.get(j).getDefault_svr_img_nm());
    				gridList.get(i).setImg_file_type(ecd007m.get(j).getDefault_img_type());
    				break;
    			}
    		}
    		// 날짜 값 포맷 수정
    		Edu001m edu = gridList.get(i);
    		gridList.get(i).setReg_st_dt(edu.getReg_st_dt().replace("-", ""));
    		gridList.get(i).setReg_ed_dt(edu.getReg_ed_dt().replace("-", ""));
    		gridList.get(i).setEdu_st_dt(edu.getEdu_st_dt().replace("-", ""));
    		gridList.get(i).setEdu_ed_dt(edu.getEdu_ed_dt().replace("-", ""));
    		
    		// pk 세팅
    		gridList.get(i).setCourse_cd(dao.selectCourseSeq());
		}
		
		dao.insertCourseList(gridList);
	}

	@Override
	public void insertCodeAll(ArrayList<EcdCode> insertCodeList) {
		// TODO Auto-generated method stub
		for(int i=0; i<insertCodeList.size(); i++) {
			EcdCode code = insertCodeList.get(i);
			switch(code.getEcdName()) {
			case "Ecd002m":
				// 교육기관코드 신규
				dao.insertEcd002m((Ecd002m)code);
				break;
			case "Ecd005m":
				// 대분류코드 신규
				dao.insertEcd005m((Ecd005m)code);
				break;
			case "Ecd006m":
				// 중분류코드 신규				
				dao.insertEcd006m((Ecd006m)code);
				break;
			case "Ecd007m":
				// 소분류코드 신규				
				dao.insertEcd007m((Ecd007m)code);
				break;
			default:
				break;
			}
		}
	}

	@Override
	public void updateCodeAll(ArrayList<EcdCode> updateCodeList) {
		// TODO Auto-generated method stub
		for(int i=0; i<updateCodeList.size(); i++) {
			EcdCode code = updateCodeList.get(i);
			switch(code.getEcdName()) {
			case "Ecd002m":
				// 교육기관코드 변경
				dao.updateEcd002m((Ecd002m)code);
				break;
			case "Ecd005m":
				// 대분류코드 변경
				dao.updateEcd005m((Ecd005m)code);
				break;
			case "Ecd006m":
				// 중분류코드 변경				
				dao.updateEcd006m((Ecd006m)code);
				break;
			case "Ecd007m":
				// 소분류코드 변경				
				dao.updateEcd007m((Ecd007m)code);
				break;
			default:
				break;
			}
		}
	}

	
}
