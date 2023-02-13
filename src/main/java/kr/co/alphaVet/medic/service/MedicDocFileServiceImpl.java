package kr.co.alphaVet.medic.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.AnimalMapper;
import kr.co.mapper.ClinicMapper;
import kr.co.mapper.DisDetailMapper;
import kr.co.mapper.DocFileMapper;
import kr.co.mapper.EmployeesMapper;
import kr.co.mapper.MemberMapper;
import kr.co.mapper.PatientMapper;
import kr.co.mapper.PraMapper;
import kr.co.vo.AnimalVO;
import kr.co.vo.ClinicVO;
import kr.co.vo.DisDetailVO;
import kr.co.vo.EmpVO;
import kr.co.vo.MemberVO;
import kr.co.vo.PatientVO;
import kr.co.vo.PraVO;

@Service
public class MedicDocFileServiceImpl implements MedicDocFileService {

	@Inject
	private DocFileMapper docFileMapper;

	@Inject
	private PraMapper praMapper;

	@Inject
	private PatientMapper patientMapper;

	@Inject
	private MemberMapper memberMapper;

	@Inject
	private AnimalMapper animalMapper;

	@Inject
	private DisDetailMapper disDetailMapper;

	@Inject
	private ClinicMapper clinicMapper;

	@Inject
	private EmployeesMapper empMapper;

	@Override
	public List<Map<String, Object>> getDiagnosisList(String empId)
			throws Exception {
		List<Map<String, Object>> diagnosisList = docFileMapper
				.selectDiagnosisList(empId);

		return diagnosisList;
	}

	@Override
	public Map<String, Object> getDocFileData(String recNm) throws Exception {
		Map<String, Object> data = new HashMap<>();

		PraVO praVO = praMapper.selectPraByRec(recNm);
		PatientVO patientVO = patientMapper.selectPatient(praVO.getPatId());
		MemberVO memberVO = memberMapper.selectMember(patientVO.getMemId());
		AnimalVO animalVO = animalMapper.selectAnimal(patientVO.getAnimalCd());
		List<DisDetailVO> disDetailVOList = disDetailMapper
				.selectDisDetailList(praVO.getPraCd());
		ClinicVO clinicVO = clinicMapper.selectClinic(memberVO.getCliCd());
		EmpVO empVO = empMapper.selectDoctor(praVO.getEmpId());

		data.put("memberVO", memberVO);
		data.put("patientVO", patientVO);
		data.put("animalVO", animalVO);
		data.put("praVO", praVO);
		data.put("disDetailVOList", disDetailVOList);
		data.put("clinicVO", clinicVO);
		data.put("empVO", empVO);

		return data;
	}

	@Override
	public String saveDocFile(Map<String, Object> json) throws Exception {
		try {
			int checkNum = docFileMapper.updateDocFile(json);

			return checkNum < 1 ? "FAILED" : "OK";
		} catch (Exception e) {
			return "FAILED";
		}
	}

}
