package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.VaccineMedicVO;

@Mapper
public interface VaccineMapper {

	public List<VaccineMedicVO> selectVaccineList(String patId)
			throws Exception;

	public int insertVaccine(Map<String, Object> map) throws Exception;
	
	public int mergeVaccine(Map<String, Object> map) throws Exception;

}
