package kr.co.alphaVet.medic.service;

import java.util.List;
import java.util.Map;

public interface MedicDocFileService {

	public List<Map<String, Object>> getDiagnosisList(String empId)
			throws Exception;

	public Map<String, Object> getDocFileData(String recNm) throws Exception;

	public String saveDocFile(Map<String, Object> json) throws Exception;

}
