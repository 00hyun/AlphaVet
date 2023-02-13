package kr.co.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DocFileVO implements Serializable {

	private static final long serialVersionUID = 2466808285799512738L;

	private String docDtNm;
	private String praCd;
	private int dfStatus;
	private String dfBreed;
	private String dfFurColor;
	private String dfFeature;
	private Date dfOutBreak;
	private String dfPrognosis;
	private String dfEtc;
	private String praDate;

}
