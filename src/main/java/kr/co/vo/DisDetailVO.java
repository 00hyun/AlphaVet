package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DisDetailVO implements Serializable {

	private static final long serialVersionUID = -2033034307552828858L;

	private String disDtNm;
	private String disCd;
	private String praCd;
	private String disName;

}
