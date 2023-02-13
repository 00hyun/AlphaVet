package kr.co.alphaVet.medic.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.medic.service.MedicSelectService;
import kr.co.vo.DiseaseVO;
import kr.co.vo.DrugVO;
import kr.co.vo.TestVO;
import kr.co.vo.VaccineDetailVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/medic")
@Slf4j
public class MedicSearchController {

	@Inject
	private MedicSelectService medicSelectService;

	@PostMapping(value = "/disease/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<DiseaseVO> searchDiseaseList() throws Exception {
		log.info("searchDiseaseList");

		List<DiseaseVO> list = medicSelectService.searchDiseaseList();

		return list;
	}

	@PostMapping(value = "/test/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<TestVO> searchTestList() throws Exception {
		log.info("searchTestList");

		List<TestVO> list = medicSelectService.searchTestList();

		return list;
	}

	@PostMapping(value = "/drug/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<DrugVO> searchDrugList() throws Exception {
		log.info("searchDrugList");

		List<DrugVO> list = medicSelectService.searchDrugList();

		return list;
	}

	@PostMapping(value = "/preOutDrug/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<DrugVO> searchPreOutList() throws Exception {
		log.info("searchPreOutList");

		List<DrugVO> list = medicSelectService.searchPreOutList();

		return list;
	}

	@PostMapping(value = "/preInDrug/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<DrugVO> searchPreInList() throws Exception {
		log.info("searchPreInList");

		List<DrugVO> list = medicSelectService.searchPreInList();

		return list;
	}

	@PostMapping(value = "/vaccine/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<VaccineDetailVO> searchVaccineList() throws Exception {
		log.info("searchVaccineList");

		List<VaccineDetailVO> list = medicSelectService.searchVaccineList();

		return list;
	}

}
