package kr.co.ibk.itep.dto;

import org.json.JSONObject;

public class Ecd006m extends EcdCode{
	private String mid_cls_cd;
	private String mid_cls_nm;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	public Ecd006m() {}
	public Ecd006m(JSONObject obj) {
		// TODO Auto-generated constructor stub
		this.mid_cls_cd = "";
		int code = obj.getInt("mid_cls_cd");
		if(code < 10) {
			this.mid_cls_cd = "0";
		}
		this.mid_cls_cd += Integer.toString(code);
		this.mid_cls_nm = obj.getString("mid_cls_nm");
	}
	public String getMid_cls_cd() {
		return mid_cls_cd;
	}
	public void setMid_cls_cd(String mid_cls_cd) {
		this.mid_cls_cd = mid_cls_cd;
	}
	public String getMid_cls_nm() {
		return mid_cls_nm;
	}
	public void setMid_cls_nm(String mid_cls_nm) {
		this.mid_cls_nm = mid_cls_nm;
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
	public boolean isEqual(Ecd006m ecd006m) {
		// TODO Auto-generated method stub
		if(this.mid_cls_cd.equals(ecd006m.getMid_cls_cd()) && this.mid_cls_nm.equals(ecd006m.getMid_cls_nm())) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
