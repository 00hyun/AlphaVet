package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocFileMapper {

	public List<Map<String, Object>> selectDiagnosisList(String empId)
			throws Exception;

	public int insertDocFile(String praCd) throws Exception;

	public int updateDocFile(Map<String, Object> json) throws Exception;

}
