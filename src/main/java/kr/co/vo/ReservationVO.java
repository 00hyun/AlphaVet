package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReservationVO {

	private int resNm;
	private String empId;
	private String patId;
	private String resType;
	private String resMemo;
	
	private String patName;
	private String empName;
	private String memTel;
	
	private String resTitle;
	private String resCont;
	private String resStartDate;
	private String resTime;
	private String resEndDate;
	private boolean resAllDay;
	private String resColor;
	
	
	private String smsCon;
	private int smsNm;

}
