package kr.co.alphaVet.alarm;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.alphaVet.admin.employees.EmployeesService;
import kr.co.alphaVet.alarm.service.AlarmService;
import kr.co.vo.AlarmVO;
import kr.co.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@ServerEndpoint(value="/alarm")
public class AlarmHandler extends TextWebSocketHandler {
	
	@Inject
	AlarmService aService;
	
	@Inject
	EmployeesService eService;
	
	//로그인 한 인원 전체
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	//클라이언트가 서버에 접속 성공시 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("Socket 연결");
		if(session.getAttributes().get("userId") != null) {
			sessionMap.put(""+session.getAttributes().get("userId"), session);
			
		}else {
			Principal principal = session.getPrincipal();
			sessionMap.put(principal.getName(), session);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("empId", principal.getName());
			map.put("empCurrent", "I");
			eService.updateEmpCurrent(map);
		}
		System.out.println(sessionMap.toString());
	}
	
	//소켓에 메세지를 보냈을 때 호출
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("소켓 메시지 호출");	
		String msg = message.getPayload();
		log.info("msg = " + msg);
		
		String[] msgArray = msg.split("&");
		
		if(msgArray[0].equals("alarm")) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setEmpId(msgArray[1]);
			alarmVO.setAlarmCont(msgArray[2]);
			alarmVO.setAlarmType(msgArray[3]);
			alarmVO.setAlarmNm(msgArray[4]+"-alarm");
			
			aService.insertAlart(alarmVO);
			
			if(sessionMap.containsKey(alarmVO.getEmpId())) {
				sessionMap.get(alarmVO.getEmpId()).sendMessage(new TextMessage(msgArray[0] + "&" + alarmVO.getAlarmCont() + "&" + msgArray[3]));
			}
		}else if(msgArray[0].equals("chat")) {
			String[] receiver = msgArray[1].split("_");
			System.out.println(msgArray[1] + " 크기 : " + receiver.length);
			
			String[] msgContArray = msgArray[2].split("_");
			String msgContent = msgContArray[0];
			String msgDate = msgContArray[1];
			
			for(int i = 0; i<receiver.length; i++) {
				System.out.println(receiver[i]);
				if(sessionMap.containsKey(receiver[i])&&(!receiver[i].equals(msgArray[4]))) {
					System.out.println(receiver[i]);
					sessionMap.get(receiver[i]).sendMessage(new TextMessage(msgArray[0] + "&" + 
																			msgContent + "&" + 
																			msgDate + "&" + 
																			msgArray[3] + "&" +
																			msgArray[6] + "&" + 
																			msgArray[5] 
															));
				}			
			}
		}else if(msgArray[0].equals("receipt")){		// 접수 알림일 때 모든 접속자에게 접수 알림 보내기
			
			
			
			for(String empId : sessionMap.keySet()) {
				WebSocketSession sessionTemp = sessionMap.get(empId);
				sessionTemp.sendMessage(new TextMessage(msgArray[0] + "&" +  
														msgArray[1] + " &" +
														msgArray[2]
										));
			}
		}

	}

	//연결이 종료됐을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("소켓 종료");
		//전체 세션리스트에서 세션 삭제 
		
		if(session.getAttributes().get("userId") != null) {
			sessionMap.remove(session.getAttributes().get("userId"));
		}else {
			Principal principal = session.getPrincipal();
			sessionMap.put(principal.getName(), session);

			sessionMap.remove(principal.getName());

			Map<String, String> map = new HashMap<String, String>();
			map.put("empId", principal.getName());
			map.put("empCurrent", "O");
			eService.updateEmpCurrent(map);
		}
	}
	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		EmpVO loginUser = (EmpVO)httpSession.get("login");
		
		if(loginUser == null) {
			String empId = session.getId();
			return empId;
		}
		String empId = loginUser.getEmpId();
		return empId;
		
	}
}
