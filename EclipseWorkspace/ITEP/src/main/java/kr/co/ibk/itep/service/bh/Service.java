package kr.co.ibk.itep.service.bh;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;

@Component
public interface Service {
	
	public ArrayList<EduApproval> selectDepApprovalList(String emn);
	
	public void updateDepApproval(Map<String, String> eduinfo);
	
}
