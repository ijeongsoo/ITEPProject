package kr.co.ibk.itep.dao.ks;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public class DaoImplks implements Dao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public void insertCourseList(ArrayList<Edu001m> eduList) {
		// TODO Auto-generated method stub
		sst.insert("insertExcelList", eduList);
	}

	



}

