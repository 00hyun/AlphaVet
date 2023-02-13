package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.EmpVO;

@Mapper
public interface EmployeesMapper {

	public List<EmpVO> EmployeesMapper_empList();
	
	public int insertEmp(EmpVO empVO);
	
	public EmpVO selectEmp(String empId);
	
	public int updateEmp(EmpVO empVO);
	
	public int deleteEmp(String empId);
	
	public EmpVO selectDoctor(String empId) throws Exception;


}
