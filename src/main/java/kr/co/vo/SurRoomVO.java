package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurRoomVO {
	private int surRoomNm;
	private String animalCd;
	private String cliCd;
	
	private int[] surRoomNms;
	private String[] animalCds;
	private String[] cliCds;
}
