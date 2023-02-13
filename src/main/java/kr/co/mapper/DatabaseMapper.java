package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.ClinicVO;
import kr.co.vo.DrugVO;
import kr.co.vo.PetBoardVO;

@Mapper
public interface DatabaseMapper {

	public void insertMedi(DrugVO drugList);
	public void insertClinic(ClinicVO clinicVO);
	public int insertAppContent(PetBoardVO petBoardVO);
}
