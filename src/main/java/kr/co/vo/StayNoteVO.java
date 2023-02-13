package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StayNoteVO {
	
	private String stCd;
	private String snDate;
	private String snSpecal;
	private int stPrice;
	private String snCon;
	private String snHealthState;
	private double snTempState;
	private String snPooState;
	
	private int stFoodTotal;
}
