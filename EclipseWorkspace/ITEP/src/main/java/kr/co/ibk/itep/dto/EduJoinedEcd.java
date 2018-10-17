package kr.co.ibk.itep.dto;

public class EduJoinedEcd {
	private int rownum;
	private int dday;

	private String course_cd;
	private String org_nm;
	private String high_cls_cd;
	private String mid_cls_cd;
	private String low_cls_cd;
	private String course_nm;
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
	private String edu_st_dt;
	private String edu_ed_dt;
	private String svr_img_file_nm ;
	private String img_file_type;
	
	
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
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
