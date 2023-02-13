package kr.co.alphaVet.medic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.DisDetailMapper;
import kr.co.mapper.DiseaseMapper;
import kr.co.mapper.DrugMapper;
import kr.co.mapper.EmployeesMapper;
import kr.co.mapper.MedicMapper;
import kr.co.mapper.PatientMapper;
import kr.co.mapper.PraMapper;
import kr.co.mapper.PraRoomMapper;
import kr.co.mapper.PreInMapper;
import kr.co.mapper.PreOutMapper;
import kr.co.mapper.ReceiptMapper;
import kr.co.mapper.ReservationMapper;
import kr.co.mapper.TestDetailMapper;
import kr.co.mapper.TestMapper;
import kr.co.mapper.VaccineDetailMapper;
import kr.co.mapper.VaccineMapper;
import kr.co.mapper.WonmuMapper;
import kr.co.vo.DisDetailVO;
import kr.co.vo.DiseaseVO;
import kr.co.vo.DrugVO;
import kr.co.vo.EmpVO;
import kr.co.vo.PatientVO;
import kr.co.vo.PraVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.PreInVO;
import kr.co.vo.PreOutVO;
import kr.co.vo.ReceiptVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.TestDetailVO;
import kr.co.vo.TestVO;
import kr.co.vo.VaccineDetailVO;
import kr.co.vo.VaccineMedicVO;

@Service
public class MedicSelectServiceImpl implements MedicSelectService {

	@Inject
	private WonmuMapper wonmuMapper;

	@Inject
	private ReservationMapper reservationMapper;

	@Inject
	private EmployeesMapper empMapper;

	@Inject
	private DisDetailMapper disDetailMapper;

	@Inject
	private TestDetailMapper testDetailMapper;

	@Inject
	private PreOutMapper preOutMapper;

	@Inject
	private PreInMapper preInMapper;

	@Inject
	private PraRoomMapper praRoomMapper;

	@Inject
	private ReceiptMapper receiptMapper;

	@Inject
	private PatientMapper patientMapper;

	@Inject
	private VaccineMapper vaccineMapper;

	@Inject
	private VaccineDetailMapper vaccineDetailMapper;

	@Inject
	private PraMapper praMapper;

	@Inject
	private MedicMapper medicMapper;

	@Inject
	private DiseaseMapper diseaseMapper;

	@Inject
	private TestMapper testMapper;

	@Inject
	private DrugMapper drugMapper;

//	@Inject
//	private Dummy dummy;

	@Override
	public List<Pra_RoomVO> PraRoomList() throws Exception {
		List<Pra_RoomVO> praRoomVOlist = wonmuMapper.PraRoomList();

		return praRoomVOlist;
	}

	@Override
	public List<ReservationVO> reservationListByEmpId(String empId)
			throws Exception {
		List<ReservationVO> reservationList = reservationMapper
				.selectReservListByEmpId(empId);

		return reservationList;
	}

	@Override
	public String checkRoomNm(String empId) throws Exception {
		String roomNm = praRoomMapper.selectPraRoomNm(empId);

		return roomNm;
	}

	@Override
	public Map<String, Object> doctorInfo(String empId) throws Exception {
		EmpVO empVO = empMapper.selectDoctor(empId);
		Pra_RoomVO praRoomVO = praRoomMapper.selectPraRoom(empId);

		Map<String, Object> info = new HashMap<>();

		info.put("empVO", empVO);
		info.put("praRoomVO", praRoomVO);

		return info;
	}

	@Override
	public Map<String, Object> patientInfo(String recNm, String patId)
			throws Exception {
		ReceiptVO receiptVO = receiptMapper
				.selectReceipt(Integer.parseInt(recNm));
		PatientVO patientVO = patientMapper.selectPatient(patId);
		List<PraVO> praVOList = praMapper.selectPraList(patId);
		List<VaccineMedicVO> vaccineVOList = vaccineMapper
				.selectVaccineList(patId);

		List<Map<String, Object>> praList = new ArrayList<>();
		List<Map<String, Object>> vaccineList = new ArrayList<>();

		// praVOList -> joined로 테스트
		if (praVOList != null && praVOList.size() > 0) {
			for (PraVO praVO : praVOList) {
				String empId = praVO.getEmpId();

				EmpVO empVO = empMapper.selectDoctor(empId);
				List<DisDetailVO> disDetailList = disDetailMapper
						.selectDisDetailList(praVO.getPraCd());
				List<TestDetailVO> testDetailList = testDetailMapper
						.selectTestDetailList(praVO.getPraCd());
				List<PreOutVO> preOutList = preOutMapper
						.selectPreOutList(praVO.getPraCd());
				List<PreInVO> preInList = preInMapper
						.selectPreInList(praVO.getPraCd());

				Map<String, Object> data = new HashMap<>();

				data.put("praVO", praVO);
				data.put("empVO", empVO);
				data.put("disDetailList", disDetailList);
				data.put("testDetailList", testDetailList);
				data.put("preOutList", preOutList);
				data.put("preInList", preInList);

				praList.add(data);
			}
		}

		if (vaccineVOList != null && vaccineVOList.size() > 0) {
			for (VaccineMedicVO vaccineMedicVO : vaccineVOList) {
				int vdNm = vaccineMedicVO.getVdNm();

				VaccineDetailVO vaccineDetailVO = vaccineDetailMapper
						.selectVaccineByVdNm(vdNm);

				Map<String, Object> data = new HashMap<>();

				data.put("vaccineVO", vaccineMedicVO);
				data.put("vaccineDetailVO", vaccineDetailVO);

				vaccineList.add(data);
			}
		}

		Map<String, Object> info = new HashMap<>();

		info.put("receiptVO", receiptVO);
		info.put("patientVO", patientVO);
		info.put("praList", praList);
		info.put("vaccineList", vaccineList);

		return info;
	}

