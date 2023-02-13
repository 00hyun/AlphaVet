package kr.co.alphaVet.admin.setting;

import java.util.List;

import kr.co.vo.AnimalVO;
import kr.co.vo.CageVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.SurRoomVO;
import kr.co.vo.WardVO;

public interface SettingService {
	public List<Pra_RoomVO> listPraRoom();
	public List<SurRoomVO> listSurRoom();
	public List<WardVO> listWard();
	public List<CageVO> listCage();
	public List<AnimalVO> listAnimal();
	
	public int updatePraRoom(List<Pra_RoomVO> praRoomList);
	public int updateSurRoom(List<SurRoomVO> surRoomList);
	public int updateCage(List<CageVO> cageList);
	public int updateWard(List<WardVO> wardList);
}
