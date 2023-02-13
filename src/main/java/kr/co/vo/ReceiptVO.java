package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceiptVO {

	private int recNm;
	private String patId;
	private int praRoomNm;
	private String animalCd;
	private String recDate;
	private String recPurpose;
	private String recStatus;

}
