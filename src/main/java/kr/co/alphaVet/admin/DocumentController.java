package kr.co.alphaVet.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.medic.service.MedicDocFileService;
import kr.co.vo.DocumentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@Slf4j
public class DocumentController {

	@Inject
	private DocumentService dService;

	@Inject
	private MedicDocFileService medicDocFileService;

	@GetMapping("")
	public String document(@RequestParam String path) {
		log.info("document");

		String url = "document/";
		url += path;

		System.out.println("url : " + url);
		return url;
	}

	@ResponseBody
	@PostMapping(value = "/docList")
	public List<DocumentVO> docList() {
		List<DocumentVO> documentList = new ArrayList<DocumentVO>();

		return dService.docList();
	}

	@PostMapping(value = "/diagnosisList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> medicDiagnosisList(Authentication auth)
			throws Exception {
		log.info("medicDiagnosisList");

		String empId = auth.getName();

		List<Map<String, Object>> diagnosisList = medicDocFileService
				.getDiagnosisList(empId);

		return diagnosisList;
	}

	@GetMapping("/diagnosis")
	public String medicOpenDiagnosis(@RequestParam String path,
			@RequestParam String recNm, Model model) throws Exception {
		log.info("medicOpenDiagnosis");

		String url = "document/";
		url += path;

		Map<String, Object> docFileData = medicDocFileService
				.getDocFileData(recNm);

		model.addAttribute("docFileData", docFileData);

		return url;
	}

	@PostMapping(value = "/diagnosis/save", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String medicSaveDiagnosis(@RequestBody Map<String, Object> json)
			throws Exception {
		log.info("medicSaveDiagnosis");

		String check = medicDocFileService.saveDocFile(json);

		return check;
	}
}
