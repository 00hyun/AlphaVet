package kr.co.alphaVet.admin.patient;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.PatientMapper;
import kr.co.vo.MemPatiVO;
import kr.common.CommonDao;

@Service
public class PatientServiceImpl implements PatientService {

	@Inject
	PatientMapper pMapper;
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<MemPatiVO> patientList() throws Exception {
		return commonDao.list("PatientMapper_patientList", "");
	}

	@Override
	public MemPatiVO selectpat(String patId)  throws Exception{
		return commonDao.select("PatientMapper_selectPat", patId);
	}

	@Override
	public int updatepat(MemPatiVO memPaiVO) throws Exception {
		return commonDao.update("PatientMapper_updatePat", memPaiVO);
	}

}
