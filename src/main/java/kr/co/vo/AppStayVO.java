package kr.co.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AppStayVO {
	//stay테이블
	private String stCd;
	private String praCd;
	private String patId;
	private int cageNm;
	private String cliCd;
	private String empId;
	private String stStartDate;
	private String stEndDate;
	private int stDays;
	private int stTotal;
	private int stFoodTotal;
	private String stState;
	
	//stay_note테이블
	private String snNm;
	private String snDate;
	private String snSpecal;
	private int stPrice;
	private String snCon;
	private String snHealthState;
	private double snTempState;
	private String snPooState;
	
	//food테이블
	private int foodNm        ;
	private String foodName      ;
	private int foodAmount    ;
	private String foodLast_Date ;
	private String foddCon       ;
	private int foodPrice     ;
	private String foodType      ;
	
	//food_detail테이블
	private int foodDtNm  ;
	private String foodDate  ;
	
	private List<FoodVO> foodList;
	
}
