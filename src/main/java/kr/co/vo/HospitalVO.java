package kr.co.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HospitalVO {
	private String hosNm   ;
	private String patId   ;
	private String cliCd   ;
	private String cliName ;
	private String cliAddr1;
	private String cliAddr2;
	private String cliTel  ;

	private String praCon; 
	private String praDate; 
}
