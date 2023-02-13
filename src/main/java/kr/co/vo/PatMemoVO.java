package kr.co.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class PatMemoVO implements Serializable {

	private static final long serialVersionUID = -3289426793530901971L;

	private int patMemoNm;
	private String empJob;
	private String empProfile;
	private String patId;
	private String empId;
	private Date patMemoDate;
	private String memoDate;
	private String memoDate2;
	private String patMemoCon;
	private String empName;

}
