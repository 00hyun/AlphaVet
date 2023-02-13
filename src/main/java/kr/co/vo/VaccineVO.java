package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VaccineVO {

	//백신 테이블
	private String patId;
	private String vaccineName;
	private String vaccineDate;
	private int vdNm;
	
	//병원 테이블
	private String cliCd;
	private String cliName;
	private String cliAddr1;
	private String cliAddr2;
	private String cliStartDate;
	private String cliState;
	private String cliTel;
	private int vaccineCount;
	
	//백신 디테일
	private String vdName;
	private String vdType;
	private String vdCnt;
	private int vdDay;
	private String vdCon;
	private int vdPrice;
	private String nextDay;
	private String praDate2;

	
}
