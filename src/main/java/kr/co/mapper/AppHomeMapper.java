package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.AppCont1;
import kr.co.vo.AppCont2;
import kr.co.vo.AppReceiptVO;
import kr.co.vo.AppStayVO;
import kr.co.vo.EmpVO;
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

@Mapper
public interface AppHomeMapper {

	public List<PetVO> petList(String userId);

	public void insertPet(PetVO petVO);

	public void insertHos(HospitalVO hospitalVO);

	public List<PetIsMemberVO> accessList(String userId);

	public List<VaccineVO> careVaccineList(String patId);

	public List<EnterVO> careStayList(String patId);

	public List<PetBoardVO> hosBoardList(String abType);

	public List<AppStayVO> stayDetail(String stCd);

	public List<VaccineVO> vaccineDetail(VaccineVO vaccineVO);
	
	public PatMemoVO appReceipt(String patId);
	
	public int insertAppReceipt(String patId);
	
	public int checkReceipt(String patId);

	public List<EmpVO> empList(String animalCd);

	public List<ReservationVO> reservationList(String empId);

	public void reservationInsert(ReservationVO reservationVO);

	public List<ReservationVO> reservationMyList(String patId);

	public List<PraVO> selectPraList(String patId);
	
	public List<PraVO> patWeight(String patId);
	
	public List<AppCont1> cont1();
	
	public List<AppCont2> cont2();
}
