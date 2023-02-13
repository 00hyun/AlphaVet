package kr.co.alphaVet.admin.database;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.ClinicVO;
import kr.co.vo.DrugVO;
import kr.co.vo.PetBoardVO;

@Controller
public class DatabaseController {

	@Inject
	DatabaseService dService;
	
	@GetMapping("/medi")
	public String mediHome() {
		return "alphaVet/admin/medicine";
	}

	@ResponseBody
	@PostMapping(value = "/insertMedi", produces = "application/json;charset=utf-8")
	public void insertMedi(@RequestBody List<Map<String, String>> cVO) {
		System.out.println("dd" + cVO.toString());
		List<DrugVO> drugList = new ArrayList<DrugVO>();
		for(Map<String, String> map : cVO) {
			DrugVO drugVo = new DrugVO();
			drugVo.setChangeDate(map.get("CHANGE_DATE"));
			drugVo.setChart(map.get("CHART"));
			drugVo.setClassName(map.get("CLASS_NAME"));
			drugVo.setClassNo(map.get("CLASS_NO"));
//			drugVo.setDrugAmount(Integer.parseInt(map.get("DRUG_AMOUNT")));
//			drugVo.setDrugIo(map.get("DRUG_IO"));
//			drugVo.setDrugNm(Integer.parseInt(map.get("DRUG_NM")));
//			drugVo.setDrugPrice(Integer.parseInt(map.get("DRUG_PRICE")));
			drugVo.setDrugShape(map.get("DRUG_SHAPE"));
//			drugVo.setDrugStockDate(map.get("DRUG_STOCK_DATE"));
			drugVo.setEntpName(map.get("ENTP_NAME"));
			drugVo.setEtcOtcName(map.get("ETC_OTC_NAME"));
			drugVo.setFromCodeName(map.get("FROM_CODE_NAME"));
			drugVo.setImgRegistTs(map.get("IMG_REGIST_TS"));
			drugVo.setItemEngName(map.get("ITEM_ENG_NAME"));
			drugVo.setItemImage(map.get("ITEM_IMAGE"));
			drugVo.setItemName(map.get("ITEM_NAME"));
			drugVo.setItemPermitDate(map.get("ITEM_PERMIT_DATE"));
			drugVo.setItemSeq(map.get("ITEM_SEQ"));
			drugVo.setLengShort(map.get("LENG_SHORT"));
			drugVo.setLengLong(map.get("LENG_LONG"));
			drugVo.setMarkCodeBack(map.get("MARK_CODE_BACK"));
			drugVo.setMarkCodeBackAnal(map.get("MARK_CODE_BACK_ANAL"));
			drugVo.setMarkCodeFront(map.get("MARK_CODE_FRONT"));
			drugVo.setMarkCodeFrontAnal(map.get("MARK_CODE_FRONT_ANAL"));
			drugVo.setPrintBack(map.get("PRINT_BACK"));
			drugVo.setPrintFront(map.get("PRINT_FRONT"));
			drugVo.setThick(map.get("THICK"));
			drugList.add(drugVo);
		}
		System.out.println(drugList.toString());
		
		dService.insertMedi(drugList);
	}

	@ResponseBody
	@PostMapping(value = "/insertClinic", produces = "application/json;charset=utf-8")
	public void insertClinic(@RequestBody List<Map<String, String>> cVO) {
		System.out.println("dd" + cVO.toString());
		List<ClinicVO> clinicList = new ArrayList<ClinicVO>();
		for(Map<String, String> map : cVO) {
			ClinicVO clinicVO = new ClinicVO();
			
			clinicVO.setCliAddr1(map.get("jiadr"));
			clinicVO.setCliAddr2(map.get("rdnmadr"));
//			clinicVO.setCliCd(map.get("jiadr"));	// h + 000
			clinicVO.setCliName(map.get("bplc_nm"));
			clinicVO.setCliStartDate(map.get("cnfm_date"));
//			clinicVO.setCliState(map.get(""));		// Y
//			clinicVO.setCliTel();
			
			clinicList.add(clinicVO);
		}
		System.out.println(clinicList.toString());
		
		dService.insertClinic(clinicList);
	}
	
	@PostMapping(value="/insertAppContent")
	public String insertAppContent(PetBoardVO petBoardVO) throws Exception {
		
//		ServletContext  sc = req.getSession().getServletContext();
//		String realPath = sc.getRealPath("/resources/images/app");
//		petBoardVO.getAbImgFile().transferTo(new File(realPath + "/" + petBoardVO.getAbImgFile().getOriginalFilename()));
//		petBoardVO.setAbImg("/resources/images/app"+petBoardVO.getAbImgFile().getOriginalFilename());
		
		int cnt = dService.insertAppContent(petBoardVO);
		
		return "alphaVet/admin/admin";
	}
}
