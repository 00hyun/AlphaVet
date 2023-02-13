package kr.co.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemPatiVO {

	private String memId;
	private String memName;
	private String memTel;
	private String memAgree;
	private String patId;
	private String animalCd;
	private String cliCd;
	private String patName;
	@DateTimeFormat(iso = ISO.DATE)
	private String patBirth;
	private String patBirth2;
	private String patGender;
	private double patWeight;
	private String patAdd1;
	private String patAdd2;
	private String patChip;
	private String patRegnm;
	private String patAbandon;
	private String pregnantCheck;
	private String patNew;
	private String patMemo;
	private String patProfile = "/resources/images/app/vet.png";
	private Date praDate;
	private String patStayCheck;
	private String empName;
	private String empId;

}
