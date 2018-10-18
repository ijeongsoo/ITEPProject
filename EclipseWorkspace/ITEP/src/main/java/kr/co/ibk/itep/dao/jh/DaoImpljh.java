package kr.co.ibk.itep.dao.jh;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.AthJoinedEmpJoinedBri;


@Component
public class DaoImpljh implements Dao {
	private static final Logger logger = LoggerFactory.getLogger(DaoImpljh.class);

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<AthJoinedEmpJoinedBri> selectAuthorityList(AthJoinedEmpJoinedBri athJoinedEmpJoinedBri) {
		List<AthJoinedEmpJoinedBri> list = sst.selectList("ath001m.listAll", athJoinedEmpJoinedBri);
				
		return list;
	}



}

