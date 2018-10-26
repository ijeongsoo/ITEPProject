package kr.co.ibk.itep.dao;

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
public class DaoImpl implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public void updateEduEndStatCd() {
		sst.update("edu002r.updateEduEndStat");
	}
	
	@Override
	public void updateEduStartStatCd() {
		sst.update("edu002r.updateEduStartStat");
	}



}

