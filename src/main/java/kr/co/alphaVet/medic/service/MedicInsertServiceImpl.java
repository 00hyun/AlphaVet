package kr.co.alphaVet.medic.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.PraMapper;
import kr.co.vo.PraVO;

@Service
public class MedicInsertServiceImpl implements MedicInsertService {

	@Inject
	private PraMapper praMapper;

	@Override
	public String createPra(Map<String, Object> json) throws Exception {

		String recNm = (String) json.get("recNm");
		Map<String, Object> empVO = (Map<String, Object>) json.get("empVO");
		Map<String, Object> patientVO = (Map<String, Object>) json
				.get("patientVO");

		String cliCd = (String) empVO.get("cliCd");
		String empId = (String) empVO.get("empId");
		String patId = (String) patientVO.get("patId");
		String animalCd = (String) empVO.get("animalCd");
		double patWeight = (double) patientVO.get("patWeight");

		PraVO praVO = new PraVO();

		praVO.setCliCd(cliCd);
		praVO.setEmpId(empId);
		praVO.setPatId(patId);
		praVO.setPraDept(animalCd);
		praVO.setPraWeight(patWeight);
		praVO.setRecNm(Integer.parseInt(recNm));

		try {
			int checkNum = praMapper.insertPra(praVO);

			return checkNum < 1 ? "FAILED" : "OK";
		} catch (Exception e) {
			return "FAILED";
		}

	}

}
