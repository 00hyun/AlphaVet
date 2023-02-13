package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.TestVO;

@Mapper
public interface TestMapper {

	public List<TestVO> selectTestList() throws Exception;
	
}
