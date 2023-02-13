package kr.co.alphaVet.myhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.CalendarMapper;
import kr.co.vo.ScheduleVO;


@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	private CalendarMapper mapper;
	
	@Override
	public List<ScheduleVO> getCalendar(String empId) throws Exception {
		return  mapper.getCalendar(empId);
	}
	
	@Override
	public void insert(ScheduleVO schVO) throws Exception {
		mapper.insert(schVO);
	}

	@Override
	public int delete(int schNm) throws Exception{
		return mapper.delete(schNm);
	}

	@Override
	public ScheduleVO getCalendarOne(int schNm) throws Exception {
		return mapper.selectOne(schNm);
	}

	@Override
	public ScheduleVO selectOne(int schNm) throws Exception {
		return mapper.selectOne(schNm);
	}

	@Override
	public void update(ScheduleVO schNm) throws Exception {
		mapper.update(schNm);
	}
}
