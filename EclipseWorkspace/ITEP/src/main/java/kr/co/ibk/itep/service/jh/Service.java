package kr.co.ibk.itep.service.jh;

import java.io.File;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import kr.co.ibk.itep.dto.Ath001m;
import kr.co.ibk.itep.dto.AthJoinedEmpJoinedBri;
import kr.co.ibk.itep.dto.EduJoinedEcd;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.dto.JoinForEdulist;


@Component
public interface Service {


	public List<AthJoinedEmpJoinedBri> getAuthList(AthJoinedEmpJoinedBri athJoinedEmpJoinedBri);

}

