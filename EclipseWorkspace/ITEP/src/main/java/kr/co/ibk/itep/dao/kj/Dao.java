package kr.co.ibk.itep.dao.kj;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.JoinForPostEdulist;


@Component
public interface Dao {
	
	public List<JoinForEdulist> selectAllEdulist();
	public List<JoinForPostEdulist> selectAllPostEdulist();
	

}