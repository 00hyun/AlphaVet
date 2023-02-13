package kr.co.alphaVet.wonmu.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.WonmuMapper;
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

@Service
public class WonmuServiceImpl implements WonmuService {

	@Inject
	WonmuMapper mapper;

	@Override
	public void addPet(MemPatiVO mempatiVO) {
		mapper.addPet(mempatiVO);
	}

	@Override
	public List<Pra_RoomVO> PraRoomList() {
		List<Pra_RoomVO> list = mapper.PraRoomList();
		return list;
	}

	@Override
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap)
			throws Exception {
		return mapper.autocomplete(paramMap);
	}

	@Override
	public MemPatiVO patDetail(MemPatiVO memPatiVO) {
		return mapper.patDetail(memPatiVO);
	}

	@Override
	public int startReceipt(ReceiptVO receiptVO) {
		return mapper.startReceipt(receiptVO);
	}

	@Override
	public List<RecPatientVO> patientList(Map<String, Object> param) {
		return mapper.patientList(param);
	}

	@Override
	public List<RecPatientVO> receiptList() {
		return mapper.receiptList();
	}
	@Override
	public List<RecPatientVO> receiptList2() {
		return mapper.receiptList2();
	}

	@Override
	public int statusUpdate(String praCd) {
		return mapper.statusUpdate(praCd);
	}

	@Override
	public List<PraVO> selectPra(MemPatiVO memPatiVO) {
		return mapper.selectPra(memPatiVO);
	}


	@Override
	public int updatePat2(MemPatiVO memPatiVO) {
		return mapper.updatePat2(memPatiVO);
				
	}

	@Override
	public MemPatiVO patIdSearch(String patId) {
		return mapper.patIdSearch(patId);
	}

	@Override
	public int updatePat(MemPatiVO memPatiVO) {
		return mapper.updatePat(memPatiVO);
	}

	@Override
	public int updateWeight(String patId) {
		return mapper.updateWeight(patId);
	}

	@Override
	public int updateRec(String patId) {
		return mapper.updateRec(patId);
	}

	@Override
	public RecPatientVO selectRecPat(String patId) {
		return mapper.selectRecPat(patId);
	}

	@Override
	public RecPatientVO showReceipt(RecPatientVO recPatientVO) {
		return mapper.showReceipt(recPatientVO);
	}

	@Override
	public List<VaccineVO> vaccineList(MemPatiVO memPatiVO) {
		return mapper.vaccineList(memPatiVO);
	}

	@Override
	public List<WardVO> countWard() {
		return mapper.countWard();
	}

	@Override
	public List<CageVO> countCage(int wardNm) {
		return mapper.countCage(wardNm);
	}

	@Override
	public List<CageVO> vacantCage(int wardNm) {
		return mapper.vacantCage(wardNm);
	}

	@Override
	public int insertEneter(StayVO stayVO) {
		return mapper.insertEneter(stayVO);
	}

	@Override
	public int checkEneter(String praCd) {
		return mapper.checkEneter(praCd);
	}

	@Override
	public List<EnterVO> moneyDetail(String patId) {
		return mapper.moneyDetail(patId);
	}

	@Override
	public List<PreInVO> preInDetail(String patId) {
		return mapper.preInDetail(patId);
	}

	@Override
	public List<TestDetailVO> testDetail(String patId) {
		return mapper.testDetail(patId);
	}

	@Override
	public int praStatusUpdate(String praCd) {
		return mapper.praStatusUpdate(praCd);
	}

	@Override
	public List<ReservationVO> reservationList() {
		return mapper.reservationList();
	}

	@Override
	public int paymentInsert(PaymentVO paymentVO) {
		return mapper.paymentInsert(paymentVO);
	}

	@Override
	public String confirmPraCd(String patId) {
		return mapper.confirmPraCd(patId);
	}

	@Override
	public int reservationUpdate(int resNm) {
		return mapper.reservationUpdate(resNm);
	}

	@Override
	public int updatePatImage(PatientVO patientVO) {
		return mapper.updatePatImage(patientVO);
	}

	@Override
	public int insertMemo(PatMemoVO patMemoVO) {
		return mapper.insertMemo(patMemoVO);
	}

	@Override
	public List<PatMemoVO> showMemo(String patId) {
		return mapper.showMemo(patId);
	}

	@Override
	public int countAppReceipt() {
		return mapper.countAppReceipt();
	}

	@Override
	public List<AppReceiptVO> appReceiptList() {
		return mapper.appReceiptList();
	}

	@Override
	public int appUpdate(String patId) {
		return mapper.appUpdate(patId);
	}

	@Override
	public List<TestVO> praCdTest(String praCd) {
		return mapper.praCdTest(praCd);
	}

	@Override
	public List<DrugVO> praCdDrug(String praCd) {
		return mapper.praCdDrug(praCd);
	}

	@Override
	public List<PraVO> praCdPra(String praCd) {
		return mapper.praCdPra(praCd);
	}

	@Override
	public List<VaccineDetailVO> praCdVaccine(String praCd) {
		return mapper.praCdVaccine(praCd);
	}

	@Override
	public List<EnterVO> praStayFood(String praCd) {
		return mapper.praStayFood(praCd);
	}

	@Override
	public int finalSum(String praCd) {
		return mapper.finalSum(praCd);
	}

	@Override
	public int onlyStay(String praCd) {
		return mapper.onlyStay(praCd);
	}

	@Override
	public List<PatMemoVO> searchPatMemo(MemPatiVO memPatiVO) {
		return mapper.searchPatMemo(memPatiVO);
	}

	@Override
	public EnterVO selectPracd(String praCd) {
		return mapper.selectPracd(praCd);
	}

	@Override
	public EnterVO selectPracd2(String praCd) {
		return mapper.selectPracd2(praCd);
	}

	@Override
	public int sum(String praCd) {
		return mapper.sum(praCd);
	}

	@Override
	public int updateEnter(String praCd) {
		return mapper.updateEnter(praCd);
	}

	@Override
	public List<EnterVO> praStayFoodCnt(String praCd) {
		return mapper.praStayFoodCnt(praCd);
	}

	@Override
	public String checkEnterYN(String praCd) {
		return mapper.checkEnterYN(praCd);
	}

	@Override
	public List<PreOutVO> praCdPreOut(String praCd) {
		return mapper.praCdPreOut(praCd);
	}

	@Override
	public MemPatiVO docReceipt(String praCd) {
		return mapper.docReceipt(praCd);
	}

	@Override
	public int countPreOut(String praCd) {
		return mapper.countPreOut(praCd);
	}

	@Override
	public PraVO praCdDate(String praCd) {
		return mapper.praCdDate(praCd);
	}

	@Override
	public int updateWeight(PatientVO patientVO) {
		return mapper.updateWeight(patientVO);
	}
	
	@Override
	public int updateCageStatus(int cageNm) {
		return mapper.updateCageStatus(cageNm);
	}

	@Override
	public List<PraVO> confirmWeight(MemPatiVO mempatiVO) {
		return mapper.confirmWeight(mempatiVO);
	}

	@Override
	public MemPatiVO doc2select(String praCd) {
		return  mapper.doc2select(praCd);
	}

	@Override
	public List<EmpVO> praRoomDoctor() {
		return mapper.praRoomDoctor();
	}

	@Override
	public List<DocFileVO>  doc2pra(String praCd) {
		return mapper.doc2pra(praCd);
	}


	
	


}
