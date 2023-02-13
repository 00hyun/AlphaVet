package kr.co.alphaVet.medic.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.DiseaseVO;
import kr.co.vo.DrugVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.TestVO;
import kr.co.vo.VaccineDetailVO;

public interface MedicSelectService {

	public List<Pra_RoomVO> PraRoomList() throws Exception;

	public List<ReservationVO> reservationListByEmpId(String empId)
			throws Exception;

	public String checkRoomNm(String empId) throws Exception;

	public Map<String, Object> doctorInfo(String empId) throws Exception;

	public Map<String, Object> patientInfo(String recNm, String patId)
			throws Exception;

	public Map<String, Object> showPatientInMedic(String empId)
			throws Exception;

	public List<Map<String, Object>> searchPatient(String searchValue)
			throws Exception;

	public List<DiseaseVO> searchDiseaseList() throws Exception;

	public List<TestVO> searchTestList() throws Exception;

	public List<DrugVO> searchDrugList() throws Exception;

	public List<DrugVO> searchPreOutList() throws Exception;

	public List<DrugVO> searchPreInList() throws Exception;

	public List<VaccineDetailVO> searchVaccineList() throws Exception;

}
