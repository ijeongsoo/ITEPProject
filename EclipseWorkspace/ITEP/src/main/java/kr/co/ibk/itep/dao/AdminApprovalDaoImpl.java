package kr.co.ibk.itep.dao;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;
@Component
public class AdminApprovalDaoImpl implements AdminApprovalDao{

	@Autowired
	private SqlSessionTemplate sst;
	
	
	//IT기획부 관리자 교육 조회
	@Override
	public ArrayList<EduApproval> selectAllApprovalList() {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectAll");
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//부서 서무 교육 조회
	@Override
	public ArrayList<EduApproval> selectDepApprovalList(String emn) {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectDep", emn);
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//부서 서무 결재
	@Override
	public void updateDepFirstApproval(Edu002r edulist) {
		sst.update("updateFirstApproval", edulist);
	}
	
	//부서 서무 책임자 결재
	@Override
	public void updateDepSecondApproval(Edu002r edulist) {
		sst.update("updateSecondApproval", edulist);
	}
	
	//IT기획부 관리자 결재
	@Override
	public void updateDepFinalApproval(Edu002r edulist) {
		sst.update("updateFinalApproval", edulist);
	}

	
}
