package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DaDetailVO {
	private int    daDtNm        ;
	private int    daNm            ;
	private int    drugNm          ;
	private String buyerCd         ;
	private int    daDtAmount     ;
	private String daDtCheck      ;
	private int daDtPrice;
	private String daDtPriceCheck;
	private String daDtPriceday   ;
	
	private String itemName;
	private String itemEngName;
	private String entpName;
	private int drugCostPrice;
	private String buyerName;
}
