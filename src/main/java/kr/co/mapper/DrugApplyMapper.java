package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.DrugApplyVO;

@Mapper
public interface DrugApplyMapper {

	public List<DrugApplyVO> daList(Map<String, Object> dataMap);
}
