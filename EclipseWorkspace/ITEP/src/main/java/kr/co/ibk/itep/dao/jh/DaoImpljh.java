package kr.co.ibk.itep.dao.jh;

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
public class DaoImpljh implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Ath001m> selectAuthorityList(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		List<Ath001m> list = sst.selectList("ath001m.listAll");
		
		return list;
	}


}

