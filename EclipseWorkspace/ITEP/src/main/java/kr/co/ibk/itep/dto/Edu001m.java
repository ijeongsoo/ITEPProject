package kr.co.ibk.itep.dto;

import org.json.JSONObject;

public class Edu001m {
	private String course_cd;
	private String org_cd;
	private String high_cls_cd;
	private String mid_cls_cd;
	private String low_cls_cd;
	private String course_nm;
	private int edu_hour;
	private String reg_st_dt;
	private String reg_ed_dt;
	private String edu_st_dt;
	private String edu_ed_dt;
	private int edu_cost;
	private String loc;
	private String refund_yn;
	private String origin_img_file_nm;
	private String svr_img_file_nm;
	private String img_file_type;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	
	public Edu001m() {}
	
	public Edu001m(JSONObject obj) {
		this.course_cd = "";
		this.org_cd = obj.getString("org_cd");
		this.high_cls_cd = obj.getString("high_cls_cd");
		this.mid_cls_cd = obj.getString("mid_cls_cd");
	}
	
	public String getCourse_cd() {
		return course_cd;
	}
	public void setCourse_cd(String course_cd) {
		this.course_cd = course_cd;
	}
	public String getOrg_cd() {
		return org_cd;
	}
	public void setOrg_cd(String org_cd) {
		this.org_cd = org_cd;
	}
	
	public String getHigh_cls_cd() {
		return high_cls_cd;
	}
	public void setHigh_cls_cd(String high_cls_cd) {
		this.high_cls_cd = high_cls_cd;
	}
	public String getMid_cls_cd() {
		return mid_cls_cd;
	}
	public void setMid_cls_cd(String mid_cls_cd) {
		this.mid_cls_cd = mid_cls_cd;
	}
	public String getLow_cls_cd() {
		return low_cls_cd;
	}
	public void setLow_cls_cd(String low_cls_cd) {
		this.low_cls_cd = low_cls_cd;
	}
	public String getCourse_nm() {
		return course_nm;
	}
	public void setCourse_nm(String course_nm) {
		this.course_nm = course_nm;
	}
	public int getEdu_hour() {
		return edu_hour;
	}
	public void setEdu_hour(int edu_hour) {
		this.edu_hour = edu_hour;
	}
	public String getReg_st_dt() {
		return reg_st_dt;
	}
	public void setReg_st_dt(String reg_st_dt) {
		this.reg_st_dt = reg_st_dt;
	}
	public String getReg_ed_dt() {
		return reg_ed_dt;
	}
	public void setReg_ed_dt(String reg_ed_dt) {
		this.reg_ed_dt = reg_ed_dt;
	}
	public String getEdu_st_dt() {
		return edu_st_dt;
	}
	public void setEdu_st_dt(String edu_st_dt) {
		this.edu_st_dt = edu_st_dt;
	}
	public String getEdu_ed_dt() {
		return edu_ed_dt;
	}
	public void setEdu_ed_dt(String edu_ed_dt) {
		this.edu_ed_dt = edu_ed_dt;
	}
	public int getEdu_cost() {
		return edu_cost;
	}
	public void setEdu_cost(int edu_cost) {
		this.edu_cost = edu_cost;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getRefund_yn() {
		return refund_yn;
	}
	public void setRefund_yn(String refund_yn) {
		this.refund_yn = refund_yn;
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
	public String getOrigin_img_file_nm() {
		return origin_img_file_nm;
	}
	public void setOrigin_img_file_nm(String origin_img_file_nm) {
		this.origin_img_file_nm = origin_img_file_nm;
	}
	public String getSvr_img_file_nm() {
		return svr_img_file_nm;
	}
	public void setSvr_img_file_nm(String svr_img_file_nm) {
		this.svr_img_file_nm = svr_img_file_nm;
	}
	public String getImg_file_type() {
		return img_file_type;
	}
	public void setImg_file_type(String img_file_type) {
		this.img_file_type = img_file_type;
	}
	

}
