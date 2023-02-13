package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.TestDetailVO;

@Mapper
public interface TestDetailMapper {

	public List<TestDetailVO> selectTestDetailList(String praCd)
			throws Exception;

	public int insertTestDetail(Map<String, Object> params) throws Exception;

}
