package kr.co.alphaVet.admin.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.co.vo.ChatContentVO;
import kr.co.vo.ChatRoomVO;
import kr.common.CommonDao;

@Service
public class ChatServiceImpl implements ChatService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<ChatRoomVO> chatRoomList(String empId) {
		return commonDao.selectList("ChatMapper_chatRoomList", empId);
	}

	@Override
	public List<ChatContentVO> chatContent(int chRoomNm) {
		return commonDao.selectList("ChatMapper_chatContent", chRoomNm);
	}

	@Override
	public int insertChat(ChatContentVO chatContentVO) {
		return commonDao.insert("ChatMapper_insertChat", chatContentVO);
	}

	@Override
	public ChatContentVO selectChat(int chContentNm) throws Exception {
		return commonDao.select("ChatMapper_selectChat", chContentNm);
	}

	@Override
	public int makeChatRoom(ChatRoomVO chatRoomVO) throws Exception {
		return commonDao.insert("ChatMapper_makeChatRoom", chatRoomVO);
	}

	@Override
	public void insertChatEmpId(String[] emps, int chRoomNm) throws Exception {
		for(int i = 0; i<emps.length; i++) {
			Map<String, String> mapData = new HashMap<String, String>();
			mapData.put("empId", emps[i].replace("_", ""));
			mapData.put("chRoomNm", ""+chRoomNm);
			commonDao.insert("ChatMapper_insertChatEmpId", mapData);
		}
		
		commonDao.insert("ChatMapper_insertFirstChat", chRoomNm);
	}

	
}
