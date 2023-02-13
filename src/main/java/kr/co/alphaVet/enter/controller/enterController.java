package kr.co.alphaVet.enter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.enter.service.EnterService;
import kr.co.vo.DrugVO;
import kr.co.vo.EnterPatiVO;
import kr.co.vo.EnterVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class enterController {
   
   @Inject
   private EnterService service;
   
   
// 입원 기본화면
   @GetMapping("/enter")
   public String rsHome(Model model, @RequestParam(required = false) String stat) throws Exception {
	   log.debug("enter");
	   
	   // 입원 목록 가져오기

	   List<EnterVO> wardList = service.wardList();
	   model.addAttribute("wardList", wardList);

	   List<EnterVO> aniList = new ArrayList<EnterVO>();
	   
	   for(EnterVO enterVO : wardList) {
		   List<EnterVO> aniListTemp = service.aniList(enterVO.getWardNm());
		   
		   for(EnterVO enterVO2 : aniListTemp) {
			   aniList.add(aniList.size(), enterVO2);
		   }
	   }
	   model.addAttribute("aniList", aniList);
	   
	   // 일지 리스트
	   List<EnterVO> enterNoteList = service.enterNoteList();
	   model.addAttribute("enterNoteList", enterNoteList);
	   
	   // 식이 목록 가져오기
	   List<EnterVO> readFood = service.readFood();
	   model.addAttribute("readFood", readFood);
	   
	   
	   return "alphaVet/enter/enter";
   }
   
    @ResponseBody
	@PostMapping(value="/enter/notelist", produces = "application/json;charset=utf-8")
	public List<EnterVO> enterNoteList(Model model) throws Exception{
        List<EnterVO> enterNoteList = service.enterNoteList();
        model.addAttribute("enterNoteList", enterNoteList);
        log.debug("일지 목록"+enterNoteList);

		return enterNoteList;
	}
   
   //  동물 정보 가져오기 (투약 정보까지)
   @PostMapping(value = "/enter/read/{code}",produces = "application/json;charset=utf-8")
   @ResponseBody
   public Map<String, Object> getEnterInfo(@PathVariable String code) throws Exception {
      log.debug("확인"+code);
      EnterVO enterInfo = service.enterInfo(code);
      EnterVO readPrice = service.readPrice(code);
      List<EnterVO> readAllFoodList = service.readAllFoodList(code);
//      EnterVO readPriceEnter = service.readPriceEnter(code);
      List<EnterVO> readPreInList = service.readPreIn(code);
      List<EnterVO> aniEnterNoteList = service.aniEnterNoteList(code);
      
      List<EnterVO> todayMediList = service.todayMediList(code);
      List<EnterVO> todayFoodList = service.todayFoodList(code);
      
      Map<String, Object> enterMap = new HashMap<String, Object>();
      enterMap.put("enterInfo", enterInfo);
      enterMap.put("readPreInList", readPreInList);
      enterMap.put("readPrice", readPrice);
      enterMap.put("readAllFoodList", readAllFoodList);
      enterMap.put("aniEnterNoteList", aniEnterNoteList);
      enterMap.put("todayFoodList", todayFoodList);
      enterMap.put("todayMediList", todayMediList);
      log.debug("확인"+enterMap);
      return enterMap;
   }
   
   
   
   // 투약 등록 창
   @PostMapping(value="/enter/insertMedicine/{stCd}",produces="application/json;charset=utf-8") 
   @ResponseBody
   public EnterVO insertMedicine(@PathVariable String stCd) throws Exception {
      // 처방 리스트 가져오기 
      EnterVO readPreIn = (EnterVO) service.readPreIn(stCd);
      log.debug("확인 : " + readPreIn);
      
      return readPreIn;
   }
   
   
   // 퇴원
   @PutMapping(value = "/enter/delete", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String enterDelete(@RequestBody Map<String, String> mapData) throws Exception {
      log.debug("넘어온 값 확인 : " + mapData.get("stCd"));
      
      EnterVO aniInfo = service.enterInfo(mapData.get("stCd"));
      
      String animalCd = aniInfo.getAnimalCd();
      
      String patId = aniInfo.getPatId();
      
      String praCd = aniInfo.getPraCd();
      
      int cageNm = aniInfo.getCageNm();
      
      
      
      log.debug("patId => " + patId);
      log.debug("animalCd => " + animalCd);
      
      int rslt = service.enterRemove(mapData.get("stCd"));
//      int rslt2 = service.insertRec(patId, animalCd);
      int rslt2 = service.insertRec(praCd);
      int rslt3 = service.enterDeleteCage(cageNm);
      
      if(rslt > 0 && rslt2 > 0 && rslt3 > 0) {
         return "OK";
      }
      return "NG";
   }
   

   // 일지 등록
   @PostMapping(value="/enter/insertRecord",produces="application/json;charset=utf-8") 
   @ResponseBody
   public EnterVO insertRecord(@RequestBody EnterVO enterVO) throws Exception {
      service.insertRecord(enterVO);
      log.debug("아이디"+enterVO.getStCd());  
      log.debug("아이디"+enterVO.getStCd());  
      String rslt = enterVO.getStCd();
      
      EnterVO enter = service.getRecord(enterVO.getSnNm());
      
      int rslt2 = service.updateEnterDays(enterVO);
      
      if(rslt != null && rslt2 > 0) {
         return enter;
      }
      return null;
   }

   // 식이 등록
   @PostMapping(value="/enter/insertFood",produces="text/plain;charset=utf-8") 
   @ResponseBody
   public String insertFood(@RequestBody EnterVO enterVO) throws Exception {
	  String rslt = enterVO.getFoodDate();
	  enterVO.setFoodDate(rslt.replace("T"," "));
      int rslt2 = service.insertFood(enterVO);
      
      log.debug("식이등록"+rslt2);

      log.debug(enterVO.toString());
      
      int rslt3 = service.updateFoodPrice(enterVO);
      
      if(rslt3 > 0 && rslt2 > 0) {
         return "OK";
      }
      return "NG";
   }
   
   // 처방 등록
   @PostMapping(value="/enter/insertMedi",produces="text/plain;charset=utf-8") 
   @ResponseBody
   public String insertMedi(@RequestBody EnterVO enterVO) throws Exception {
      String rslt = enterVO.getInjDate();
      enterVO.setInjDate(rslt.replace("T"," "));
      int rslt2 = service.insertMedi(enterVO);
      if (rslt2 > 0) {
    	  return "OK";
      }
      return "NG";
      
   }
   
   
   //  일지 글 읽기
   @PostMapping(value = "/enter/getRecord/{snNm}",produces = "application/json;charset=utf-8")
   @ResponseBody
   public Map<String, Object> getEnterRecord(@PathVariable int snNm) throws Exception {
      log.debug("확인"+snNm);
      EnterVO getRecord = service.getRecord(snNm); 
      log.debug("stCd = "+getRecord.getStCd());
      log.debug("snDate = "+getRecord.getSnDate());
      
      if(getRecord.getSnDate().contains(".")) {
    	  String snDate = getRecord.getSnDate().substring(0,10);
    	  getRecord.setSnDate(snDate);
      }
      log.debug("snDate = "+getRecord.getSnDate());
      
      Map<String, String> dataMap = new HashedMap();
      dataMap.put("stCd", getRecord.getStCd());
      dataMap.put("snDate", getRecord.getSnDate());

      List<EnterVO> enterFoodList = service.enterFoodList(dataMap);
      log.debug("enterFoodList : " + enterFoodList);
      List<EnterVO> enterMediList = service.enterMediList(dataMap);
      log.debug("enterMediList : " + enterMediList);
      
      Map<String, Object> enterListMap = new HashMap<String, Object>();
      enterListMap.put("getRecord", getRecord);
      enterListMap.put("enterMediList", enterMediList);
      enterListMap.put("enterFoodList", enterFoodList);
      
      return enterListMap;
   }
   
   
   // 일지 삭제
   @DeleteMapping(value = "/enter/delRecord", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String delEnterRecord(@RequestBody Map<String, String> mapData) throws Exception {
      log.debug("넘어온 값 확인 : " + mapData.get("snNm"));
      int rslt = service.delRecord(Integer.parseInt(mapData.get("snNm")));
      
      if(rslt > 0) {
         return "OK";
      }
      return "NG";
   }
   
   
   // 일지 수정
   @PutMapping(value="/enter/upRecord", produces = "application/json;charset=utf-8")
   @ResponseBody
   public String updateRecord(@RequestBody EnterVO enterVO) throws Exception{
      log.debug("일지 수정 "+service.updateRecord(enterVO)); // 값 확인
      
      int cnt = service.updateRecord(enterVO);
      if(cnt > 0) {
         return "OK";
      }
      return "NG";
   }
   
   
//   // redirect 삭제
//   @PostMapping("/delete")
//   public String enterDelete(Model model, String stCd, String tab) throws Exception {
//      log.debug("animal Enter Remove");
//      service.enterRemove(stCd);
//      // 삭제 처리를 위해서 강아지,고양이,ETC 탭을 눌른 후 [퇴원] 버튼을 클릭했을 때
//      // jsp단에서 각탭에 해당하는 상태를 나타내는 parameter로 tab의 값이 'dog', 'cat', 'etc'에 따라서
//      // 삭제 처리 후, tab에 해당하는 값으로 jsp단(enter.jsp)에서 탭을 active 할 수 있도록 한다.
//      // 1) jsp페이지(enter.jsp)에서 내가 퇴원을 하고자 하는 카테고리 탭을 클릭후, 퇴원버튼을 눌렀을때 삭제를 위한 stCd값과 tab의 값을 함께 전송한다
//      //    현재 컨트롤러 메소드로, String stCd, String tab 의 파라미터를 받는다. (tab = 'dog', 'cat', 'etc'중에 1개가 된다)
//      // 2) 넘겨받은 tab의 값을 model 데이터 전달자에 담아 redirect될 페이지로 전송한다.
//      // 3) 넘긴 tab의 값을 enter.jsp에서 el로 받은 후, tab의 값에 따라서 강아지, 고양이, 기타의 탭을 나타내는 태그의 class = "active" 설정을 준다.
////      model.addAttribute("msg", "퇴원이 완료되었습니다.");
//
//      return "redirect:/enter?stat=" + tab;
//   }
   
   
}