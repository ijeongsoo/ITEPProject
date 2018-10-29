package kr.co.ibk.itep.dao.js;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.controller.session.js.SessionedControllerjs;
import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.Edu003r;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.RegistEduPullInfo;


@Component
public class DaoImpljs implements Dao {
	
	private static final Logger logger = LoggerFactory.getLogger(DaoImpljs.class);

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public EmpJoinedDep selectByEmn(String emn) {
		// TODO Auto-generated method stub
		
		EmpJoinedDep empJoinedDep=sst.selectOne("emp001m.selectByEmn", emn);
		return empJoinedDep;
	}


	@Override
	public void deleteAllEmp() {
		sst.delete("emp001m.deleteAll");
		
	}


	@Override
	public void insertAllEmp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sst.insert("emp001m.insertAll", map);
	}

	@Override
	public void deleteAllBri() {
		sst.delete("bri001m.deleteAll");
		
	}

	@Override
	public void insertAllBri(Map<String, Object> map) {
		sst.insert("bri001m.insertAll", map);
		
	}

	@Override
	public ArrayList<EduJoinedEcd> selectTop8Edu() {
		List<EduJoinedEcd> list = sst.selectList("edu001m.selectTop8Edu");
		
		return (ArrayList<EduJoinedEcd>)list;
	}

	@Override
	public ArrayList<EduJoinedEcd> selectDDayEdu() {
		List<EduJoinedEcd> list = sst.selectList("edu001m.selectDDayEdu");
		return (ArrayList<EduJoinedEcd>)list;
	}


	@Override
	public ArrayList<EduJoinedEcd> selectCategoryEdu() {
		List<EduJoinedEcd> list = sst.selectList("edu001m.selectCategoryEdu");
		return (ArrayList<EduJoinedEcd>) list;
	}


	@Override
	public EduPullInfo selectByCourse_cd(String course_cd) {
		// TODO Auto-generated method stub
		EduPullInfo edu = sst.selectOne("edu001m.selectEduByCourse_cd", course_cd);
		return edu;
	}


	@Override
	public int selectCountByCourse_cdEmn(Edu002rAttach edu) {
		// TODO Auto-generated method stub
		int count = sst.selectOne("edu002r.selectCountByCourse_cdEmn", edu);
		return count;
	}


	@Override
	public int selectSurveyCountByCourse_cdEmn(Edu002rAttach edu) {
		int count = sst.selectOne("edu003r.selectSurveyCountByCourse_cdEmn", edu);
		return count;
	}


	@Override
	public void insertEdu002r(Edu002rAttach edu) {
		sst.insert("edu002r.insert", edu);		
	}


	@Override
	public List<RegistEduPullInfo> selectRegistList(String emn) {
		// TODO Auto-generated method stub
		List<RegistEduPullInfo> myRegistList = sst.selectList("edu002r.selectRegistList", emn);
		return myRegistList;
	}


	@Override
	public List<RegistEduPullInfo> selectStudyList(String emn) {
		List<RegistEduPullInfo> myStudyList = sst.selectList("edu002r.selectStudyList", emn);
		return myStudyList;
	}


	@Override
	public List<RegistEduPullInfo> selectSurveyList(String emn) {
		List<RegistEduPullInfo> mySurveyList = sst.selectList("edu002r.selectSurveyList", emn);
		return mySurveyList;
	}


	@Override
	public List<RegistEduPullInfo> selectRecentList(String emn) {
		List<RegistEduPullInfo> myRecentList = sst.selectList("edu002r.selectRecentList", emn);
		return myRecentList;
	}


	@Override
	public RegistEduPullInfo selectMyEdu(RegistEduPullInfo myRegistEduInfo) {
		RegistEduPullInfo edu = sst.selectOne("edu002r.selectMyEdu", myRegistEduInfo);
		return edu;
	}


	@Override
	public void insertSurvay(Edu003r edu003r) {

		sst.insert("edu003r.insert", edu003r);
		
	}


	@Override
	public void updateStat(Edu003r edu003r) {
		// TODO Auto-generated method stub
		sst.insert("edu002r.updateStat", edu003r);		

	}


	@Override
	public RegistEduPullInfo selectMyFinishedEdu(RegistEduPullInfo myEdu) {
		
		RegistEduPullInfo edu = sst.selectOne("edu002r.selectMyFinishedEdu", myEdu);
		return edu;
	}


	@Override
	public long selectTotalAmount(String emn) {
		//long totalAmount = sst.selectOne("edu002r.selectTotalAmount", emn );
		return 10000;
	}


}

