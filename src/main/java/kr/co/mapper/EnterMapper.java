package kr.co.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.vo.EnterPatiVO;
import kr.co.vo.EnterVO;

@Mapper
public interface EnterMapper {

	public List<EnterPatiVO> dogList() throws Exception;

	public List<EnterPatiVO> catList() throws Exception;

	public List<EnterPatiVO> etcList() throws Exception;
	
	public List<EnterVO> wardList() throws Exception;

	public List<EnterVO> aniList(int wardNm) throws Exception;

	public EnterVO enterInfo(String stCode) throws Exception;

	public int enterRemove(String stCd) throws Exception;
	
//	public int insertRec(@Param("patId")String patId, @Param("animalCd")String animalCd) throws Exception;
	
	public int insertRec(String praCd) throws Exception;

	public List<EnterVO> enterNoteList() throws Exception;

	public List<EnterVO> aniEnterNoteList(String stCd) throws Exception;
	
	public void insertRecord(EnterVO enterVO) throws Exception;
	
	public EnterVO getRecord(int snNm) throws Exception;

	public int delRecord(int snNm) throws Exception;
	
	public int updateRecord(EnterVO enterVO) throws Exception;
	
	public List<EnterVO> readPreIn(String stCd) throws Exception;

	public List<EnterVO> readFood() throws Exception;

	public int insertFood(EnterVO enterVO) throws Exception;

	public int insertMedi(EnterVO enterVO) throws Exception;
	
	public List<EnterVO> enterFoodList(Map<String, String> dataMap) throws Exception;

	public List<EnterVO> enterMediList(Map<String, String> dataMap) throws Exception;
	
	public int updateFoodPrice(EnterVO enterVO) throws Exception;
	
	public int updateEnterDays(EnterVO enterVO) throws Exception;

	public int enterDeleteCage(int cageNm) throws Exception;

	public EnterVO readPriceEnter(String stCd) throws Exception;

	public EnterVO readPrice(String stCd) throws Exception;

	public List<EnterVO> readAllFoodList(String stCd) throws Exception;
	
	public List<EnterVO> todayFoodList(String stCd) throws Exception;
	
	public List<EnterVO> todayMediList(String stCd) throws Exception;
	
	
	

}
