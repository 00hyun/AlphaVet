package kr.co.alphaVet.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp,
			Authentication auth) throws ServletException, IOException {
		User customUser = (User)auth.getPrincipal();

//		log.debug("로그인 핸들러!");
		log.debug("username : " + customUser.getUsername());
//		System.out.println("로그인 정보 : " + customUser.toString());
		
		super.onAuthenticationSuccess(req, resp, auth);
	}
	
}
