package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CageVO {
	private int cageNm;
	private int wardNm;
	private String cageSize;
	private int cageCleanCheck;
	private String cageCon;
}
