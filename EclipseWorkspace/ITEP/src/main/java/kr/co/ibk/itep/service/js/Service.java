package kr.co.ibk.itep.service.js;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu002rAttach;
import kr.co.ibk.itep.dto.Edu003r;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.RegistEduPullInfo;


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

	public int regConfirm(Edu002rAttach eduConfirm);

	public List<RegistEduPullInfo> getMyRegistList(String emn);

	public List<RegistEduPullInfo> getMyStudyList(String emn);

	public List<RegistEduPullInfo> getMySurveyList(String emn);

	public List<RegistEduPullInfo> getMyRecentList(String emn);

	public RegistEduPullInfo getEdu(RegistEduPullInfo myRegistEduInfo);

	public void survay(Edu003r edu003r);

	public RegistEduPullInfo getFinishedEdu(RegistEduPullInfo myEdu);

	public long getTotalAmount(String emn);


}

