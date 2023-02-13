package kr.co.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EnterVO {

	private String stCd;
	private String patId;
	private String cliCd;
	private String empId;
	private String stStartDate;
	private String stEndDate;
	private int stTotalCnt;
	private int stTotalPrice;
	
	private String empWriter;
	
	private String stState;
	
	private int stDays;

	private int cageNm;
	private int wardNm;
	private int cageSize;
	private int cageCleanCheck;
	private String cageCon;

	private String wardName;
	private int wardAmount;

	private int foodNm;
	private int foodDtNm;
	private String foodName;
	private int foodAmount;
	private String foodLastDate;
	private String foodCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private String foodDate;
	private String stayType;
	private int stFoodNum;
	private String patProfile;

	
	
	private int stPrice;
	private int snNm;
	private String snDate;
	private String snSpecal;
	private int foodPrice;
	private int snDrugPrice;
	private int snTodayPrice;
	private String snCon;
	private int snFoodCnt;
	private String snHealthState;
	private double snTempState;
	private String snPooState;

	private String patMemo;
	private String memId;
	private String animalCd;
	private String patName;
	private String patBirth;
	private String patGender;
	private int patWeight;
	private String patAdd1;
	private String patAdd2;
	private String patChip;
	private String patRegnm;
	private String patAbandon;
	private String pregnantCheck;
	private String patNew;
	
	private int preInTotal;
	private int stFoodTotal;

	private String empName;

	private int injNm;
	private int drugNm;
	private String injType;
	private int injAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private String injDate;

	private int preNm;
	private String praCd;
	private String praCon;
	private String preInType;
	private String drugType;
	private int preInAmount;
	private int preInCnt;
	private int testTotal;
	private int praPrice;
	
	private String memName; 
	private int memTel;

	private String itemName;
	
	
	//병원 테이블 (지현추가)
	private String cliName;
	private String cliAddr1;
	private String cliAddr2;
	private String cliStartDate;
	private String cliState;
	private String cliTel;
	
	
	public int total;
	
	
	private int vdNm;
	private String vdName;
	private String vdType;
	private int vdCnt;
	private int vdDay;
	private String vdCon;
	private int vdPrice;
	private String vaccineName;
	private String vaccineDate;
	private int vaccineCount;
	private int vaccinePrice;
	private int stTotal;
	
	
	

}
