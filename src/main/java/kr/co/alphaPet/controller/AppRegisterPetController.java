package kr.co.alphaPet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.alphaPet.service.IRegiPetService;
import kr.co.vo.PetVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/appRegi")
public class AppRegisterPetController {

	@Autowired
	private IRegiPetService regiPetService;
	
	@GetMapping(value="/regiPet")
	public String regiPetGET() {
		log.info("동물 등록 페이지 진입");
		return "alphaPet/appRegiPet";
	}
	
	@PostMapping(value="/appRegiPet")
	public String regitPetPost(PetVO petVO, RedirectAttributes redirect) throws Exception{
		regiPetService.regiPet(petVO);
		redirect.addAttribute("userId", "asdf");
		return "redirect:/appHome";
	}
}