	@Override
	public Map<String, Object> showPatientInMedic(String empId)
			throws Exception {
		Map<String, Object> info = new HashMap<>();
		List<Map<String, Object>> praList = new ArrayList<>();
		List<Map<String, Object>> vaccineList = new ArrayList<>();

		PatientVO patientVO = patientMapper.selectPatientInMedic(empId);

		if (patientVO == null) {
			info.put("receiptVO", new HashMap<String, Object>());
			info.put("patientVO", new HashMap<String, Object>());
			info.put("praList", praList);
			info.put("vaccineList", vaccineList);
		} else {
			ReceiptVO receiptVO = receiptMapper
					.selectReceiptInMedic(patientVO.getPatId());
			List<PraVO> praVOList = praMapper
					.selectPraListPast(patientVO.getPatId());
			List<VaccineMedicVO> vaccineVOList = vaccineMapper
					.selectVaccineList(patientVO.getPatId());

			if (praVOList != null && praVOList.size() > 0) {
				for (PraVO praVO : praVOList) {
					EmpVO empVO = empMapper.selectDoctor(empId);
					List<DisDetailVO> disDetailList = disDetailMapper
							.selectDisDetailList(praVO.getPraCd());
					List<TestDetailVO> testDetailList = testDetailMapper
							.selectTestDetailList(praVO.getPraCd());
					List<PreOutVO> preOutList = preOutMapper
							.selectPreOutList(praVO.getPraCd());
					List<PreInVO> preInList = preInMapper
							.selectPreInList(praVO.getPraCd());

					Map<String, Object> data = new HashMap<>();

					data.put("praVO", praVO);
					data.put("empVO", empVO);
					data.put("disDetailList", disDetailList);
					data.put("testDetailList", testDetailList);
					data.put("preOutList", preOutList);
					data.put("preInList", preInList);

					praList.add(data);
				}
			}

			if (vaccineVOList != null && vaccineVOList.size() > 0) {
				for (VaccineMedicVO vaccineMedicVO : vaccineVOList) {
					int vdNm = vaccineMedicVO.getVdNm();

					VaccineDetailVO vaccineDetailVO = vaccineDetailMapper
							.selectVaccineByVdNm(vdNm);

					Map<String, Object> data = new HashMap<>();

					data.put("vaccineVO", vaccineMedicVO);
					data.put("vaccineDetailVO", vaccineDetailVO);

					vaccineList.add(data);
				}
			}

			info.put("receiptVO", receiptVO);
			info.put("patientVO", patientVO);
			info.put("praList", praList);
			info.put("vaccineList", vaccineList);
		}

		return info;
	}

	@Override
	public List<Map<String, Object>> searchPatient(String searchValue)
			throws Exception {
		List<Map<String, Object>> list = medicMapper
				.selectSearchPatient(searchValue);

		return list;
	}

	@Override
	public List<DiseaseVO> searchDiseaseList() throws Exception {
		List<DiseaseVO> list = diseaseMapper.selectDiseaseList();

		return list;
	}

	@Override
	public List<TestVO> searchTestList() throws Exception {
		List<TestVO> list = testMapper.selectTestList();

		return list;
	}

	@Override
	public List<DrugVO> searchDrugList() throws Exception {
		List<DrugVO> list = drugMapper.selectMedicDrugList();

		return list;
	}

	@Override
	public List<DrugVO> searchPreOutList() throws Exception {
		List<DrugVO> list = drugMapper.selectMedicPreOutList();

		return list;
	}

	@Override
	public List<DrugVO> searchPreInList() throws Exception {
		List<DrugVO> list = drugMapper.selectMedicPreInList();

		return list;
	}

	@Override
	public List<VaccineDetailVO> searchVaccineList() throws Exception {
		List<VaccineDetailVO> list = vaccineDetailMapper.selectVaccineList();

		return list;
	}

}
