package kr.co.alphaVet.admin.setting;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.SettingMapper;
import kr.co.vo.AnimalVO;
import kr.co.vo.CageVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.SurRoomVO;
import kr.co.vo.WardVO;
import kr.common.CommonDao;

@Service
public class SettingServiceImpl implements SettingService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Inject
	private SettingMapper sMapper;
	
	String cliCd = "h001";

	@Override
	public List<Pra_RoomVO> listPraRoom() {
		return commonDao.selectList("SettingMapper_listPraRoom", cliCd);
	}

	@Override
	public List<SurRoomVO> listSurRoom() {
		return commonDao.selectList("SettingMapper_listSurRoom", cliCd);
	}

	@Override
	public List<WardVO> listWard() {
		return commonDao.selectList("SettingMapper_listWard", cliCd);
	}

	@Override
	public List<CageVO> listCage() {
		return commonDao.selectList("SettingMapper_listCage", cliCd);
	}

	@Override
	public List<AnimalVO> listAnimal() {
		return commonDao.selectList("SettingMapper_listAnimal", cliCd);
	}

	@Override
	public int updatePraRoom(List<Pra_RoomVO> praRoomList) {
		int cnt = 0;
		for(Pra_RoomVO praRoomVO : praRoomList) {
			cnt += commonDao.update("SettingMapper_updatePraRoom", praRoomVO);
		}
		return cnt;
	}

	@Override
	public int updateSurRoom(List<SurRoomVO> surRoomList) {
		int cnt = 0;
		for(SurRoomVO surRoomVO : surRoomList) {
			cnt += commonDao.update("SettingMapper_updateSurRoom", surRoomVO);
		}
		return cnt;
	}

	@Override
	public int updateCage(List<CageVO> cageList) {
		int cnt = 0;
		for(CageVO cageVO : cageList) {
			cnt += commonDao.update("SettingMapper_updateCage", cageVO);
		}
		
		if(cnt == cageList.size()) {
			WardVO wardVO = new WardVO();
			wardVO.setWardNm(cageList.get(0).getWardNm());
			wardVO.setWardAmount(cageList.size());
			cnt = commonDao.update("SettingMapper_updateWardAmount", wardVO);
		}
		return cnt;
	}

	@Override
	public int updateWard(List<WardVO> wardList) {
		int cnt = 0;
		System.out.println(wardList.toString());
		System.out.println(wardList.size());
		for(WardVO wardVO : wardList) {
			System.out.println(wardVO.toString());
			cnt += commonDao.update("SettingMapper_updateWard", wardVO);
		}
		return cnt;
	}

}
