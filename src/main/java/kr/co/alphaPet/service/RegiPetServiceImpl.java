package kr.co.alphaPet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.RegiPetMapper;
import kr.co.vo.PetVO;

@Service
public class RegiPetServiceImpl implements IRegiPetService {

	@Autowired
	private RegiPetMapper regipetMapper;
	
	@Override
	public void regiPet(PetVO petVO) throws Exception {
		regipetMapper.regiPet(petVO);
	}

}
