package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnimalVO implements Serializable {

	private static final long serialVersionUID = -6194830081231758652L;

	private String animalCd;
	private String animalType;
	private String cliCd;

}
