package kr.co.alphaPet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.AppHomeMapper;
import kr.co.mapper.PraMapper;
import kr.co.vo.AppCont1;
import kr.co.vo.AppCont2;
import kr.co.vo.AppReceiptVO;
import kr.co.vo.AppStayVO;
import kr.co.vo.EmpVO;
import kr.co.vo.EnterPatiVO;
import kr.co.vo.EnterVO;
import kr.co.vo.HospitalVO;
import kr.co.vo.PatMemoVO;
import kr.co.vo.PetBoardVO;
import kr.co.vo.PetIsMemberVO;
import kr.co.vo.PetVO;
import kr.co.vo.PraVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.StayNoteVO;
import kr.co.vo.VaccineVO;

@Service
public class AppHomeServiceImpl implements IAppHomeService {

	@Inject
	private AppHomeMapper appHomeMapper;
	
	@Inject
	private PraMapper praMapper;

	@Override
	public List<PetVO> petList(String userId) {
		return appHomeMapper.petList(userId);
	}

	@Override
	public void insertPet(PetVO petVO) {
		appHomeMapper.insertPet(petVO);
	}

	@Override
	public void insertHos(HospitalVO hospitalVO) {
		appHomeMapper.insertHos(hospitalVO);
	}

	@Override
	public List<PetIsMemberVO> accessList(String userId) {
		return appHomeMapper.accessList(userId);
	}

	@Override
	public List<PraVO> carePraList(PetIsMemberVO vo) throws Exception {
		String patId = vo.getPatId();
		return appHomeMapper.selectPraList(patId);
		//return praMapper.selectPraList(patId);
	}

	@Override
	public List<VaccineVO> careVaccineList(PetIsMemberVO vo) {
		String patId = vo.getPatId();
		return appHomeMapper.careVaccineList(patId);
	}

	@Override
	public List<EnterVO> careStayList(PetIsMemberVO vo) {
		String patId = vo.getPatId();
		return appHomeMapper.careStayList(patId);
	}

	@Override
	public List<PetBoardVO> hosBoardList(String abType) {
		return appHomeMapper.hosBoardList(abType);
	}

	@Override
	public List<AppStayVO> stayDetail(String stCd) {
		return appHomeMapper.stayDetail(stCd);
	}

	@Override
	public List<VaccineVO> vaccineDetail(VaccineVO vaccineVO) {
		return appHomeMapper.vaccineDetail(vaccineVO);
	}

	@Override
	public int insertAppReceipt(String patId) {
		return appHomeMapper.insertAppReceipt(patId);
	}

	@Override
	public int checkReceipt(String patId) {
		return appHomeMapper.checkReceipt(patId);
	}

	@Override
	public List<EmpVO> empList(String animalCd) {
		return appHomeMapper.empList(animalCd);
	}

	@Override
	public List<ReservationVO> reservationList(String empId) {
		return appHomeMapper.reservationList(empId);
	}

	@Override
	public void reservationInsert(ReservationVO reservationVO) {
		appHomeMapper.reservationInsert(reservationVO);
	}

	@Override
	public List<ReservationVO> reservationMyList(String patId) {
		return appHomeMapper.reservationMyList(patId);
	}

	@Override
	public List<PraVO> patWeight(String patId) {
		return appHomeMapper.patWeight(patId);
	}

	@Override
	public List<AppCont1> cont1() {
		return appHomeMapper.cont1();
	}

	@Override
	public List<AppCont2> cont2() {
		return appHomeMapper.cont2();
	}


	
	
}
