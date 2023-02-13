package kr.co.alphaVet.alarm.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.alarm.service.AlarmService;
import kr.co.vo.AlarmVO;

@Controller
public class AlarmController {
	
	@Inject
	private AlarmService aService;
	
	@ResponseBody
	@PostMapping("/alarmList")
	public List<AlarmVO> alarmList(Principal principal) {
		List<AlarmVO> alarmList = aService.alarmList(principal.getName());
		System.out.println(alarmList.toString());
		
		return alarmList;
	}
	
	@ResponseBody
	@PostMapping("/checkAlarm")
	public void checkAlarm(Principal principal) throws Exception {
		aService.checkAlarm(principal.getName());
	}
	
	@ResponseBody
	@PostMapping("/alarmUncheckedCnt")
	public int alarmUncheckedCnt(Principal principal) throws Exception {
		System.out.println("야호야호");
		return aService.alarmUncheckCnt(principal.getName());
	}
}
