package kr.co.ibk.itep.dao.kj;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.JoinForPostEdulist;


@Component
public class DaoImplkj implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<JoinForEdulist> selectAllEdulist() {
		// TODO Auto-generated method stub
		
		List<JoinForEdulist> joinForEdulist=sst.selectList("edu001m.selectAll");
		return joinForEdulist;
	}
	
	@Override
	public List<JoinForPostEdulist> selectAllPostEdulist() {
		// TODO Auto-generated method stub
		
		List<JoinForPostEdulist> joinForPostEdulist=sst.selectList("edu001m.selectPostAll");
		return joinForPostEdulist;
	}

	@Override
	public Edu001m selectRecommentEdu(String emn) {
		System.out.println("$$$$$$$$$$#######################$$$$$$$$$$$$$$$"+emn);
		Edu001m eduPullInfo = sst.selectOne("edu001m.selectRecommendEdu", emn);
		return eduPullInfo;
	}

}

