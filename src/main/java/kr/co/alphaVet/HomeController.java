package kr.co.alphaVet;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.alphaVet.Home.service.HomeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Inject
	private HomeService service;
	
	@GetMapping("/")
	public String home(Model model, Principal principal) throws Exception {
		log.debug("home");
		
		return "alphaVet/main";
	}

	

	
	
}