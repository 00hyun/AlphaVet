package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.Pra_RoomVO;

@Mapper
public interface SettingMapper {
	public int updatePraRoom(Pra_RoomVO praRoomVO);
}
