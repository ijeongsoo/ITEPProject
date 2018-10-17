package kr.co.ibk.itep.service;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;

@Component
public interface AdminApprovalService {
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepFirstApproval(EduApproval edulist);
	
	public void updateDepSecondApproval(EduApproval edulist);
	
	public void updateDepFinalApproval(EduApproval edulist);
	
}
