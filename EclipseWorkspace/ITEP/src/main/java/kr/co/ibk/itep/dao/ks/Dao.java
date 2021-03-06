package kr.co.ibk.itep.dao.ks;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Dao {

	public EmpJoinedDep selectByEmn(String emn);
	
	void insertCourseList(ArrayList<Edu001m> eduList);

	String selectCourseSeq();

	List<Ecd002m> selectEcd002mList();

	List<Ecd005m> selectEcd005mList();

	List<Ecd006m> selectEcd006mList();

	List<Ecd007m> selectEcd007mList();

	List<EduEditList> selectEduEditList();

	Edu001m selectEduInfo(String course_cd);

	void updateEduInfo(Edu001m edu);

	void insertEcd002m(Ecd002m code);

	void insertEcd005m(Ecd005m code);

	void insertEcd006m(Ecd006m code);

	void insertEcd007m(Ecd007m code);

	void updateEcd002m(Ecd002m code);

	void updateEcd005m(Ecd005m code);

	void updateEcd006m(Ecd006m code);

	void updateEcd007m(Ecd007m code);

	public EduPullInfo selectPostEduInfo(String course_cd);
	

	

}