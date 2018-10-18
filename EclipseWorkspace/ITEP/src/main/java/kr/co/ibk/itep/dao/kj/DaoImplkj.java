package kr.co.ibk.itep.dao.kj;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


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
	

}
