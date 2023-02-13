package kr.co.alphaVet.admin.setting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.admin.employees.EmployeesService;
import kr.co.vo.AnimalVO;
import kr.co.vo.CageVO;
import kr.co.vo.EmpVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.SurRoomVO;
import kr.co.vo.WardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/setting")
public class SettingController {

	@Inject
	SettingService sService;
	@Inject
	EmployeesService eService;
	
	@ResponseBody
	@PostMapping("/list")
	public Map<String, Object> list() throws Exception{
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		List<Pra_RoomVO> praRoomList = sService.listPraRoom();
		listMap.put("praRoomList", praRoomList);

		List<SurRoomVO> surRoomList = sService.listSurRoom();
		listMap.put("surRoomList", surRoomList);
		
		List<WardVO> wardList = sService.listWard();
		listMap.put("wardList", wardList);
		
		List<CageVO> cageList = sService.listCage();
		listMap.put("cageList", cageList);
		
		List<AnimalVO> animalList = sService.listAnimal();
		listMap.put("animalList", animalList);
		
//		List<EmpVO> empList = eService.empList();
//		listMap.put("empList", empList);
		
		return listMap;
	}
	
	@ResponseBody
	@PostMapping("/empListByAnimalCd")
	public List<EmpVO> empListByAnimalCd(String animalCd){
		return eService.empListByAnimalCd(animalCd);
	}
	
	@ResponseBody
	@PostMapping(value="/updatePraRoom", produces = "application/json;charset=utf-8")
	public int updatePraRoom(@RequestBody List<Map<String, String>> mapList) throws Exception {
//		log.debug(mapList.toString());
		
		List<Pra_RoomVO> praRoomList = new ArrayList<Pra_RoomVO>();
		for(int i = 0; i < mapList.size(); i = i+3) {
			Pra_RoomVO praRoomVO = new Pra_RoomVO();
//			praRoomVO.setAnimalCd(mapList.get(i).get("animalCd"));
			praRoomVO.setEmpId(mapList.get(i+1).get("value"));
			System.out.println(mapList.get(i+1).get("value"));
			praRoomVO.setPraRoomNm(Integer.parseInt(mapList.get(i+2).get("value")));
			System.out.println(Integer.parseInt(mapList.get(i+2).get("value")));
			praRoomVO.setCliCd("h001");
			praRoomList.add(praRoomVO);
		}
		
		return sService.updatePraRoom(praRoomList);
	}

	@ResponseBody
	@PostMapping(value="/updateSurRoom", produces = "application/json;charset=utf-8")
	public int updateSurRoom(@RequestBody List<Map<String, String>> mapList) throws Exception {
//		log.debug(mapList.toString());
		
		List<SurRoomVO> surRoomList = new ArrayList<SurRoomVO>();
		for(int i = 0; i < mapList.size(); i = i+2) {
			SurRoomVO surRoomVO = new SurRoomVO();
			surRoomVO.setAnimalCd(mapList.get(i).get("value"));
			surRoomVO.setSurRoomNm(Integer.parseInt(mapList.get(i+1).get("value")));
			surRoomVO.setCliCd("h001");
			surRoomList.add(surRoomVO);
		}
		
		return sService.updateSurRoom(surRoomList);
	}
	
	@ResponseBody
	@PostMapping(value="/updateCage", produces = "application/json;charset=utf-8")
	public int updateCage(@RequestBody List<Map<String, String>> mapList) throws Exception {
//		log.debug(mapList.toString());
		
		List<CageVO> cageList = new ArrayList<CageVO>();
		for(int i = 1; i < mapList.size(); i = i+3) {
			CageVO cageVO = new CageVO();
			cageVO.setWardNm(Integer.parseInt(mapList.get(0).get("value")));
			cageVO.setCageSize(mapList.get(i).get("value"));
			cageVO.setCageCon(mapList.get(i+1).get("value"));
			cageVO.setCageNm(Integer.parseInt(mapList.get(i+2).get("value")));
			cageList.add(cageVO);
		}
		
		return sService.updateCage(cageList);
	}
	
	@ResponseBody
	@PostMapping(value="/updateWard", produces = "application/json;charset=utf-8")
	public int updateWard(@RequestBody List<Map<String, String>> mapList) throws Exception {
		log.debug(mapList.toString());
		
		List<WardVO> wardList = new ArrayList<WardVO>();
		for(int i = 0; i < mapList.size(); i = i+3) {
			WardVO wardVO = new WardVO();
			wardVO.setAnimalCd(mapList.get(i).get("value"));
			wardVO.setWardName(mapList.get(i+1).get("value"));
			wardVO.setWardNm(Integer.parseInt(mapList.get(i+2).get("value")));
			wardVO.setCliCd("h001");
			wardList.add(wardVO);
		}
		
		return sService.updateWard(wardList);
	}
}
