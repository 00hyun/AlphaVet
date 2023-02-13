package kr.co.alphaPet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.ClinicMapper;
import kr.co.vo.ClinicVO;
import kr.co.vo.HospitalVO;
import kr.co.vo.PetIsMemberVO;

@Service
public class ClinicServiceImpl implements IClinicService{

	@Inject
	private ClinicMapper clinicMapper;
	
	public List<ClinicVO> selectClinicList(){
		return clinicMapper.selectClinicList();
	}

	@Override
	public ClinicVO selectClinic(String cliCd) {
		return clinicMapper.selectClinic(cliCd);
	}

	@Override
	public List<PetIsMemberVO> isMember(PetIsMemberVO vo) throws Exception{
		return clinicMapper.isMember(vo);
	}

	@Override
	public List<HospitalVO> hospitalSelect(String patId) {
		return clinicMapper.hospitalSelect(patId);
	}
}
