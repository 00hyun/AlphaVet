package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PetIsMemberVO {
	private String userId;
	
	private String memId;
	private String memName;
	private String memTel;
	private String patId;
	private String animalCd;
	private String cliCd;
	private String patName;
	private String patBirth;
	private String patGender;
	private double patWeight;
	private String patAdd1;
	private String patAdd2;
	private String patChip;
	private String patRegnm;
	private String patAbandon;
	private String pregnantChack;
	private String patNew;
	private String patMemo;

	private String hosNm   ;
	private String cliName ;
	private String cliAddr1;
	private String cliAddr2;
	private String cliTel  ;
}
