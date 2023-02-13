package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpAuthVO {

	private String empId;
	private String empAuthName;
	private String[] empAuthNameArray;

}
