package kr.co.ibk.itep.dto;

public class EduEditList {
	private int rownum;
	private String course_cd;
	private String org_nm;
	private String high_cls_nm;
	private String mid_cls_nm;
	private String low_cls_nm;
	private String course_nm;
	private String edu_st_dt;
	private String edu_ed_dt;
	private int edu_cost;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getCourse_cd() {
		return course_cd;
	}
	public void setCourse_cd(String course_cd) {
		this.course_cd = course_cd;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getHigh_cls_nm() {
		return high_cls_nm;
	}
	public void setHigh_cls_nm(String high_cls_nm) {
		this.high_cls_nm = high_cls_nm;
	}
	public String getMid_cls_nm() {
		return mid_cls_nm;
	}
	public void setMid_cls_nm(String mid_cls_nm) {
		this.mid_cls_nm = mid_cls_nm;
	}
	public String getLow_cls_nm() {
		return low_cls_nm;
	}
	public void setLow_cls_nm(String low_cls_nm) {
		this.low_cls_nm = low_cls_nm;
	}
	public String getCourse_nm() {
		return course_nm;
	}
	public void setCourse_nm(String course_nm) {
		this.course_nm = course_nm;
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
}
