package kr.co.ibk.itep.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Dao {
	
	//수강 완료된 강의들의 수강 상태를 설문중으로 바꾸어주는 Update문
	public void updateEduEndStatCd();
	
	//수강 대기 중이던 강의들의 수강 시작 날짜가 되면 수강중으로 바꾸어주는 Update문
	public void updateEduStartStatCd();
	
	

}