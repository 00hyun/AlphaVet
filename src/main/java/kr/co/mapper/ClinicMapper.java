package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.ClinicVO;
import kr.co.vo.HospitalVO;
import kr.co.vo.PetIsMemberVO;

@Mapper
public interface ClinicMapper {

	public List<ClinicVO> selectClinicList();

	public ClinicVO selectClinic(String cliCd);

	public List<PetIsMemberVO> isMember(PetIsMemberVO vo) throws Exception;

	public List<HospitalVO> hospitalSelect(String patId);
}
