package kr.co.ibk.itep.dao.bh;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Edu002r;
import kr.co.ibk.itep.dto.EduApproval;

@Component
public interface Dao {
	
	public ArrayList<EduApproval> selectAllApprovalList();
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepApproval(Map<String, String> eduinfo);
}
