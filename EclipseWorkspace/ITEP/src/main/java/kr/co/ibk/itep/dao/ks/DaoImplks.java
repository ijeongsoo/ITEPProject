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
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public class DaoImplks implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

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
}

