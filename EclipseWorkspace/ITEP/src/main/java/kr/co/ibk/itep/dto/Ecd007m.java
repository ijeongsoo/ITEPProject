package kr.co.ibk.itep.dto;

import org.json.JSONObject;

public class Ecd007m extends EcdCode{
	private String low_cls_cd;
	private String low_cls_nm;
	private String mid_cls_cd;
	private String default_origin_img_nm;
	private String default_svr_img_nm;
	private String default_img_type;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	public Ecd007m() {}
	public Ecd007m(JSONObject obj) {
		// TODO Auto-generated constructor stub
		this.low_cls_cd = "";
		this.mid_cls_cd = "";
		int low = obj.getInt("low_cls_cd");
		if(low < 10) {
			this.low_cls_cd = "0";
		}
		this.low_cls_cd += Integer.toString(low);
		this.low_cls_nm = obj.getString("low_cls_nm");
		
		int mid = obj.getInt("mid_cls_cd");
		if(mid < 10) {
			this.mid_cls_cd = "0";
		}
		this.mid_cls_cd += Integer.toString(mid);
	}
	public String getLow_cls_cd() {
		return low_cls_cd;
	}
	public void setLow_cls_cd(String low_cls_cd) {
		this.low_cls_cd = low_cls_cd;
	}
	public String getLow_cls_nm() {
		return low_cls_nm;
	}
	public void setLow_cls_nm(String low_cls_nm) {
		this.low_cls_nm = low_cls_nm;
	}
	public String getMid_cls_cd() {
		return mid_cls_cd;
	}
	public void setMid_cls_cd(String mid_cls_cd) {
		this.mid_cls_cd = mid_cls_cd;
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
	public String getDefault_origin_img_nm() {
		return default_origin_img_nm;
	}
	public void setDefault_origin_img_nm(String default_origin_img_nm) {
		this.default_origin_img_nm = default_origin_img_nm;
	}
	public String getDefault_svr_img_nm() {
		return default_svr_img_nm;
	}
	public void setDefault_svr_img_nm(String default_svr_img_nm) {
		this.default_svr_img_nm = default_svr_img_nm;
	}
	public String getDefault_img_type() {
		return default_img_type;
	}
	public void setDefault_img_type(String default_img_type) {
		this.default_img_type = default_img_type;
	}
	public boolean isEqual(Ecd007m ecd007m) {
		// TODO Auto-generated method stub
		if(this.low_cls_cd.equals(ecd007m.getLow_cls_cd()) &&
				this.low_cls_nm.equals(ecd007m.getLow_cls_nm()) &&
				this.mid_cls_cd.equals(ecd007m.getMid_cls_cd())) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
