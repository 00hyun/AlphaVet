package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VaccineDetailVO implements Serializable {

	private static final long serialVersionUID = -1730113364260787725L;
	
	private String vdNm;
	private String animalCd;
	private String vdName;
	private String vdType;
	private String vdCnt;
	private String vdDay;
	private String vdCon;
	private String vdPrice;

}
