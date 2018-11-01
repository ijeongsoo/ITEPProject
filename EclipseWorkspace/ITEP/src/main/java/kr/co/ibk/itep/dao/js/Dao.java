package kr.co.ibk.itep.dao.js;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.CountInfo;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.Edu003r;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.RegistEduPullInfo;


@Component
public interface Dao {
	
	public EmpJoinedDep selectByEmn(String emn);
	
	public void deleteAllEmp();

	public void insertAllEmp(Map<String, Object> map);

	public void deleteAllBri();

	public void insertAllBri(Map<String, Object> map);

	public ArrayList<EduJoinedEcd> selectTop8Edu();

	public ArrayList<EduJoinedEcd> selectDDayEdu();
	
	public ArrayList<EduJoinedEcd> selectCategoryEdu();

	public EduPullInfo selectByCourse_cd(String course_cd);

	public int selectCountByCourse_cdEmn(Edu002rAttach edu);

	public int selectSurveyCountByCourse_cdEmn(Edu002rAttach edu);

	public void insertEdu002r(Edu002rAttach edu);

	public List<RegistEduPullInfo> selectRegistList(String emn);

	public List<RegistEduPullInfo> selectStudyList(String emn);

	public List<RegistEduPullInfo> selectSurveyList(String emn);

	public List<RegistEduPullInfo> selectRecentList(String emn);

	public RegistEduPullInfo selectMyEdu(RegistEduPullInfo myRegistEduInfo);

	public void insertSurvay(Edu003r edu003r);

	public void updateStat(Edu003r edu003r);

	public RegistEduPullInfo selectMyFinishedEdu(RegistEduPullInfo myEdu);

	public long selectTotalAmount(String emn);

	public CountInfo selectCountInfo(String emn);

	

}