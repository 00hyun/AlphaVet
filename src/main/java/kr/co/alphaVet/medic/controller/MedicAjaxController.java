package kr.co.alphaVet.medic.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.medic.service.MedicInsertService;
import kr.co.alphaVet.medic.service.MedicSelectService;
import kr.co.alphaVet.medic.service.MedicUpdateService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/medic")
@Slf4j
public class MedicAjaxController {

	@Inject
	private MedicSelectService medicSelectService;

	@Inject
	private MedicInsertService medicInsertService;

	@Inject
	private MedicUpdateService medicUpdateService;

	@PostMapping(value = "/roomNm", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkRoomNm(Authentication auth) throws Exception {
		log.info("checkRoomNm");

		String empId = auth.getName();

		String roomNm = medicSelectService.checkRoomNm(empId);

		return roomNm;
	}

	@PostMapping(value = "/doctor", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> doctorInfo(Authentication auth)
			throws Exception {
		log.info("doctorInfo");

		String empId = auth.getName();

		Map<String, Object> info = medicSelectService.doctorInfo(empId);

		return info;
	}

	@PostMapping(value = "/patient", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> patientInfo(
			@RequestBody Map<String, Object> json) throws Exception {
		log.info("patientInfo");

		String recNm = (String) json.get("recNm");
		String patId = (String) json.get("patId");

		Map<String, Object> info = medicSelectService.patientInfo(recNm, patId);

		return info;
	}

	@PostMapping(value = "/pra/create", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String createPra(@RequestBody Map<String, Object> json)
			throws Exception {
		log.info("createPra");

		String check = medicInsertService.createPra(json);

		return check;
	}

	@PostMapping(value = "/receipt/conduct", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String conductReceiptStatus(@RequestBody Map<String, Object> json)
			throws Exception {
		log.info("conductReceiptStatus");

		String recNm = (String) json.get("recNm");
		String patId = (String) json.get("patId");

		String check = medicUpdateService.conductReceiptStatus(recNm, patId);

		return check;
	}

	@PostMapping(value = "/receipt/check", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> showPatientInMedic(Authentication auth)
			throws Exception {
		log.info("showPatientInMedic");

		String empId = auth.getName();

		Map<String, Object> info = medicSelectService.showPatientInMedic(empId);

		return info;
	}

	@PostMapping(value = "/patient/search", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> searchPatient(
			@RequestBody String searchValue) throws Exception {
		log.info("searchPatient");

		List<Map<String, Object>> info = medicSelectService
				.searchPatient(searchValue);

		return info;
	}

	@PostMapping(value = "/out", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String medicOut(@RequestBody Map<String, Object> json,
			Authentication auth) throws Exception {
		log.info("medicOut");

		String empId = auth.getName();

		String check = medicUpdateService.medicOut(json, empId);

		return check;
	}

}
