package kr.co.alphaVet.admin.chat;

import java.util.List;

import kr.co.vo.ChatContentVO;
import kr.co.vo.ChatRoomVO;

public interface ChatService {
	public List<ChatRoomVO> chatRoomList(String empId);
	public List<ChatContentVO> chatContent(int chRoomNm);
	public int insertChat(ChatContentVO chatContentVO);
	public ChatContentVO selectChat(int chContentNm) throws Exception ;
	public int makeChatRoom(ChatRoomVO chatRoomVO) throws Exception;
	public void insertChatEmpId(String[] emps, int chRoomNm) throws Exception;
}
