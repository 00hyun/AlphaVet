package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.Pra_RoomVO;

@Mapper
public interface PraRoomMapper {

	String selectPraRoomNm(String empId) throws Exception;

	Pra_RoomVO selectPraRoom(String empId) throws Exception;

}
