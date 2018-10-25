package kr.co.ibk.itep.dao.bh;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EmpJoinedDep;

@Component
public interface Dao {
	
	//결재
	public EmpJoinedDep selectByEmn(String emn);
	
	public ArrayList<EduApproval> selectAllApprovalList();
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepApproval(Map<String, String> eduinfo);
	
	//대시보드
	public List<Map<String, Integer>> selectBrcdEduCount();
	
	public List<Map<String, Integer>> selectYearEduCount();
}
