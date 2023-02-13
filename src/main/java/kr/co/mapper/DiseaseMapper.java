package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.DiseaseVO;

@Mapper
public interface DiseaseMapper {

	public List<DiseaseVO> selectDiseaseList() throws Exception;

}
