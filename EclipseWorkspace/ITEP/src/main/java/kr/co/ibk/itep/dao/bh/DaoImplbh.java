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
	
	//IT기획부 관리자 검색 결재 이력 검색
	@Override
	public ArrayList<EduApproval> selectDetailAllApprovalList() {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectDetailAll");
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	//각 부서별 담당자가 볼 수 있는 결재 이력(교육 List) 출력
	@Override
	public ArrayList<EduApproval> selectDetailDepApprovalList(String emn) {
		
		List<EduApproval> eduList = sst.selectList("edu002r.selectDetailDep", emn);
		
		return (ArrayList<EduApproval>)eduList;
	}
	
	
	//관리자가 결재 Update
	@Override
	public void updateDepApproval(Map<String, String> eduinfo) {
		sst.update("edu002r.updateDepApproval", eduinfo);
	}
	
	//대시보드
	//대시보드에서 해당 월에 교육을 듣는 부서별 교육 수강수(수강인원 수 X DISTINCT 안되어 있음)
	@Override
	public List<Map<String, Integer>> selectBrcdEduCount() {
		List<Map<String, Integer>> resultMap = sst.selectList("edu002r.dashboardBrcdEduCountMonth");
		return resultMap;
	}
	
	//해당년도에 각 월별로 수강한 교육 수
	@Override
	public List<Map<String, Integer>> selectYearEduCount() {
		List<Map<String, Integer>> resultMap = sst.selectList("edu002r.dashboardYearEduCountMonth");
		return resultMap;
	}
	
	
	//해당년도에 각 분야별 교육 수강 현황
	@Override
	public List<Map<String, Integer>> selectYearCTEduCount() {
		List<Map<String, Integer>> resultMap = sst.selectList("edu002r.dashboardCTEduCount");
		return resultMap;
	}	
	
	
	//당해년도 전체 교육 등록 수
	@Override
	public int selectAllEduCount() {
		int count = Math.toIntExact(sst.selectOne("edu002r.selectAllEduCount"));
		return count;
	}
	
	//당해년도 전체 교육 신청 수
	@Override
	public int selectYearAppEduCount() {
		int count = Math.toIntExact(sst.selectOne("edu002r.selectYearAppEduCount"));
		return count;
	}
	
	//해당 월 전체 교육 신청 수
	@Override
	public int selectMonthAppEduCount() {
		int count = Math.toIntExact(sst.selectOne("edu002r.selectMonthAppEduCount"));
		return count;
	}
	
}
