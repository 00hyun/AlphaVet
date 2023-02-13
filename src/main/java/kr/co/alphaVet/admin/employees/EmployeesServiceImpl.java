package kr.co.alphaVet.admin.employees;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.EmployeesMapper;
import kr.co.vo.EmpVO;
import kr.common.CommonDao;

@Service
public class EmployeesServiceImpl implements EmployeesService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Inject
	EmployeesMapper eMapper;
	
	@Override
	public List<EmpVO> empList() throws Exception{
		return commonDao.selectList("EmployeesMapper_empList");
	}

	@Override
	public int insertEmp(EmpVO empVO) {
		return eMapper.insertEmp(empVO);
	}

	@Override
	public EmpVO selectEmp(String empId) {
		return eMapper.selectEmp(empId);
	}

	@Override
	public int updateEmp(EmpVO empVO) {
		return eMapper.updateEmp(empVO);
	}

	@Override
	public int deleteEmp(String empId) {
		return eMapper.deleteEmp(empId);
	}

	@Override
	public List<EmpVO> empListByAnimalCd(String animalCd) {
		return commonDao.selectList("EmployeesMapper_empListByAnimalCd", animalCd);
	}

	@Override
	public List<Map<String, String>> searchEmpName(String empName) throws Exception {
		return commonDao.selectList("EmployeesMapper_searchEmpName", empName);
	}

	@Override
	public void updateEmpCurrent(Map<String, String> map) {
		commonDao.update("EmployeesMapper_updateEmpCurrent", map);
	}

	@Override
	public String selectEmpId(Map<String, Object> dataMap) throws Exception {
		return commonDao.select("EmployeesMapper_selectEmpId", dataMap);
	}

	@Override
	public String selectEmpPassword(Map<String, Object> dataMap) throws Exception {
		return commonDao.select("EmployeesMapper_selectEmpPassword", dataMap);
	}

	@Override
	public void updateEmpPw(Map<String, Object> dataMap) throws Exception {
		commonDao.update("EmployeesMapper_updateEmpPassword", dataMap);
	}

	@Override
	public int updateEmpState(Map<String, String> dataMap) throws Exception {
		commonDao.delete("EmpAuthMapper_deleteEmpAuth", dataMap.get("empId"));
		if(dataMap.get("empState").equals("퇴사")) {
			commonDao.insert("EmployeesMapper_updateRetireDate", dataMap);
		}
		return commonDao.update("EmployeesMapper_updateEmpState", dataMap);
	}

	@Override
	public List<EmpVO> empAllList() throws Exception {
		return commonDao.selectList("EmployeesMapper_empList2");
	}
	

}
