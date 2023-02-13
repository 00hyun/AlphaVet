package kr.co.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomVO {
	private int chRoomNm;
	private int chPersonnel;
	private String chCon;
	private String chDate;
	private String chRoomName;
	
	private String chatEmpId;
	
	List<ChatEmpVO> chatEmpList = null;
	List<ChatContentVO> chatContentList = null;
}
