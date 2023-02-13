package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	private String patId;
	private int payNm;
	private String praCd;
	private int praTotal;
	private int payCash;
	private int payCard;
	private int payTotal;
	private String payDate;

}
