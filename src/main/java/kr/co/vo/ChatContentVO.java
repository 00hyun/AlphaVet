package kr.co.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatContentVO {
	private int chContentNm;
	private String empId;
	private String empName;
	private int chRoomNm;
	private String chCon;
	private String chDate;
	private String empProfile;
	
	private String receiver;
}
