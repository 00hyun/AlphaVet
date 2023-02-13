package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AppLoginMapper {
	
	public String userCheck(String userId);
}
