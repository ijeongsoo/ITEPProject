package kr.co.ibk.itep.service.kj;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.JoinForPostEdulist;


@Component
public interface Service {

	public List<JoinForEdulist> selectEdulist();
	public List<JoinForPostEdulist> selectPostEdulist();
	public Edu001m getRecommendEdu(String emn);

}

