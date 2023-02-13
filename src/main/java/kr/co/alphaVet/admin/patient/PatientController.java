package kr.co.alphaVet.admin.patient;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.wonmu.service.WonmuService;
import kr.co.vo.EmpAuthVO;
import kr.co.vo.EmpVO;
import kr.co.vo.MemPatiVO;

@Controller
@RequestMapping("/pat")
public class PatientController {
	
	@Inject
	PatientService pService;
	
	@Inject
	WonmuService wService;
	
	@PostMapping("/list")
	@ResponseBody
	public List<MemPatiVO> patientList() throws Exception{
		return pService.patientList();
	}
	
	@ResponseBody
	@PostMapping(value="/detail")
	public MemPatiVO selectEmployees(String patId)  throws Exception {
		return pService.selectpat(patId);
	}
	
	@ResponseBody
	@PostMapping(value="/update")
	public int updateEmployees(MemPatiVO memPatiVO) throws Exception {
		System.out.println(memPatiVO.toString());
		int cnt = pService.updatepat(memPatiVO);
		
		return cnt;
	}
	
//	 신규환자 등록
	@ResponseBody
	@PostMapping("/insert")
	public void insertPat(MemPatiVO memPatiVO) {
		wService.addPet(memPatiVO);
	}
}
