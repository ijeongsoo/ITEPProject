package kr.co.ibk.itep.service.bh;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;

@Component
public interface Service {
	
	public EmpJoinedDep ssoLogin(String emn);
	
	public ArrayList<EduApproval> selectAllApprovalList();
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public ArrayList<EduApproval> selectDetailAllApprovalList();
	
	public ArrayList<EduApproval> selectDetailDepApprovalList(String emn);
	
	public void updateDepApproval(Map<String, String> eduinfo);
	
	//대시보드
	public List<Map<String, Integer>> selectBrcdEduCount();
	
	public List<Map<String, Integer>> selectYearEduCount();
	
	public List<Map<String, Integer>> selectYearCTEduCount();

	public int selectAllEduCount();
	
	public int selectYearAppEduCount();
	
	public int selectMonthAppEduCount();
	
}
