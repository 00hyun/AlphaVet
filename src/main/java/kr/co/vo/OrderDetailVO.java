package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailVO {
	private String orderCd;
	private int orderNm;
	private String orderDtType;
	private String orderDtName;
	private String drugIo;
}
