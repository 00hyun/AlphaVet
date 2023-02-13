package kr.co.alphaVet.admin;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.alphaVet.admin.chart.ChartService;

@Controller
public class AdminController {

	@Inject
	private ChartService cService; 
	
	@GetMapping("/admin")
	public String admin(Model model, Principal principal) throws Exception {

//		List<Map<String, Object>> daysPaymentList = cService.daysPayment();
//		model.addAttribute("daysPaymentList", daysPaymentList);
//		
//		List<Map<String, Object>> daysPraList = cService.daysPra();
//		model.addAttribute("daysPraList", daysPraList);
//		
//		List<Map<String, Object>> drugCntList = cService.drugCnt();
//		model.addAttribute("drugCntList", drugCntList);
//		
//		List<Map<String, Object>> praCntByEmpList = cService.praCntByEmp();
//		model.addAttribute("praCntByEmpList", praCntByEmpList);
		
		return "alphaVet/admin/admin";
	}
}
