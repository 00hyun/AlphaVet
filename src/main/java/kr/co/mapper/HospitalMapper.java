package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.HospitalVO;

@Mapper
public interface HospitalMapper {

	public HospitalVO selectHospital(String patId) throws Exception;

}
