package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocDetailMapper {

	public int insertDocDetail(String praCon) throws Exception;

}
