package kr.co.vo;

import java.io.Serializable;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PatientVO implements Serializable {

	private static final long serialVersionUID = 6310271779708152380L;
	
	private String patId;
	private String memId;
	private String animalCd;
	private String cliCd;
	private String patName;
	@DateTimeFormat(iso = ISO.DATE)
	private String patBirth;
	private String patGender;
	private double patWeight;
	private String patAdd1;
	private String patAdd2;
	private String patChip;
	private String patRegnm;
	private String patAbandon;
	private String pregnantCheck;
	private String patNew;
	private String patMemo;
	private String patProfile;

}
