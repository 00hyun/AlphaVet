package kr.co.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	
	// Board 테이블
	private int boNm;
	private String cateCd;
	private String empId;
	private String boTitle;
	private String boCon;
	private int boHit;
	private String boDate;

	private String boWriter;

	// BoardCategory 테이블
	private String cateName;
	private Date cateDate;
	private String cateState;
	
	//emp테이블
	private String empName;
	private String empJob;
	


}
