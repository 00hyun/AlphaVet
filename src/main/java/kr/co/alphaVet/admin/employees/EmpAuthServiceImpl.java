package kr.co.alphaVet.admin.employees;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.EmpAuthVO;
import kr.common.CommonDao;

@Service
public class EmpAuthServiceImpl implements EmpAuthService {
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public void insertEmpAuth(EmpAuthVO empAuthVO) {
		for(int i = 0; i < empAuthVO.getEmpAuthNameArray().length; i++) {
			empAuthVO.setEmpAuthName(empAuthVO.getEmpAuthNameArray()[i]);
			commonDao.insert("EmpAuthMapper_insertEmpAuth", empAuthVO);
		}
	}

	@Override
	public void updateEmpAuth(EmpAuthVO empAuthVO) {
		commonDao.delete("EmpAuthMapper_deleteEmpAuth", empAuthVO.getEmpId());
		
		for(int i = 0; i < empAuthVO.getEmpAuthNameArray().length; i++) {
			empAuthVO.setEmpAuthName(empAuthVO.getEmpAuthNameArray()[i]);
			commonDao.insert("EmpAuthMapper_insertEmpAuth", empAuthVO);
		}
	}

}
