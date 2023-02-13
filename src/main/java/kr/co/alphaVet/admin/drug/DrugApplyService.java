package kr.co.alphaVet.admin.drug;

import java.util.List;
import java.util.Map;

import kr.co.vo.DaDetailVO;
import kr.co.vo.DrugApplyVO;

public interface DrugApplyService {
	public List<DrugApplyVO> daList(Map<String, Object> dataMap);
	public List<DaDetailVO> daDetail(int daNm) throws Exception;
	public int insertDa(List<DaDetailVO> daDetailList) throws Exception;
	public int updateDaDtCheck(List<DaDetailVO> daDetailList) throws Exception;
}
