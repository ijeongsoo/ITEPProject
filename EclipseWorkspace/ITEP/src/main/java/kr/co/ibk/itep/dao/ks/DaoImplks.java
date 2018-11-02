package kr.co.ibk.itep.dao.ks;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Ecd002m;
import kr.co.ibk.itep.dto.Ecd005m;
import kr.co.ibk.itep.dto.Ecd006m;
import kr.co.ibk.itep.dto.Ecd007m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduEditList;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public class DaoImplks implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public EmpJoinedDep selectByEmn(String emn) {
		// TODO Auto-generated method stub
		
		EmpJoinedDep empJoinedDep=sst.selectOne("emp001m.selectByEmn", emn);
		return empJoinedDep;
	}
	
	@Override
	public void insertCourseList(ArrayList<Edu001m> eduList) {
		// TODO Auto-generated method stub
		sst.insert("edu001m.insertExcelList", eduList);
	}

	@Override
	public String selectCourseSeq() {
		// TODO Auto-generated method stub
		return sst.selectOne("edu001m.selectCourseSeq");
	}

	@Override
	public List<Ecd002m> selectEcd002mList() {
		// TODO Auto-generated method stub
		return sst.selectList("ecd002m.selectEcd002mList");
	}

	@Override
	public List<Ecd005m> selectEcd005mList() {
		// TODO Auto-generated method stub
		return sst.selectList("ecd005m.selectEcd005mList");
	}

	@Override
	public List<Ecd006m> selectEcd006mList() {
		// TODO Auto-generated method stub
		return sst.selectList("ecd006m.selectEcd006mList");
	}

	@Override
	public List<Ecd007m> selectEcd007mList() {
		// TODO Auto-generated method stub
		return sst.selectList("ecd007m.selectEcd007mList");
	}

	@Override
	public List<EduEditList> selectEduEditList() {
		// TODO Auto-generated method stub
		return sst.selectList("edu001m.selectEduEditList");
	}

	@Override
	public Edu001m selectEduInfo(String course_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne("edu001m.selectEduInfo", course_cd);
	}

	@Override
	public void updateEduInfo(Edu001m edu) {
		// TODO Auto-generated method stub
		sst.update("edu001m.updateEduInfo", edu);
	}

	@Override
	public void insertEcd002m(Ecd002m code) {
		// TODO Auto-generated method stub
		sst.insert("ecd002m.insertCode", code);
	}

	@Override
	public void insertEcd005m(Ecd005m code) {
		// TODO Auto-generated method stub
		sst.insert("ecd005m.insertCode", code);
	}

	@Override
	public void insertEcd006m(Ecd006m code) {
		// TODO Auto-generated method stub
		sst.insert("ecd006m.insertCode", code);
	}

	@Override
	public void insertEcd007m(Ecd007m code) {
		// TODO Auto-generated method stub
		sst.insert("ecd007m.insertCode", code);
	}

	@Override
	public void updateEcd002m(Ecd002m code) {
		// TODO Auto-generated method stub
		sst.update("ecd002m.updateCode", code);
	}

	@Override
	public void updateEcd005m(Ecd005m code) {
		// TODO Auto-generated method stub
		sst.update("ecd005m.updateCode", code);
	}

	@Override
	public void updateEcd006m(Ecd006m code) {
		// TODO Auto-generated method stub
		sst.update("ecd006m.updateCode", code);
	}

	@Override
	public void updateEcd007m(Ecd007m code) {
		// TODO Auto-generated method stub
		sst.update("ecd007m.updateCode", code);
	}

	@Override
	public EduPullInfo selectPostEduInfo(String course_cd) {
		EduPullInfo edu = sst.selectOne("edu001m.selectEduByCourse_cd", course_cd);
		return edu;
	}
}

