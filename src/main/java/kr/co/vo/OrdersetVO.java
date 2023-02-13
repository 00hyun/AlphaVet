package kr.co.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersetVO {
	private int orderNm;
	private String empId;
	private String orderName;
	private String orderCon;
	private int orderSetCnt;
	
	private List<OrderDetailVO> orderDetailVOList;
}
