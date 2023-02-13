package kr.co.alphaVet.enter.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.EnterMapper;
import kr.co.vo.EnterPatiVO;
import kr.co.vo.EnterVO;

@Service
public class EnterServiceImpl implements EnterService {

	@Inject
	private EnterMapper mapper;
	
	@Override
	public List<EnterPatiVO> dogList() throws Exception {
		return mapper.dogList();
	}

	@Override
	public List<EnterPatiVO> catList() throws Exception {
		return mapper.catList();
	}

	@Override
	public List<EnterPatiVO> etcList() throws Exception {
		return mapper.etcList();
	}
	@Override
	public EnterVO enterInfo(String stCode) throws Exception  {
		return mapper.enterInfo(stCode);
	}

	@Override
	public int enterRemove(String stCd) throws Exception {
		return mapper.enterRemove(stCd);
	}

	@Override
	public List<EnterVO> enterNoteList() throws Exception{
		return mapper.enterNoteList();
	}

	@Override
	public void insertRecord(EnterVO enterVO) throws Exception {
		mapper.insertRecord(enterVO);
	}

	@Override
	public EnterVO getRecord(int snNm) throws Exception {
		return mapper.getRecord(snNm);
	}


	@Override
	public int delRecord(int snNm) throws Exception {
		return mapper.delRecord(snNm);
	}

	@Override
	public int updateRecord(EnterVO enterVO) throws Exception {
		return mapper.updateRecord(enterVO);
	}

	@Override
	public List<EnterVO> readPreIn(String stCd) throws Exception {
		return mapper.readPreIn(stCd);
	}

	@Override
	public List<EnterVO> readFood() throws Exception {
		return mapper.readFood();
	}

	@Override
	public int insertFood(EnterVO enterVO) throws Exception {
		return mapper.insertFood(enterVO);
		
	}

	@Override
	public int insertMedi(EnterVO enterVO) throws Exception {
		return mapper.insertMedi(enterVO);
		
	}

	@Override
	public List<EnterVO> enterFoodList(Map<String, String> dataMap) throws Exception {
		return mapper.enterFoodList(dataMap);
	}

	@Override
	public List<EnterVO> enterMediList(Map<String, String> dataMap) throws Exception {
		return mapper.enterMediList(dataMap);
	}


	@Override
	public int updateFoodPrice(EnterVO enterVO) throws Exception {
		return mapper.updateFoodPrice(enterVO);
	}

	@Override
	public EnterVO readPriceEnter(String stCd)  throws Exception {
		return mapper.readPriceEnter(stCd);
	}

	@Override
	public EnterVO readPrice(String stCd) throws Exception {
		return mapper.readPrice(stCd);
	}

	@Override
	public List<EnterVO> readAllFoodList(String stCd) throws Exception {
		return mapper.readAllFoodList(stCd);
	}

	@Override
	public int updateEnterDays(EnterVO enterVO) throws Exception {
		return mapper.updateEnterDays(enterVO);
	}

	@Override
	public List<EnterVO> aniList(int wardNm) throws Exception {
		return mapper.aniList(wardNm);
	}

	@Override
	public List<EnterVO> wardList() throws Exception {
		return mapper.wardList();
	}


	@Override
	public List<EnterVO> aniEnterNoteList(String stCd) throws Exception {
		return mapper.aniEnterNoteList(stCd);
	}

	@Override
	public List<EnterVO> todayFoodList(String stCd) throws Exception {
		return mapper.todayFoodList(stCd);
	}

	@Override
	public List<EnterVO> todayMediList(String stCd) throws Exception {
		return mapper.todayMediList(stCd);
	}

	@Override
	public int enterDeleteCage(int cageNm) throws Exception {
		return mapper.enterDeleteCage(cageNm);
	}

	@Override
	public int insertRec(String praCd) throws Exception {
		return mapper.insertRec(praCd);
	}




}
