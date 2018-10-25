package kr.co.ibk.itep.service.bh;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dao.bh.Dao;
import kr.co.ibk.itep.dto.*;

@Component
public class ServiceImplbh implements Service{

	//private static final Logger logger = LoggerFactory.getLogger(ServiceImpl.class);
	@Autowired
	private Dao admindao;

	
	@Override
	public EmpJoinedDep ssoLogin(String emn) {
		// TODO Auto-generated method stub
		EmpJoinedDep empJoinedDep = admindao.selectByEmn(emn);

		return empJoinedDep;
	}
	
	@Override
	public ArrayList<EduApproval> selectDepApprovalList(String emn){
		
		List<EduApproval> eduList = admindao.selectDepApprovalList(emn);
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	@Override
	public ArrayList<EduApproval> selectAllApprovalList(){
		
		List<EduApproval> eduList = admindao.selectAllApprovalList();
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	@Override
	public void updateDepApproval(Map<String, String> eduinfo){
		admindao.updateDepApproval(eduinfo);
	}
	
	//대시보드
	@Override
	public List<Map<String, Integer>> selectBrcdEduCount() {
		List<Map<String, Integer>> resultMap = admindao.selectBrcdEduCount();
		
		return resultMap;
	}
	
}
