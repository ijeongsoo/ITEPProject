package kr.co.ibk.itep.service.js;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ibk.itep.dao.js.Dao;
import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Bri001m;
import kr.co.ibk.itep.dto.CountInfo;
import kr.co.ibk.itep.dto.Edu002r;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.Edu003r;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.RegistEduPullInfo;

@Component
public class ServiceImpljs implements Service {
	private static final Logger logger = LoggerFactory.getLogger(ServiceImpljs.class);
	@Autowired
	private Dao dao;

	@Override
	public EmpJoinedDep ssoLogin(String emn) {
		// TODO Auto-generated method stub
		String fullEmn = "0" + emn;
		EmpJoinedDep empJoinedDep = dao.selectByEmn(fullEmn);

		return empJoinedDep;
	}

	
	@Override
	@Transactional
	public void empFileUploader(String originPath, String newPath) {
		File f = new File(originPath);
		File newFile = new File(newPath);
		try {
			BufferedReader in = new BufferedReader(new FileReader(f));
			String s;
			ArrayList<Emp001m> list = new ArrayList<>();
			Map<String, Object> map = new HashMap<>();

			while ((s = in.readLine()) != null) {
				Emp001m emp001m = new Emp001m();
				emp001m.setEmn(s.substring(0, 6));
				emp001m.setEmm(s.substring(6, 56));
				emp001m.setBlng_brcd(s.substring(56, 60));
				emp001m.setAuth_cd(s.substring(60, 62));
				;
				emp001m.setReg_id(s.substring(62, 68));
				emp001m.setReg_dt(s.substring(68, 76));
				emp001m.setChg_id(s.substring(76, 82));
				emp001m.setChg_dt(s.substring(82, 90));

				emp001m.setEmm(emp001m.getEmm().trim());

				logger.info(emp001m.getEmn() + "," + emp001m.getEmm() + "," + emp001m.getBlng_brcd() + ","
						+ emp001m.getAuth_cd() + "," + emp001m.getReg_id() + "," + emp001m.getReg_dt() + ","
						+ emp001m.getChg_id() + "," + emp001m.getChg_dt());

				list.add(emp001m);

			}
			map.put("list", list);
			dao.deleteAllEmp();
			dao.insertAllEmp(map);
			
		    
		    byte[] buf = new byte[1024];
	        FileInputStream fin = null;
	        FileOutputStream fout = null;
	        
	        
	        if(!f.renameTo(newFile)){    // renameTo로 이동 실패할 경우
	            
	            buf = new byte[1024];
	            try {
	                fin = new FileInputStream(f);
	                fout = new FileOutputStream(newFile);
	                int read = 0;
	                while((read=fin.read(buf,0,buf.length))!=-1){
	                    fout.write(buf, 0, read);
	                }
	                 
	                fin.close();
	                fout.close();
	                f.delete();                      
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        } 
		            

		    f.renameTo(newFile);
		   
			
			in.close();
		} catch (IOException e) {
			System.err.println(e);
		}
	}

	@Override
	@Transactional
	public void briFileUploader(String originPath, String newPath) {
		// TODO Auto-generated method stub
		
		File f = new File(originPath);
		File newFile = new File(newPath);
		try {
			BufferedReader in = new BufferedReader(new FileReader(f));
			String s;
			ArrayList<Bri001m> list = new ArrayList<>();
			Map<String, Object> map = new HashMap<>();

			while ((s = in.readLine()) != null) {
				Bri001m bri001m = new Bri001m();
				bri001m.setBrcd(s.substring(0, 4));
				bri001m.setKrn_brm(s.substring(4, 54));
				bri001m.setReg_id(s.substring(54, 60));
				bri001m.setReg_dt(s.substring(60, 68));
				bri001m.setChg_id(s.substring(68, 74));
				bri001m.setChg_dt(s.substring(74, 82));
				
				bri001m.setKrn_brm(bri001m.getKrn_brm().trim());

				
				logger.info(bri001m.getBrcd() + "," + bri001m.getKrn_brm() + "," + bri001m.getReg_id() + "," + bri001m.getReg_dt() + ","
						+ bri001m.getChg_id() + "," + bri001m.getChg_dt());
				
				list.add(bri001m);

			}
			map.put("list", list);
			dao.deleteAllBri();
			dao.insertAllBri(map);
			
		    
		    byte[] buf = new byte[1024];
	        FileInputStream fin = null;
	        FileOutputStream fout = null;
	        
	        
	        if(!f.renameTo(newFile)){    // renameTo로 이동 실패할 경우
	            
	            buf = new byte[1024];
	            try {
	                fin = new FileInputStream(f);
	                fout = new FileOutputStream(newFile);
	                int read = 0;
	                while((read=fin.read(buf,0,buf.length))!=-1){
	                    fout.write(buf, 0, read);
	                }
	                 
	                fin.close();
	                fout.close();
	                f.delete();                      
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        } 
		            

		    f.renameTo(newFile);
		   
			
			in.close();
		} catch (IOException e) {
			System.err.println(e);
		}
		
	}

	@Override
	public ArrayList<EduJoinedEcd> getTop8Edu() {
		// TODO Auto-generated method stub
		ArrayList<EduJoinedEcd> list = dao.selectTop8Edu();
		return list;
	}

	@Override
	public ArrayList<EduJoinedEcd> getDDayEdu() {
		ArrayList<EduJoinedEcd> list = dao.selectDDayEdu();
		return list;
	}
	

	@Override
	public ArrayList<EduJoinedEcd> getCategoryEdu() {
		ArrayList<EduJoinedEcd> list = dao.selectCategoryEdu();
		return list;
	}


	@Override
	public EduPullInfo getEduByCourseCD(String course_cd) {
		EduPullInfo edu = dao.selectByCourse_cd(course_cd);
		return edu;
	}


	@Override
	public int registEdu(Edu002rAttach edu) {
		// TODO Auto-generated method stub
		
		//이미 등록한 교육 여부 확인
		int alreadyRegCount = dao.selectCountByCourse_cdEmn(edu);
		
		
		if(alreadyRegCount != 0){
			return 0;
		}
		
		//설문 안한 교육 존재여부 확인
		int doNotSurveyCount = dao.selectSurveyCountByCourse_cdEmn(edu);
		
		if(doNotSurveyCount != 0){
			return 2;
		}
		
		dao.insertEdu002r(edu);
		
		return 1;
		
	}


	@Override
	public int regConfirm(Edu002rAttach eduConfirm) {
		// TODO Auto-generated method stub
		int alreadyRegCount = dao.selectCountByCourse_cdEmn(eduConfirm);
		
		
		if(alreadyRegCount != 0){
			return 0;
		}
		
		//설문 안한 교육 존재여부 확인
		int doNotSurveyCount = dao.selectSurveyCountByCourse_cdEmn(eduConfirm);
		
		if(doNotSurveyCount != 0){
			return 2;
		}
				
		return 1;
	}


	@Override
	public List<RegistEduPullInfo> getMyRegistList(String emn) {
		List<RegistEduPullInfo> myRegistList = dao.selectRegistList(emn);
		return myRegistList;
	}


	@Override
	public List<RegistEduPullInfo> getMyStudyList(String emn) {
		List<RegistEduPullInfo> myStudyList = dao.selectStudyList(emn);;
		return myStudyList;
	}


	@Override
	public List<RegistEduPullInfo> getMySurveyList(String emn) {
		List<RegistEduPullInfo> mySurveyList = dao.selectSurveyList(emn);
		return mySurveyList;
	}


	@Override
	public List<RegistEduPullInfo> getMyRecentList(String emn) {
		List<RegistEduPullInfo> myRecentList = dao.selectRecentList(emn);;
		return myRecentList;
	}


	@Override
	public RegistEduPullInfo getEdu(RegistEduPullInfo myRegistEduInfo) {
		RegistEduPullInfo edu = dao.selectMyEdu(myRegistEduInfo);
		return edu;
	}


	
	@Override
	@Transactional
	public void survay(Edu003r edu003r) {		

		dao.insertSurvay(edu003r);
		dao.updateStat(edu003r);
				
	}


	@Override
	public RegistEduPullInfo getFinishedEdu(RegistEduPullInfo myEdu) {
		RegistEduPullInfo edu = dao.selectMyFinishedEdu(myEdu);
		return edu;
	}


	@Override
	public long getTotalAmount(String emn) {
		long totalAmount = dao.selectTotalAmount(emn);
		return totalAmount;
	}


	@Override
	public CountInfo getCountInfo(String emn) {
		CountInfo countInfo = dao.selectCountInfo(emn);
		
		return countInfo;
	}


}
