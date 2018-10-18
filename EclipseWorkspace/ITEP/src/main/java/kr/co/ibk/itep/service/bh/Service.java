package kr.co.ibk.itep.service.bh;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;

@Component
public interface Service {
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepFirstApproval(EduApproval edulist);
	
	public void updateDepSecondApproval(EduApproval edulist);
	
	public void updateDepFinalApproval(EduApproval edulist);
	
}
