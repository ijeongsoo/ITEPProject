package kr.co.ibk.itep.service.ks;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Ecd002m;
import kr.co.ibk.itep.dto.Ecd005m;
import kr.co.ibk.itep.dto.Ecd006m;
import kr.co.ibk.itep.dto.Ecd007m;
import kr.co.ibk.itep.dto.EcdCode;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduEditList;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Service {
	
	public EmpJoinedDep ssoLogin(String emn);

	void insertExcelToDB(Object sheet, String flag, String fileName, String ssoid) throws NotFoundException;

	List<EduEditList> selectEduEditList();

	Edu001m selectEduInfo(String course_cd);

	void updateEduInfo(Edu001m edu);

	List<Ecd002m> selectEcd002mList();

	List<Ecd005m> selectEcd005mList();

	List<Ecd006m> selectEcd006mList();

	List<Ecd007m> selectEcd007mList();

	void insertGridToDB(ArrayList<Edu001m> gridList);

	void insertCodeAll(ArrayList<EcdCode> insertCodeList);

	void updateCodeAll(ArrayList<EcdCode> updateCodeList);

	public EduPullInfo selectPostEduInfo(String course_cd);

}

