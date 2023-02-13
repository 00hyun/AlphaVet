package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.EmpVO;

@Mapper
public interface HomeMapper {
	
	public EmpVO selectDoctor(String empId) throws Exception;

}
