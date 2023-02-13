package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.PraVO;

@Mapper
public interface PraMapper {

	public List<PraVO> selectPraList(String patId) throws Exception;

	public List<PraVO> selectPraListPast(String patId) throws Exception;

	public int insertPra(PraVO praVO) throws Exception;

	public int mergePra(PraVO praVO) throws Exception;

	public int updatePraCon(Map<String, Object> praConParams) throws Exception;

	public int preOutCheck(String recNm) throws Exception;

	public int calcPreInPrice(String recNm) throws Exception;

	public int calcTestDetailPrice(String recNm) throws Exception;

	public int calcVaccinePrice(String recNm) throws Exception;

	public PraVO selectPraByRec(String recNm) throws Exception;

}
