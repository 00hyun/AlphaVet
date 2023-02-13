package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.PreOutVO;

@Mapper
public interface PreOutMapper {

	public List<PreOutVO> selectPreOutList(String praCd) throws Exception;

	public int insertPreOut(Map<String, Object> params) throws Exception;

}
