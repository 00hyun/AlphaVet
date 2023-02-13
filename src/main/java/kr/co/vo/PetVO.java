package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PetVO {

	private String patId;
	private String userId;
	private String animalCd;
	private String patName;
	private double patWeight;
	private String patBirth;

}
