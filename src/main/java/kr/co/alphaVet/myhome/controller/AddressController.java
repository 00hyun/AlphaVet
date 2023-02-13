package kr.co.alphaVet.myhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.myhome.service.AddressService;
import kr.co.vo.AddressVO;
import kr.co.vo.EmpVO;

@Controller
public class AddressController {
	
	@Inject
	private AddressService addService;
	
	@PostMapping("/myInfo")
	@ResponseBody
	public EmpVO myInfo(EmpVO empVO) {
		String empId = empVO.getEmpId();
		
		empVO = addService.selectEmp(empId);
		
		return empVO;
	}
	
	@PostMapping("/myInfo/current")
	@ResponseBody
	public void empCurrent(EmpVO empVO, String current) {
		String empId = empVO.getEmpId();
		
		addService.updateCurrent(empId, current);
	}
	
	
	@PostMapping("/addressList")
	@ResponseBody
	public List<EmpVO> addressList() {
		List<EmpVO> empList = addService.selectAdd();
		
		return empList;
	}
	
	@PostMapping("/privateAddressList")
	@ResponseBody
	public List<AddressVO> privateAddressList(String empId) {
		List<AddressVO> privateAddressList = addService.privateAddressList(empId);
		
		return privateAddressList;
	}
	
	@PostMapping("/addrUpdate")
	@ResponseBody
	public void addrUpdate(AddressVO addressVO) {
		addService.addrUpdate(addressVO);
	}
	
	@PostMapping("/addrDelete")
	@ResponseBody
	public void addrDelete(int addrNm) {
		addService.addrDelete(addrNm);
	}
	
	@PostMapping("/addrInsert")
	@ResponseBody
	public void addrInsert(AddressVO addressVO) {
		addService.addrInsert(addressVO);
	}
}
