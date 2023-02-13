package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MedicMapper {

	public List<Map<String, Object>> selectSearchPatient(String searchValue)
			throws Exception;

}
