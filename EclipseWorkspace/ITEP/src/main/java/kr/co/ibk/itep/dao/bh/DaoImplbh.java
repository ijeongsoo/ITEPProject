package kr.co.ibk.itep.dao.bh;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.*;
@Component
public class DaoImplbh implements Dao{

	@Autowired
	private SqlSessionTemplate sst;
	
	
	//IT湲고쉷遺� 愿�由ъ옄 援먯쑁 議고쉶
	@Override
	public ArrayList<EduApproval> selectAllApprovalList() {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectAll");
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//遺��꽌 �꽌臾� 援먯쑁 議고쉶
	@Override
	public ArrayList<EduApproval> selectDepApprovalList(String emn) {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectDep", emn);
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//遺��꽌 �꽌臾� 寃곗옱
	@Override
	public void updateDepFirstApproval(EduApproval edulist) {
		sst.update("updateFirstApproval", edulist);
	}
	
	//遺��꽌 �꽌臾� 梨낆엫�옄 寃곗옱
	@Override
	public void updateDepSecondApproval(EduApproval edulist) {
		sst.update("updateSecondApproval", edulist);
	}
	
	//IT湲고쉷遺� 愿�由ъ옄 寃곗옱
	@Override
	public void updateDepFinalApproval(EduApproval edulist) {
		sst.update("updateFinalApproval", edulist);
	}

	
}
