package kr.co.ibk.itep.service.ks;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.Edu001m;
import kr.co.ibk.itep.dto.EduEditList;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Service {

	void insertExcelToDB(Object sheet, String flag, String fileName, String ssoid) throws NotFoundException;

	List<EduEditList> selectEduEditList();

	Edu001m selectEduInfo(String course_cd);


}

