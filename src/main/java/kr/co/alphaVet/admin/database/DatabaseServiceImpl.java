package kr.co.alphaVet.admin.database;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.DatabaseMapper;
import kr.co.vo.ClinicVO;
import kr.co.vo.DrugVO;
import kr.co.vo.PetBoardVO;

@Service
public class DatabaseServiceImpl implements DatabaseService {

	@Inject
	DatabaseMapper dMapper;
	
	@Override
	public void insertMedi(List<DrugVO> drugList) {
		for(DrugVO drugVo : drugList) {
			dMapper.insertMedi(drugVo);
		}
	}

	@Override
	public void insertClinic(List<ClinicVO> clinicList) {
		for(ClinicVO clinicVO : clinicList) {
			dMapper.insertClinic(clinicVO);
		}
	}

	@Override
	public int insertAppContent(PetBoardVO petBoardVO) {
		return dMapper.insertAppContent(petBoardVO);
	}

}
