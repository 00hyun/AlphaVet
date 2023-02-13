package kr.co.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReplyVO {
	private int replyNm  ;
	private int boNm     ;
	private String cateCd   ;
	private String empId    ;
	private String replyCon ;
	private Date replyDate;
	
	//직원 테이블 join
	private String empName ;
	private String empProfile;
	private String empJob;
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpProfile() {
		return empProfile;
	}
	public void setEmpProfile(String empProfile) {
		this.empProfile = empProfile;
	}
	public String getEmpJob() {
		return empJob;
	}
	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}
	public int getReplyNm() {
		return replyNm;
	}
	public void setReplyNm(int replyNm) {
		this.replyNm = replyNm;
	}
	public int getBoNm() {
		return boNm;
	}
	public void setBoNm(int boNm) {
		this.boNm = boNm;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getReplyCon() {
		return replyCon;
	}
	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
