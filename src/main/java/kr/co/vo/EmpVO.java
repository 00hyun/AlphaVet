package kr.co.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO implements Serializable {

	private static final long serialVersionUID = -7013224199607198024L;

	private String empId;
	private String managerId;
	private String cliCd;
	private String animalCd;
	private String empJob;
	private String empName;
	private String empProfile;
	private MultipartFile profileFile;
	private String empTel;
	private String empZipcode;
	private String empAdd1;
	private String empAdd2;
	@DateTimeFormat(iso = ISO.DATE)
	private String empJoinDate;
	@DateTimeFormat(iso = ISO.DATE)
	private String empRetireDate;
	private String empState;
	@DateTimeFormat(iso = ISO.DATE)
	private String empBirth;
	private String empPw;
	// emp_auth 테이블 N개의 권한
	private List<EmpAuthVO> empAuthVOList;
	private String[] empAuth;
	
	private String empMail;
	private String empType = "직원";
	
	private String empCurrent;
}
