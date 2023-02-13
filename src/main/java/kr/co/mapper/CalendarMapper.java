package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.ScheduleVO;

@Mapper
public interface CalendarMapper {

	public List<ScheduleVO> getCalendar(String empId) throws Exception;
	public void insert(ScheduleVO schVO) throws Exception;
	public int delete(int schNm) throws Exception;
	public ScheduleVO selectOne(int schNm) throws Exception;
	public void update(ScheduleVO schVO) throws Exception;

}
