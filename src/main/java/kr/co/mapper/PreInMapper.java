package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.PreInVO;

@Mapper
public interface PreInMapper {

	public List<PreInVO> selectPreInList(String praCd) throws Exception;

	public int insertPreIn(Map<String, Object> params) throws Exception;

}
