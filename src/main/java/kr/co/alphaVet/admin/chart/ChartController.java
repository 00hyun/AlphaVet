package kr.co.alphaVet.admin.chart;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Inject
	private ChartService cService; 
	
	@ResponseBody
	@PostMapping("/animalTypeList")
	public List<Map<String, Object>> animalTypeList(@RequestBody Map<String, Object> dataMap) throws Exception{
		System.out.println("날짜 : " + dataMap.toString());
		return cService.animalTypeCnt(dataMap);
	}
	
	@ResponseBody
	@PostMapping("/daysPaymentList")
	public List<Map<String, Object>> daysPaymentList(@RequestBody Map<String, Object> dataMap) throws Exception{
		return cService.daysPayment(dataMap);
	}
	
	@ResponseBody
	@PostMapping("/daysPraList")
	public List<Map<String, Object>> daysPraList(@RequestBody Map<String, Object> dataMap) throws Exception{
		return cService.daysPra(dataMap);
	}
	
	@ResponseBody
	@PostMapping("/drugCntList")
	public List<Map<String, Object>> drugCntList(@RequestBody Map<String, Object> dataMap) throws Exception{
		return cService.drugCnt(dataMap);
	}
	
	@ResponseBody
	@PostMapping("/praCntByEmpList")
	public List<Map<String, Object>> praCntByEmpList(@RequestBody Map<String, Object> dataMap) throws Exception{
		return cService.praCntByEmp(dataMap);
	}
}
