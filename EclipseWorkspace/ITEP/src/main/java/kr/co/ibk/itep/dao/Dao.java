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
	
	public EmpJoinedDep selectByEmn(String emn);

	public List<JoinForEdulist> selectAllEdulist();
	
	public void deleteAllEmp();

	public void insertAllEmp(Map<String, Object> map);

	public void deleteAllBri();

	public void insertAllBri(Map<String, Object> map);

	public ArrayList<EduJoinedEcd> selectTop8Edu();

	public ArrayList<EduJoinedEcd> selectDDayEdu();
	
	public List<Ath001m> selectAuthorityList(String searchOption, String keyword);

	public ArrayList<EduJoinedEcd> selectCategoryEdu();

	

}