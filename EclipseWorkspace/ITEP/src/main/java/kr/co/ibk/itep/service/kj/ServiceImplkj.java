package kr.co.ibk.itep.service.kj;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ibk.itep.dao.kj.Dao;
import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Bri001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EduPullInfo;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;
import kr.co.ibk.itep.dto.JoinForPostEdulist;

@Component
public class ServiceImplkj implements Service {
	private static final Logger logger = LoggerFactory.getLogger(ServiceImplkj.class);
	@Autowired
	private Dao dao;

	@Override
	public List<JoinForEdulist> selectEdulist() {
		// TODO Auto-generated method stub
		List<JoinForEdulist> joinForEdulist = dao.selectAllEdulist();

		return joinForEdulist;
	}
	@Override
	public List<JoinForPostEdulist> selectPostEdulist() {
		// TODO Auto-generated method stub
		List<JoinForPostEdulist> joinForPostEdulist = dao.selectAllPostEdulist();

		return joinForPostEdulist;
	}
	@Override
	public Edu001m getRecommendEdu(String emn) {
		Edu001m eduPullInfo = dao.selectRecommentEdu(emn);
		return eduPullInfo;
	}

}
