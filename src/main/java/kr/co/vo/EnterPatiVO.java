package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EnterPatiVO {

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
	private String pregnantChack;
	private String patNew;

	private String stCd;
	private String patId;
	private int stRoomNm;
	private String cliCd;
	private String empId;
	private String stStartDate;
	private String stEndDate;
	private int stTotalCnt;
	private int stTotalPrice;

	private int cageNm;
	private int wardNm;
	private int cageSize;
	private int cageCleanCheck;
	private String cageCon;

	private String wardName;
	private int wardAmount;

	private int foodNm;
	private String foodName;
	private int foodAmount;
	private String foodLastDate;
	private String foodCon;

	private String foodTime;
	private String stayType;

	private String snDate;
	private String snSpecal;
	private int snFoodPrice;
	private int snDrugPrice;
	private int snTodayPrice;
	private String snCon;
	private int snFoodCnt;
	private String snHealthState;
	private double snTempState;
	private String snPooState;

}
