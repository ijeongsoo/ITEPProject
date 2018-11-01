package kr.co.ibk.itep.dto;

import org.json.JSONObject;

public class Ecd002m extends EcdCode{
	private String org_cd;
	private String org_nm;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	
	public Ecd002m() {}
	
	public Ecd002m(JSONObject obj) {
		// TODO Auto-generated constructor stub
		this.org_cd = "";
		int code = obj.getInt("org_cd");
		if(code < 10) {
			this.org_cd = "0";
		}
		this.org_cd += Integer.toString(code);
		this.org_nm = obj.getString("org_nm");
	}
	public String getOrg_cd() {
		return org_cd;
	}
	public void setOrg_cd(String org_cd) {
		this.org_cd = org_cd;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getChg_id() {
		return chg_id;
	}
	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

	public boolean isEqual(Ecd002m ecd002m) {
		// TODO Auto-generated method stub
		if(this.org_cd.equals(ecd002m.getOrg_cd()) && this.org_nm.equals(ecd002m.getOrg_nm())) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
