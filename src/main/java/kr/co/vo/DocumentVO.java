package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DocumentVO {
	private String docCd;
	private String docName;
	private String docPrice;
	private String docPath;
	private String docCon;
}
