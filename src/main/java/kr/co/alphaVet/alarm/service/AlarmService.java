package kr.co.alphaVet.alarm.service;

import java.util.List;

import kr.co.vo.AlarmVO;

public interface AlarmService {
	public int insertAlart(AlarmVO alarmVO);
	public List<AlarmVO> alarmList(String empId);
	public int alarmUncheckCnt(String empId) throws Exception;
	public void checkAlarm(String empId) throws Exception;
}
