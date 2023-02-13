package kr.co.alphaPet.service;

import java.util.List;

import kr.co.vo.ClinicVO;
import kr.co.vo.HospitalVO;
import kr.co.vo.PetIsMemberVO;

public interface IClinicService {

	public List<ClinicVO> selectClinicList();

	public ClinicVO selectClinic(String cliCd);

	public List<PetIsMemberVO> isMember(PetIsMemberVO vo) throws Exception;

	public List<HospitalVO> hospitalSelect(String petId);
}
