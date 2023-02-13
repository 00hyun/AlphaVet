package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MediTestMapper {
	public int uploadFile(String filePath) throws Exception;

	public List<Map<String, String>> selectFile() throws Exception;
}
