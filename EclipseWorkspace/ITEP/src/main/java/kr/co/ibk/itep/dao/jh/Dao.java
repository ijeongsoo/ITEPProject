package kr.co.ibk.itep.dao.jh;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.AthJoinedEmpJoinedBri;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Dao {

	List<AthJoinedEmpJoinedBri> selectAuthorityList(AthJoinedEmpJoinedBri athJoinedEmpJoinedBri);
	

}