package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.DrugVO;

@Mapper
public interface DrugMapper {

	public List<DrugVO> drugList();

	public List<DrugVO> selectMedicDrugList() throws Exception;

	public List<DrugVO> selectMedicPreOutList() throws Exception;

	public List<DrugVO> selectMedicPreInList() throws Exception;

	public int consumeDrug(Map<String, Object> params) throws Exception;

}
