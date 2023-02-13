package kr.co.alphaPet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaPet.service.IAppUserService;
import kr.co.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PetLoginController {

	@Inject
	IAppUserService appUserService;

	@RequestMapping(value="/appLogin", method=RequestMethod.GET)
	public String appLoginForm() {
		log.info("appLogin");
		return "alphaPet/appLogin";
	}
	
	@RequestMapping(value="/appLogin", method = RequestMethod.POST)
	public String appLogin(String userId, String userPw, Model model, HttpSession session) {
		log.info("login");
		log.info("login usdrId : " + userId);
		log.info("login userPw : " + userPw);
		String password = appUserService.userCheck(userId);
		if(password == null) {
			model.addAttribute("msg","아이디가 없습니다.");
			return "alphaPet/appLogin";
		}else if(password.equals(userPw)){
			session.setAttribute("userId", userId);
			return "redirect:/appHome";			
		}else {
			model.addAttribute("msg","패스워드가 틀렸습니다.");
			return "alphaPet/appLogin";
		}
	}
	
	//회원가입
	@RequestMapping(value="/appJoin", method=RequestMethod.POST)
	@ResponseBody
	public void joinPOST(UserVO userVO) throws Exception{
		appUserService.appJoin(userVO);
    }
}
