package kr.co.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PraVO implements Serializable {

	private static final long serialVersionUID = 8744900075575541154L;

	private String praCd;
	private String cliCd;
	private String empId;
	private String patId;
	private String praDept;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date praDate;
	private int praStatus;
	private String praCon;
	private double praWeight;
	private String surCheck;
	private String stayCheck;
	private String preOutCheck;
	private int preInTotal;
	private int testTotal;
	private int praPrice;
	private String patName;

	private String praDate2;
	private String praDate3;

	private int vaccinePrice;
	private int recNm;
	
	private String praImg;
	private List<PreInVO> preInList;
	private List<PreOutVO> preOutList;
	private List<DisDetailVO> disDetailList;
	private List<TestDetailVO> testDetailList;
	
	private String YY;
	private String DD;
	private String MM;
	
	

	
}
