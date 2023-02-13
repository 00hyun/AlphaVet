package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.UserVO;

@Mapper
public interface AppJoinMapper {

	public void appJoin(UserVO userVO) throws Exception;	
		
	}