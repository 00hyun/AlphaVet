package kr.co.alphaPet.service;

import java.util.List;

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

public interface IAppHomeService {

	public List<PetVO> petList(String userId);

	public void insertPet(PetVO petVO);  //병원 인증 후 환자등록

	public void insertHos(HospitalVO hospitalVO);  //병원 인증 후 병원정보 등록

	public List<PetIsMemberVO> accessList(String userId);  //회원의 인증된 병원 / 환자 정보를 가져온다  

	public List<PraVO> carePraList(PetIsMemberVO vo) throws Exception;  //진료내역

	public List<VaccineVO> careVaccineList(PetIsMemberVO vo);  //백신내역

	public List<EnterVO> careStayList(PetIsMemberVO vo);  //입원내역

	public List<PetBoardVO> hosBoardList(String abType);  //병원 check 컨텐츠 리스트

	public List<AppStayVO> stayDetail(String stCd);  //입원상세

	public List<VaccineVO> vaccineDetail(VaccineVO vaccineVO);  //백신상세

	public int insertAppReceipt(String patId); //접수신청
	
	public int checkReceipt(String patId);//접수내역 확인(중복방지)

	public List<EmpVO> empList(String animalCd);  //예약할때 의사

	public List<ReservationVO> reservationList(String empId);  //예약 리스트

	public void reservationInsert(ReservationVO reservationVO);  //예약완료

	public List<ReservationVO> reservationMyList(String patId);
	
	public List<PraVO> patWeight(String patId);
	
	public List<AppCont1> cont1();
	
	public List<AppCont2> cont2();
	
}
