package kr.co.alphaVet.admin.drug;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.DaDetailVO;
import kr.co.vo.DrugApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/da")
public class DrugApplyController {

	@Inject
	DrugApplyService dService;
	
	@ResponseBody
	@PostMapping(value="/list")
	public List<DrugApplyVO> daList(@RequestBody Map<String, Object> dataMap){
//		System.out.println("날짜 : " + dataMap.toString());
		return dService.daList(dataMap);
	}

	@ResponseBody
	@PostMapping(value="/detail")
	public List<DaDetailVO> daDetail(int daNm) throws Exception {
		return dService.daDetail(daNm);
	}
	
	@ResponseBody
	@PostMapping(value="/insert", produces = "application/json;charset=utf-8")
	public int insertDa(@RequestBody List<Map<String, String>> data) throws Exception {
		List<DaDetailVO> daDetailList = new ArrayList<DaDetailVO>();
		for(int i = 0; i<data.size(); i=i+4) {
			DaDetailVO daDetailVO = new DaDetailVO();
			daDetailVO.setDaDtAmount(Integer.parseInt(data.get(i).get("value")));
			daDetailVO.setDrugNm(Integer.parseInt(data.get(i+1).get("value")));
			daDetailVO.setDrugCostPrice(Integer.parseInt(data.get(i+3).get("value")));
			daDetailVO.setBuyerName(data.get(i+2).get("value"));
			daDetailList.add(daDetailVO);
		}
		
		int cnt = dService.insertDa(daDetailList);
		
		return cnt;
	}

	@ResponseBody
	@PostMapping(value="/update", produces = "application/json;charset=utf-8")
	public int updateDaDt(@RequestBody List<Map<String, String>> data) throws Exception{
		System.out.println(data.toString());
		
		List<DaDetailVO> daDetailList = new ArrayList<DaDetailVO>();
		
		for(int i = 1; i < data.size(); i=i+4) {
			DaDetailVO daDetailVO = new DaDetailVO();
			daDetailVO.setDaNm(Integer.parseInt(data.get(0).get("value")));
			daDetailVO.setDaDtNm(Integer.parseInt(data.get(i).get("value")));
			daDetailVO.setDrugNm(Integer.parseInt(data.get(i+1).get("value")));
			daDetailVO.setDaDtAmount(Integer.parseInt(data.get(i+2).get("value")));
			daDetailVO.setDaDtCheck(data.get(i+3).get("value"));
			daDetailList.add(daDetailVO);
		}
		
		int cnt = dService.updateDaDtCheck(daDetailList);
			
		return 1;
	}



}
