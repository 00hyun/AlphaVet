package kr.co.alphaVet.admin.employees;

import java.util.List;
import java.util.Map;

import kr.co.vo.EmpVO;

public interface EmployeesService {

	public List<EmpVO> empList() throws Exception;
	public int insertEmp(EmpVO empVO);
	public EmpVO selectEmp(String empId);
	public int updateEmp(EmpVO empVO);
	public int deleteEmp(String empId);
	public List<EmpVO> empListByAnimalCd(String animalCd);
	public List<Map<String, String>> searchEmpName(String empName) throws Exception;
	public void updateEmpCurrent(Map<String, String> map);
	public String selectEmpId(Map<String, Object> dataMap) throws Exception;
	public String selectEmpPassword(Map<String, Object> dataMap) throws Exception;
	public void updateEmpPw(Map<String, Object> dataMap) throws Exception;
	public int updateEmpState(Map<String, String> dataMap) throws Exception;
	public List<EmpVO> empAllList() throws Exception;
}
