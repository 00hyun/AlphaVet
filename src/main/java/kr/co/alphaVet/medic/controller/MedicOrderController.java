package kr.co.alphaVet.medic.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.medic.service.MedicOrderService;
import kr.co.vo.OrderDetailVO;
import kr.co.vo.OrdersetVO;

@Controller
@RequestMapping("/medic")
public class MedicOrderController {

	@Inject
	private MedicOrderService mService;
	
	@ResponseBody
	@PostMapping(value="/insertOrderSet", produces = "application/json;charset=utf-8")
	public int insertOrderSet(@RequestBody List<Map<String, String>> orderDtMapList, Principal principal) throws Exception {
		
		OrdersetVO ordersetVO = new OrdersetVO();
		List<OrderDetailVO> orderDetailList = new ArrayList<OrderDetailVO>();
		
		for(int i = 0; i<orderDtMapList.size()-2; i=i+3) {
			OrderDetailVO orderDetailVO = new OrderDetailVO();
			
			orderDetailVO.setOrderCd(orderDtMapList.get(i).get("value"));
			orderDetailVO.setOrderDtType(orderDtMapList.get(i+1).get("value"));
			orderDetailVO.setOrderDtName(orderDtMapList.get(i+2).get("value"));
			
			orderDetailList.add(orderDetailVO);
		}
		
		ordersetVO.setEmpId(principal.getName());
		ordersetVO.setOrderCon(orderDtMapList.get(orderDtMapList.size()-1).get("value"));
		ordersetVO.setOrderName(orderDtMapList.get(orderDtMapList.size()-2).get("value"));
		
		int cnt = mService.insertOrderset(ordersetVO, orderDetailList);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value="/selectOrderSetList", produces = "application/json;charset=utf-8")
	public List<OrdersetVO> selectOrderSetList(Principal principal) throws Exception{
		List<OrdersetVO> ordersetList = new ArrayList<OrdersetVO>();
		
		ordersetList = mService.selectOrderSetList(principal.getName());
		
		System.out.println("오더세트!" + ordersetList.toString());
		
		return ordersetList;
	}
}
