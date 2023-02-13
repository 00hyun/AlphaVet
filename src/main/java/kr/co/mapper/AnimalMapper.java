package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.AnimalVO;

@Mapper
public interface AnimalMapper {

	public AnimalVO selectAnimal(String animalCd) throws Exception;

}
