package kr.co.alphaVet.admin.database;

import java.util.List;

import kr.co.vo.ClinicVO;
import kr.co.vo.DrugVO;
import kr.co.vo.PetBoardVO;

public interface DatabaseService {
	public void insertMedi(List<DrugVO> drugList);
	public void insertClinic(List<ClinicVO> clinicList);
	public int insertAppContent(PetBoardVO petBoardVO);
}
