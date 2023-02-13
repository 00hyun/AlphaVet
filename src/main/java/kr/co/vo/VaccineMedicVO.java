package kr.co.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VaccineMedicVO implements Serializable {

	private static final long serialVersionUID = 3510355049725921726L;
	
	private String patId;
	private String vaccineName;
	private Date vaccineDate;
	private int vaccineCount;
	private int vdNm;
	private String praCd;
	
}
