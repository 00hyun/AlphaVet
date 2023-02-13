package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.ReservationVO;
import kr.co.vo.SmsVO;

@Mapper
public interface ReservationMapper {

	public List<ReservationVO> reservationList();
	
	public List<ReservationVO> selectReservListByEmpId(String empId);

	public List<ReservationVO> resEmpList();
	
	public List<ReservationVO> getCalendar(String patId) throws Exception;
	
	public void insert(ReservationVO reservationVO) throws Exception;
	
	public int delete(int resNm) throws Exception;
	
	public ReservationVO getCalendarOne(int resNm) throws Exception;
	
	public ReservationVO selectOne(int resNm) throws Exception;
	
	public void update(ReservationVO reservationVO) throws Exception;
	
	public List<Map<String, Object>>autocompletePat(Map<String, Object> patNameMap) throws Exception;
	
	public List<Map<String, Object>>autocompleteEmp(Map<String, Object> empNameMap) throws Exception;

	public List<SmsVO> smsList() throws Exception;
	
	public int sendSms(ReservationVO reservationVO) throws Exception;
	
}
