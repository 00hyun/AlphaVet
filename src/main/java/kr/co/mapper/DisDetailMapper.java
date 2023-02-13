package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.DisDetailVO;

@Mapper
public interface DisDetailMapper {

	public List<DisDetailVO> selectDisDetailList(String praCd) throws Exception;

	public int insertDisDetail(Map<String, String> params) throws Exception;

}
