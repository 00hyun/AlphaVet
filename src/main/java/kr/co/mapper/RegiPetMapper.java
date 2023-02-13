package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.PetVO;

@Mapper
public interface RegiPetMapper {

	public void regiPet(PetVO petVO) throws Exception;

}
