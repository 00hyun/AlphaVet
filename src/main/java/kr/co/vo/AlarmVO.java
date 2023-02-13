package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmVO {
	private String alarmNm;
	private String empId;
	private String alarmCont;
	private String alarmDate;
	private String alarmCheck;
	private String alarmType;
}
