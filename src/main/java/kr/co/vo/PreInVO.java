package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PreInVO implements Serializable {

	private static final long serialVersionUID = 726076975450918195L;

	private int preNm;
	private String praCd;
	private int drugNm;
	private String preInType;
	private String drugType;
	private int preInAmount;
	private int preInCnt;
	private int preInDays;
	private int preInPrice;
	
	private String itemName;
}
