package kr.co.ibk.itep.service.js;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Service {

	public EmpJoinedDep ssoLogin(String emn);
	
	public void empFileUploader(String originPath, String newPath);

	public void briFileUploader(String originPath, String newPath);

	public ArrayList<EduJoinedEcd> getTop8Edu();

	public ArrayList<EduJoinedEcd> getDDayEdu();

	public ArrayList<EduJoinedEcd> getCategoryEdu();

	public EduPullInfo getEduByCourseCD(String course_cd);

	public int registEdu(Edu002rAttach edu);


}

