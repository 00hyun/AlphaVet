package kr.co.alphaVet.reservation.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.ReservationMapper;
import kr.co.vo.ReservationVO;
import kr.co.vo.SmsVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	private ReservationMapper mapper;

	@Override
	public List<ReservationVO> reservationList() throws Exception {
		return mapper.reservationList();
	}

	@Override
	public List<ReservationVO> getCalendar(String patId) throws Exception {
		return mapper.getCalendar(patId);
	}

	@Override
	public void insert(ReservationVO reservationVO) throws Exception {
		mapper.insert(reservationVO);
	}

	@Override
	public int delete(int resNm) throws Exception {
		return mapper.delete(resNm);
	}

	@Override
	public ReservationVO getCalendarOne(int resNm) throws Exception {
		return mapper.getCalendarOne(resNm);
	}

	@Override
	public ReservationVO selectOne(int resNm) throws Exception {
		return mapper.selectOne(resNm);
	}

	@Override
	public void update(ReservationVO reservationVO) throws Exception {
		mapper.update(reservationVO);
	}

	@Override
	public List<Map<String, Object>> autocompletePat(Map<String, Object> patNameMap) throws Exception {
		return mapper.autocompletePat(patNameMap);
	}

	@Override
	public List<Map<String, Object>> autocompleteEmp(Map<String, Object> empNameMap) throws Exception {
		return mapper.autocompleteEmp(empNameMap);
	}

	@Override
	public List<SmsVO> smsList() throws Exception {
		return mapper.smsList();
	}

	@Override
	public int sendSms(ReservationVO reservationVO) throws Exception {
		return mapper.sendSms(reservationVO);
	}

	@Override
	public List<ReservationVO> resEmpList() {
		return mapper.resEmpList();
	}




	


}
