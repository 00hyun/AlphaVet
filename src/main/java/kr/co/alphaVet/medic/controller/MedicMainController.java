package kr.co.alphaVet.medic.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.alphaVet.medic.service.MedicSelectService;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/medic")
@Slf4j
public class MedicMainController {

	@Inject
	private MedicSelectService medicSelectService;

	@GetMapping("")
	public String medicMain(Authentication auth, Model model) throws Exception {
		log.info("medicMain");

		String empId = auth.getName();

		List<Pra_RoomVO> praList = medicSelectService.PraRoomList();
		List<ReservationVO> reservationList = medicSelectService
				.reservationListByEmpId(empId);

		model.addAttribute("praList", praList);
		model.addAttribute("reservationList", reservationList);

		return "alphaVet/medic/medicMain";
	}

}
