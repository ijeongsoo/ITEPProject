package kr.co.ibk.itep.dao.bh;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;
@Component
public class DaoImplbh implements Dao{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public EmpJoinedDep selectByEmn(String emn) {
		// TODO Auto-generated method stub
		
		EmpJoinedDep empJoinedDep=sst.selectOne("emp001m.selectByEmn", emn);
		return empJoinedDep;
	}
	
	
	//IT기획부 관리자 검색(조건에 달아서 Select문을 했기때문에 지금은 안씀)
	@Override
	public ArrayList<EduApproval> selectAllApprovalList() {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectAll");
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//관리자가 결재할 수 있는 교육 List 출력
	@Override
	public ArrayList<EduApproval> selectDepApprovalList(String emn) {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectDep", emn);
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//관리자가 결재 Update
	@Override
	public void updateDepApproval(Map<String, String> eduinfo) {
		sst.update("edu002r.updateDepApproval", eduinfo);
	}
	
}
