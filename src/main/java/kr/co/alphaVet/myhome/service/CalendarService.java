package kr.co.alphaVet.myhome.service;

import java.util.List;

import kr.co.vo.ScheduleVO;

public interface CalendarService {

	public List<ScheduleVO> getCalendar(String empId) throws Exception;
	
	public void insert(ScheduleVO schVO) throws Exception;
	
	public int  delete(int schNm) throws Exception;
	
	public ScheduleVO getCalendarOne(int schNm) throws Exception;
	
	public ScheduleVO selectOne(int schNm) throws Exception;
	
	public void update(ScheduleVO schVO) throws Exception;
}
