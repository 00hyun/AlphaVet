package kr.co.alphaVet.admin.employees;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.EmpAuthVO;
import kr.co.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/emp")
public class EmployeesController {

	@Inject
	EmployeesService eService;
	
	@Inject
	EmpAuthService eaService;
	
	@PostMapping("/allList")
	@ResponseBody
	public List<EmpVO> empAllList() throws Exception{
		return eService.empAllList();
	}

	@PostMapping("/list")
	@ResponseBody
	public List<EmpVO> empList() throws Exception{
		return eService.empList();
	}
	
	
	@ResponseBody
	@PostMapping(value="/insert")
	public int insertEmployees(EmpVO empVO, HttpServletRequest req) throws Exception {
		
		log.debug(empVO.getEmpBirth());
		
		ServletContext  sc = req.getSession().getServletContext();  // ContextPath
		String realPath = sc.getRealPath("/resources/images/empProfile");
		empVO.getProfileFile().transferTo(new File(realPath + "/" + empVO.getProfileFile().getOriginalFilename()));
		empVO.setEmpProfile("/resources/images/empProfile/" + empVO.getProfileFile().getOriginalFilename());

		int cnt = eService.insertEmp(empVO);
		
		if(cnt > 0) {
			EmpAuthVO empAuthVO = new EmpAuthVO();
			String[] authArray = Arrays.copyOf(empVO.getEmpAuth(), empVO.getEmpAuth().length+1);
			authArray[authArray.length-1] = "ROLE_EMP";	// 직원 기본 권한 추가
			
			empAuthVO.setEmpAuthNameArray(authArray);
			empAuthVO.setEmpId(empVO.getCliCd()+"-e00"+empVO.getEmpId());
			eaService.insertEmpAuth(empAuthVO);
		}
		
		return cnt;
	}

	@ResponseBody
	@PostMapping(value="/detail")
	public EmpVO selectEmployees(String empId) {
		return eService.selectEmp(empId);
	}
	
	@ResponseBody
	@PostMapping(value="/update")
	public int updateEmployees(EmpVO empVO, HttpServletRequest req) throws IllegalStateException, IOException {
		ServletContext  sc = req.getSession().getServletContext();  // ContextPath
		String realPath = sc.getRealPath("/resources/images/empProfile");
		empVO.getProfileFile().transferTo(new File(realPath + "/" + empVO.getProfileFile().getOriginalFilename()));
		
		empVO.setEmpProfile("/resources/images/empProfile/" + empVO.getProfileFile().getOriginalFilename());
		
		int cnt = eService.updateEmp(empVO);
		
		if(cnt > 0) {
			EmpAuthVO empAuthVO = new EmpAuthVO();
			String[] authArray = Arrays.copyOf(empVO.getEmpAuth(), empVO.getEmpAuth().length+1);
			authArray[authArray.length-1] = "ROLE_EMP";	// 직원 기본 권한 추가
			
			empAuthVO.setEmpAuthNameArray(authArray);
			empAuthVO.setEmpId(empVO.getEmpId());
			eaService.updateEmpAuth(empAuthVO);
		}
		
		return cnt;
	}

	@ResponseBody
	@PostMapping(value="/delete")
	public int deleteEmployees(String empId) {
		return eService.deleteEmp(empId);
	}
	
	@ResponseBody
	@PostMapping("/searchEmpName")
	public List<Map<String, String>> searchEmpName(String empName) throws Exception{
		System.out.println(empName);
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		
		return eService.searchEmpName(empName);
	}
	
	@ResponseBody
	@PostMapping("/updateEmpState")
	public int updateEmpState(@RequestBody Map<String, String> dataMap) throws Exception {
		System.out.println(dataMap.toString());
		
		int cnt = eService.updateEmpState(dataMap);
		
		return 1;
	}
}

