package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PreOutVO implements Serializable {

	private static final long serialVersionUID = -2076990427299437147L;

	private String preOutCd;
	private String praCd;
	private int drugNm;
	private int preOutAmount;
	private int preOutCnt;
	private int preOutDays;
	
	private String itemName;
}
