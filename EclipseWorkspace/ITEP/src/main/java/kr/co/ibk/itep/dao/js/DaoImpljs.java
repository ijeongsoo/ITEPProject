package kr.co.ibk.itep.dao.js;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public class DaoImpljs implements Dao {
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


}

