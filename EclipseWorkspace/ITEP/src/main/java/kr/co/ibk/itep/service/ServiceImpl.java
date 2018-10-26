package kr.co.ibk.itep.service;

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

import kr.co.ibk.itep.dao.Dao;
import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Bri001m;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.Emp001m;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;

@Component
public class ServiceImpl implements Service {
	private static final Logger logger = LoggerFactory.getLogger(ServiceImpl.class);
	@Autowired
	private Dao dao;

	@Override
	public void updateEduEndStatCd() {
		dao.updateEduEndStatCd();
	}
	
	@Override
	public void updateEduStartStatCd() {
		dao.updateEduStartStatCd();
	}

}
