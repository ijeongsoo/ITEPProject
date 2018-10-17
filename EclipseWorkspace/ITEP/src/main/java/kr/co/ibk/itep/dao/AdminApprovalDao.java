package kr.co.ibk.itep.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Edu002r;
import kr.co.ibk.itep.dto.EduApproval;

@Component
public interface AdminApprovalDao {
	
	public ArrayList<EduApproval> selectAllApprovalList();
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepFirstApproval(Edu002r edulist);
	
	public void updateDepSecondApproval(Edu002r edulist);
	
	public void updateDepFinalApproval(Edu002r edulist);
}
