package kr.co.ibk.itep.dto;

import org.json.JSONObject;

public class Ecd005m extends EcdCode{
	private String high_cls_cd;
	private String high_cls_nm;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	public Ecd005m() {}
	public Ecd005m(JSONObject obj) {
		this.high_cls_cd = Integer.toString(obj.getInt("high_cls_cd"));
		this.high_cls_nm = obj.getString("high_cls_nm");
	}
	public String getHigh_cls_cd() {
		return high_cls_cd;
	}
	public void setHigh_cls_cd(String high_cls_cd) {
		this.high_cls_cd = high_cls_cd;
	}
	public String getHigh_cls_nm() {
		return high_cls_nm;
	}
	public void setHigh_cls_nm(String high_cls_nm) {
		this.high_cls_nm = high_cls_nm;
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
	public boolean isEqual(Ecd005m ecd005m) {
		// TODO Auto-generated method stub
		if(this.high_cls_cd.equals(ecd005m.getHigh_cls_cd()) && this.high_cls_nm.equals(ecd005m.getHigh_cls_nm())) {
			return true;
		}
		else {
			return false;
		}
	}
	
	
}
