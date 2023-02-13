package kr.co.alphaVet.admin.chat;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.ChatContentVO;
import kr.co.vo.ChatRoomVO;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Inject
	private ChatService cService;
	
	@ResponseBody
	@PostMapping("/chatRoomList")
	public List<ChatRoomVO> chatRoomList(Principal principal){
		return cService.chatRoomList(principal.getName());
	}
	
	@ResponseBody
	@PostMapping("/chatContent")
	public List<ChatContentVO> chatContentList(String chRoomNm){
		return cService.chatContent(Integer.parseInt(chRoomNm));
	}
	
	@ResponseBody
	@PostMapping("/sendChat")
	public ChatContentVO sendChat(ChatContentVO chatContentVO, Principal principal) throws Exception {
		String receiver = chatContentVO.getReceiver();

		chatContentVO.setEmpId(principal.getName());
		cService.insertChat(chatContentVO);
		
		int chContentNm = chatContentVO.getChContentNm();
		
		chatContentVO = cService.selectChat(chContentNm);
		chatContentVO.setReceiver(receiver);
		
		return chatContentVO;
	}
	
	@ResponseBody
	@PostMapping(value="/makeChatRoom")
	public int makeChatRoom(ChatRoomVO chatRoomVO) throws Exception {
		System.out.println("map : " + chatRoomVO.toString());
		
		String[] emps = chatRoomVO.getChatEmpId().split("_");
		
		if(chatRoomVO.getChRoomName() == null || chatRoomVO.getChRoomName() == "" || chatRoomVO.getChRoomName().length() == 0) {
			chatRoomVO.setChRoomName("_");
		}
		
//		ChatRoomVO chatRoomVO = new ChatRoomVO();
		
		chatRoomVO.setChPersonnel(emps.length);
		
		cService.makeChatRoom(chatRoomVO);
		cService.insertChatEmpId(emps, chatRoomVO.getChRoomNm());
		
		return 1;
	}
}
