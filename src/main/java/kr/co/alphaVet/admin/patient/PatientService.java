package kr.co.alphaVet.admin.patient;

import java.util.List;

import kr.co.vo.MemPatiVO;

public interface PatientService {

	public List<MemPatiVO> patientList() throws Exception;
	public MemPatiVO selectpat(String patId) throws Exception;
	public int updatepat(MemPatiVO memPaiVO) throws Exception;
}
