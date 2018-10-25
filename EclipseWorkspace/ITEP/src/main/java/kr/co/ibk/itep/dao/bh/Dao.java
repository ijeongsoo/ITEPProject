package kr.co.ibk.itep.dao.bh;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Edu002r;
import kr.co.ibk.itep.dto.EduApproval;
import kr.co.ibk.itep.dto.EmpJoinedDep;

@Component
public interface Dao {
	
	public EmpJoinedDep selectByEmn(String emn);
	
	public ArrayList<EduApproval> selectAllApprovalList();
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepApproval(Map<String, String> eduinfo);
}
