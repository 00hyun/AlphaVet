package kr.co.alphaVet.login.controller;

import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.admin.employees.EmployeesService;

@Controller
public class LoginController {

	@Inject
	EmployeesService eService;
	
	@Inject
	private JavaMailSenderImpl mailSender;
	
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "Login Error");
			
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		return "login/loginForm";
	}
	
	@GetMapping("/recoverPassword")
	public String recoverPassword() {
		return "login/recoverPassword";
	}
	
	@GetMapping("/recoverId")
	public String recoverIdGet() {
		return "login/recoverId";
	}
	
	@ResponseBody
	@PostMapping(value = "/recoverId")
	public String recoverIdPost(@RequestBody Map<String, Object> dataMap) throws Exception {
		
		System.out.println(dataMap.toString());
		
		String empId = eService.selectEmpId(dataMap);
		
		return empId;
	}
	
	@ResponseBody
	@PostMapping(value = "/recoverPassword")
	public String recoverPassword(@RequestBody Map<String, Object> dataMap) throws Exception {
		
		System.out.println(dataMap.toString());
		
		String password = eService.selectEmpPassword(dataMap);
		String confirmCode = "";
		
		if(password != null) {
			confirmCode = "" + UUID.randomUUID();
			password = confirmCode;
		}
		
		return password;
	}
	
	@ResponseBody
	@PostMapping(value="/sendConfirmCode")
	public void sendConfirmCode(@RequestBody Map<String, Object> dataMap) throws Exception{
		System.out.println(dataMap.toString());
		
		String confirmCode = "" + dataMap.get("confirmCode");
		String empMail = "" + dataMap.get("empMail");
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper message = new MimeMessageHelper(msg, true, "UTF-8");
		message.setFrom("AlphaVet");
		message.setTo(empMail);
		message.setSubject("[AlphaVet] 인증번호를 발송해드립니다.");
		message.setText(confirmCode);
		
		mailSender.send(msg);
	}

	@ResponseBody
	@PostMapping(value = "/updateEmpPw")
	public void updateEmpPw(@RequestBody Map<String, Object> dataMap) throws Exception{		
		System.out.println(dataMap.toString());
		
		eService.updateEmpPw(dataMap);
		
	}
}
