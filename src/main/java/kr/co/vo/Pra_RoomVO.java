package kr.co.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pra_RoomVO implements Serializable {

	private static final long serialVersionUID = 8077226545309399655L;

	private Integer praRoomNm;
	private String empId;
	private String empName;
	private String cliCd;
	private String animalCd;
}
