package kr.co.alphaVet.wonmu.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.AppReceiptVO;
import kr.co.vo.CageVO;
import kr.co.vo.DocFileVO;
import kr.co.vo.DrugVO;
import kr.co.vo.EmpVO;
import kr.co.vo.EnterVO;
import kr.co.vo.MemPatiVO;
import kr.co.vo.PatMemoVO;
import kr.co.vo.PatientVO;
import kr.co.vo.PaymentVO;
import kr.co.vo.PraVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.PreInVO;
import kr.co.vo.PreOutVO;
import kr.co.vo.RecPatientVO;
import kr.co.vo.ReceiptVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.StayVO;
import kr.co.vo.TestDetailVO;
import kr.co.vo.TestVO;
import kr.co.vo.VaccineDetailVO;
import kr.co.vo.VaccineVO;
import kr.co.vo.WardVO;

public interface WonmuService {
	
	public void addPet(MemPatiVO mempatiVO);
	public List<Pra_RoomVO> PraRoomList();
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap)throws Exception; 
	public MemPatiVO patDetail(MemPatiVO memPatiVO);
	public int startReceipt(ReceiptVO receiptVO);
//	public Map<Integer,List<PatientVO>> patientList(List<ReceiptVO> roomNmList);
	public List<RecPatientVO> patientList(Map<String, Object> param);
	public List<RecPatientVO> receiptList();
	public List<RecPatientVO> receiptList2();
	public int statusUpdate(String praCd);
	public List<PraVO> selectPra(MemPatiVO memPatiVO);
	public int updatePat(MemPatiVO memPatiVO);
	public int updatePat2(MemPatiVO memPatiVO);
	public MemPatiVO patIdSearch(String patId);
	public int updateWeight(String patId);
	public int updateRec(String patId);
	public RecPatientVO selectRecPat (String patId);
	public RecPatientVO showReceipt(RecPatientVO recPatientVO);
	public List<VaccineVO> vaccineList(MemPatiVO memPatiVO);
	public List<WardVO> countWard();
	public List<CageVO> countCage(int wardNm);
	public List<CageVO> vacantCage(int wardNm);
	public int insertEneter(StayVO stayVO);
	public int checkEneter(String praCd);
	public List<EnterVO> moneyDetail(String patId);
	public List<PreInVO> preInDetail(String patId);
	public List<TestDetailVO> testDetail(String patId);
	public int praStatusUpdate(String praCd);
	public List<ReservationVO> reservationList();
	public int paymentInsert(PaymentVO paymentVO);
	public String confirmPraCd(String patId);
	public int reservationUpdate(int resNm );
	public int updatePatImage(PatientVO patientVO);
	public int insertMemo(PatMemoVO patMemoVO);
	public List<PatMemoVO> showMemo(String patId);
	public int countAppReceipt();
	public List<AppReceiptVO> appReceiptList();
	public int appUpdate(String patId);
	public List<TestVO> praCdTest(String praCd);
	public List<DrugVO> praCdDrug(String praCd);
	public List<PraVO> praCdPra(String praCd);
	public List<VaccineDetailVO> praCdVaccine(String praCd);
	public List<EnterVO> praStayFood(String praCd);
	public List<EnterVO> praStayFoodCnt(String praCd);
	public int finalSum(String praCd);
	public int sum(String praCd);
	public int onlyStay(String praCd);
	public List<PatMemoVO> searchPatMemo(MemPatiVO memPatiVO);
	public EnterVO selectPracd(String praCd);
	public EnterVO selectPracd2(String praCd);
	public int updateEnter(String praCd);
	public String checkEnterYN(String praCd);
	public List<PreOutVO> praCdPreOut(String praCd);
	public MemPatiVO docReceipt(String praCd);
	public int countPreOut(String praCd);
	public PraVO praCdDate(String praCd);
	public int updateWeight(PatientVO patientVO);
	public int updateCageStatus(int cageNm);
	public List<PraVO> confirmWeight (MemPatiVO mempatiVO);
	public MemPatiVO doc2select(String praCd);
	public List<DocFileVO>  doc2pra(String praCd);
	public List<EmpVO> praRoomDoctor();













}
