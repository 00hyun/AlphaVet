package kr.co.alphaVet.wonmu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import kr.co.alphaVet.wonmu.service.WonmuService;
import kr.co.vo.AppReceiptVO;
import kr.co.vo.CageVO;
import kr.co.vo.DocFileVO;
import kr.co.vo.DrugVO;
import kr.co.vo.EmpVO;
import kr.co.vo.EnterVO;
import kr.co.vo.MemPatiVO;
import kr.co.vo.PatMemoVO;
import kr.co.vo.PatientVO;
import kr.co.vo.PaymentVO;
import kr.co.vo.PraVO;
import kr.co.vo.Pra_RoomVO;
import kr.co.vo.PreInVO;
import kr.co.vo.PreOutVO;
import kr.co.vo.RecPatientVO;
import kr.co.vo.ReceiptVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.StayVO;
import kr.co.vo.TestDetailVO;
import kr.co.vo.TestVO;
import kr.co.vo.VaccineDetailVO;
import kr.co.vo.VaccineVO;
import kr.co.vo.WardVO;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.s;

@Slf4j
@Controller
@RequestMapping("/")
public class WonmuController {

	@Inject
	WonmuService service;

	List<RecPatientVO> RecPatientVOList = null;

	@GetMapping("/wonmu")
	public String adHome(Model model) throws IOException {
		log.debug("adHome");
	
		List<WardVO> wardList = service.countWard();
		model.addAttribute("wardList", wardList);
		System.out.println("wardList"+wardList);
		List<ReservationVO> reservationList = service.reservationList();
		model.addAttribute("reservationList", reservationList);
		
		
		List<Pra_RoomVO> list = service.PraRoomList();
		model.addAttribute("praList", list);
		
		///////////////////앱테스트
		
		String WeatherURL = "https://tv.naver.com/sbs.sbstvanimal";
		Document doc = Jsoup.connect(WeatherURL).get();
		Elements elements = doc.select(".cds_type img"); //이미지 img
		Elements elements3 = doc.select(".cds_type a");//주소

		List<Map<String, Object>> catList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < elements.size(); i++) {
			Map<String, Object> map = new HashedMap();
			Element el = elements.get(i);
			Element el2 = elements3.get(i);

			String img = el.attr("src");
			String title = el.attr("alt");
			String href = "https://tv.naver.com/" + el2.attr("href"); //사진

			map.put("image", img);
			map.put("href", href);
			map.put("title", title);

			catList.add(map);
		}
		
		model.addAttribute("catMap", catList);
		System.out.println("catMap" + catList);
		
		//////
		
		return "alphaVet/wonmu/wonmuMain";
	}

//	 의사정보 (진료실별)
	@ResponseBody
	@PostMapping("/praRoomDoctor")
	public void praRoomDoctor() {
		log.debug("praRoomDoctor");
		List<EmpVO> list = service.praRoomDoctor();
		System.out.println("의사리스트"+list);
	}
	
//	 신규환자 등록
	@ResponseBody
	@PostMapping("/addPat")
	public void addPat(MemPatiVO memPatiVO, Model model) {
		log.debug("mempatiVO : " + memPatiVO);
		service.addPet(memPatiVO);
	}

//	 접수
	@ResponseBody
	@PostMapping(value = "/startReceipt", produces = "application/json")
	public int startReceipt(ReceiptVO receiptVO,RecPatientVO recPatientVO, Model model) {
		log.debug("receiptVO : " + receiptVO);
		int cnt = service.startReceipt(receiptVO);
		//접수를 했고.. 접수 테이블 환자아뒤를 입력해서 그사람의 접수테이블을 가져온다?!
//		service.showReceipt(recPatientVO); d이거....
		return cnt;
	}
	
	/*
	 * // 접수
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "/startReceipt", produces = "application/json") public
	 * RecPatientVO startReceipt(ReceiptVO receiptVO, Model model) {
	 * log.debug("receiptVO : " + receiptVO); service.startReceipt(receiptVO); //접수를
	 * 했고.. 접수 테이블 환자아뒤를 입력해서 그사람의 접수테이블을 가져온다?! RecPatientVO vo =
	 * service.showReceipt(receiptVO.getPatId()); return vo; }
	 */
	@RequestMapping(value = "/ajax/autocomplete.do")
	@ResponseBody
	public Map<String, Object> autocomplete(@RequestParam Map<String, Object> paramMap) throws Exception {

		List<Map<String, Object>> resultList = service.autocomplete(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
	}

	@RequestMapping(value = "/ajax/patDetail", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public MemPatiVO patDetail(@RequestBody MemPatiVO memPatiVO) {
		log.debug("검색버튼 누르면  patDetail");
		System.out.println("이름 " + memPatiVO.getPatName());
		System.out.println("번호" + memPatiVO.getMemTel());
		MemPatiVO vo = service.patDetail(memPatiVO);
//		System.out.println("디테일mempatiVO" + vo);
		return vo;
	}
	
	
	//검색버튼 누르면 환자기록
	@RequestMapping(value = "/searchPatMemo", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<PatMemoVO> searchPatMemo(@RequestBody MemPatiVO memPatiVO) {
		log.debug("검색버튼 누르면  searchPatMemo");
		List<PatMemoVO> list = service.searchPatMemo(memPatiVO);
		return list;
	}
	
	
	@RequestMapping(value = "/ajax/praDate", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<PraVO> selectPra(@RequestBody MemPatiVO memPatiVO,@DateTimeFormat(pattern = "yyyy-MM-dd") Date praDate) {
		log.debug("검색버튼 누르면  praDate");
		 List<PraVO> list = service.selectPra(memPatiVO);
		System.out.println("praVO" + list);
		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/patientList", method=RequestMethod.POST)
	public	List<RecPatientVO> patientList(HttpServletRequest req, HttpServletResponse res, @RequestParam Map<String, Object> param){
		log.debug(param.toString());
		log.debug("patientList");
		// TODO: 널포인터 에러
		int praRoomNm = Integer.parseInt(param.get("praRoomNm").toString());
		
		List<RecPatientVO> list = service.patientList(param);
		System.out.println("patientList"+list);
		

		
		return list;
	
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/receiptList", method=RequestMethod.POST)
	public	List<RecPatientVO> receiptList(){
		log.debug("receiptList");
		List<RecPatientVO> list = service.receiptList();
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/receiptList2", method=RequestMethod.POST)
	public	List<RecPatientVO> receiptList2(){
		log.debug("receiptList2");
		List<RecPatientVO> list = service.receiptList2();
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/statusUpdate")
	public int statusUpdate(String praCd) { //  요따구로 받으면 나중에 받을 게 추가 되더라도 거의 형태를 유지
		log.debug("statusUpdate");
		System.out.println("praCd는?"+praCd);
		
		int cnt = service.statusUpdate(praCd);
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/confirmPraCd")
	public String confirmPraCd(String patId) { //  요따구로 받으면 나중에 받을 게 추가 되더라도 거의 형태를 유지
		log.debug("confirmPraCd");
		
		String praCd = service.confirmPraCd(patId);
		System.out.println(praCd);
		return praCd;
	}
	
	//입원
	@ResponseBody
	@PostMapping(value = "/enterStay")
	public int enterStay(StayVO stayVO) {
		log.debug("enterStay");
		int cnt = service.checkEneter(stayVO.getPraCd());
		System.out.println(stayVO.getPraCd()+"stayVO.getPraCd()");
		int cnt1=0;
		
		if(cnt == 0) {//진료코드에 해당하는 입원건이 없으면 입원을 진행함 / 없으면 진행 안시킴
			cnt1 = service.insertEneter(stayVO);//입원에 넣어주고
			int updateEnter = service.updateEnter(stayVO.getPraCd());//입원중으로 상태를 바꾸고
			int updateCageStatus = service.updateCageStatus(stayVO.getCageNm());//케이지 번호의 상태를 1로 바꿔준다.
		}
		
		return cnt;
	}
	//수납테이블
	@ResponseBody
	@PostMapping(value = "/paymentInsert")
	public int paymentInsert(PaymentVO paymentVO) {
		log.debug("paymentInsert");
		int cnt = service.paymentInsert(paymentVO);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/updatePat")
	public MemPatiVO updatePat(MemPatiVO mempatiVO) {
		log.debug("updatePat");
		log.debug("mempatiVO"+mempatiVO);
		int cnt = service.updatePat(mempatiVO);
		int cnt2= service.updatePat2(mempatiVO);
		System.out.println("업데이트 브이오"+cnt);
		MemPatiVO memPatiVO = null;
		if(cnt > 0) {
			memPatiVO = service.patIdSearch(mempatiVO.getPatId());
		}else {
			memPatiVO = null;
		}
		if(cnt2 > 0) {
			memPatiVO = service.patIdSearch(mempatiVO.getPatId());
		}else {
			memPatiVO = null;
		}
		System.out.println("mempativo"+memPatiVO);
		return memPatiVO;
	}
	
	
	
	
	@ResponseBody
	@PostMapping(value = "/updatePatImage")
	public int updatePatImage(PatientVO patientVO, HttpServletRequest req, MultipartFile multi) {
		
		int cnt = service.updatePatImage(patientVO);
		return cnt;
	}
	
	
	
	@ResponseBody
	@PostMapping(value = "/updatePat2")
	public MemPatiVO updatePat2(MemPatiVO mempatiVO) {
		log.debug("updatePat2");
		log.debug("mempatiVO2"+mempatiVO);
		int cnt= service.updatePat2(mempatiVO);
		
		System.out.println("업데이트 브이오222"+cnt);
		MemPatiVO memPatiVO = null;
		if(cnt > 0) {
			memPatiVO = service.patIdSearch(mempatiVO.getPatId());
		}else {
			memPatiVO = null;
		}
		System.out.println("mempativo"+memPatiVO);
		return memPatiVO;
	}
	
	@ResponseBody
	@PostMapping(value = "/updateRec")
	public RecPatientVO updateRec(String patId) {
		log.debug("updateRec");
		int cnt = service.updateWeight(patId);
		int cnt2 = service.updateRec(patId);
		
		RecPatientVO vo = null;
		if(cnt > 0) {
			vo = service.selectRecPat(patId);
		}else {
			vo = null;
		}
		return vo;
				
	}
	
	@ResponseBody
	@PostMapping(value = "/vaccineList" , produces = "application/json")
	public List<VaccineVO> vaccineList(@RequestBody MemPatiVO memPatiVO) {
		log.debug("vaccineList");
		log.debug("vaccineList",memPatiVO);
		List<VaccineVO> list = service.vaccineList(memPatiVO);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/vacantCage")
	public List<CageVO> vacantCage(int wardNm) {
		log.debug("vacantCage");
		log.debug("wardNm",wardNm);
		 List<CageVO>  list = service.vacantCage(wardNm);
		return list;
	}
	
	/*
	 * @PostMapping(value = "/checkEneter") public int checkEneter(String patId) {
	 * int cnt = service.checkEneter(patId); return cnt; }
	 */
	
	@ResponseBody
	@PostMapping(value = "/moneyDetail")
	public List<EnterVO> moneyDetail(String patId){
		log.debug("moneyDetail");
		List<EnterVO> list = service.moneyDetail(patId);
		log.debug("moneyDetaillist"+list);
//		log.debug("moneyDetaillist"+list.get(0));
		//없을수도 있으니까 겟0안되는거어어어어어
		
		return list;
		
	}
	
	@ResponseBody
	@PostMapping(value = "/preInDetail")
	public List<PreInVO> preInDetail(String patId){
		log.debug("preInDetail");
		List<PreInVO> list = service.preInDetail(patId);
		log.debug("preInDetail"+list);
		
		return list;
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "/patIdSearch")
	public MemPatiVO patIdSearch(String patId){
		log.debug("patIdSearch");
		MemPatiVO vo = service.patIdSearch(patId);
		return vo;
		
	}

	
	
	@ResponseBody
	@PostMapping(value = "/reservationUpdate")
	public int reservationUpdate(int resNm){
		log.debug("reservationUpdate");
		int cnt = service.reservationUpdate(resNm);
		return cnt;
		
	}

	@ResponseBody
	@PostMapping(value = "/testDetail")
	public List<TestDetailVO> testDetail(String patId){
		log.debug("testDetail");
		List<TestDetailVO> list = service.testDetail(patId);
		log.debug("preInDetail"+list);
		
		return list;
	
	}
	
	@ResponseBody
	@PostMapping(value = "/praStatusUpdate")
	public int praStatusUpdate(String praCd){
		log.debug("praStatusUpdate");
		int cnt = service.praStatusUpdate(praCd);
		log.debug("praStatusUpdate"+cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/reservationList")
	public List<ReservationVO> reservationList(){
		log.debug("reservationList");
		List<ReservationVO> list = service.reservationList();
		log.debug("reservationList"+list);
		
		return list;
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "/insertMemo")
	public int insertMemo(PatMemoVO patMemoVO){
		log.debug("insertMemo");
		int cnt = service.insertMemo(patMemoVO);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/confirmWeight", produces = "application/json")
	public List<PraVO> confirmWeight(@RequestBody MemPatiVO memPatiVO) {
		log.debug("confirmWeight");
		List<PraVO> list = service.confirmWeight(memPatiVO);
		System.out.println("mempatiVO"+memPatiVO);
		return list;
	}

	
	
	@ResponseBody
	@PostMapping(value = "/showMemo")
	public List<PatMemoVO> showMemo(String patId){
		log.debug("showMemo");
		List<PatMemoVO> list = service.showMemo(patId);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/countAppReceipt")
	public int countAppReceipt(){
		log.debug("countAppReceipt");
		int cnt = service.countAppReceipt();
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/appReceiptList")
	public List<AppReceiptVO> appReceiptList(){
		log.debug("appReceiptList");
		List<AppReceiptVO> list = service.appReceiptList();
		
		return list;
	}
	@ResponseBody
	@PostMapping(value = "/appUpdate")
	public int appUpdate(String patId){
		log.debug("appUpdate");
		int cnt = service.appUpdate(patId);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/praCdTest")
	public List<TestVO> praCdTest(String praCd) {
		List<TestVO> list = service.praCdTest(praCd);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/praCdPreOut")
	public List<PreOutVO> praCdPreOut(String praCd) {
		List<PreOutVO> list = service.praCdPreOut(praCd);
		return list;
	}
	@ResponseBody
	@PostMapping(value = "/docReceipt")
	public MemPatiVO docReceipt(String praCd)  {
		MemPatiVO vo  = service.docReceipt(praCd);
		return vo;
	}
	
	@ResponseBody
	@PostMapping(value = "/countPreOut")
	public int countPreOut(String praCd)   {
		int cnt  = service.countPreOut(praCd);
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/praCdDate")
	public PraVO praCdDate(String praCd) {
		PraVO vo  = service.praCdDate(praCd);
		return vo;
	}
	
	@ResponseBody
	@PostMapping(value = "/doc2select")
	public Map<String, Object> doc2select(String praCd) {
		MemPatiVO vo1  = service.doc2select(praCd);
		if(vo1.getPatGender() == "W") {
			vo1.setPatGender("암컷");
		}else {
			vo1.setPatGender("수컷");
		}
		
		List<DocFileVO> list = service.doc2pra(praCd);
		System.out.println("doc2pra"+list);
		Map<String, Object> map  = new HashedMap();
		map.put("vo1", vo1);
		map.put("vo2", list);
		
		
		return map;
	}

	
	public String getAge(String InputAge) {
		 //현재 년도 구하기
		 Calendar now = Calendar.getInstance(); //년월일시분초
		 Integer currentYear = now.get(Calendar.YEAR);
			 
		 //태어난년도를 위한 세팅
		 SimpleDateFormat format = new SimpleDateFormat("yyyy");
		 String stringBirthYear = format.format(InputAge); //년도만받기
		 //태어난 년도
		 Integer birthYear = Integer.parseInt(stringBirthYear);

		 // 현재 년도 - 태어난 년도 => 나이 (만나이X)
	     int age = (currentYear - birthYear +1);
	     String outputAge = Integer.toString(age);
	        
	 	 return outputAge;
	}
	
	@ResponseBody
	@PostMapping(value = "/praCdDrug")
	public List<DrugVO> praCdDrug(String praCd) {
		List<DrugVO> list = service.praCdDrug(praCd);
		return list;
	}

	@ResponseBody
	@PostMapping(value = "/praCdPra")
	public List<PraVO> praCdPra(String praCd) {
		log.debug("praCdPra");
		List<PraVO> list = service.praCdPra(praCd);
		System.out.println("praCdPra"+list);
		return list;
	}

	@ResponseBody
	@PostMapping(value = "/praCdVaccine")
	public List<VaccineDetailVO> praCdVaccine(String praCd) {
		List<VaccineDetailVO> list = service.praCdVaccine(praCd);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/praStayFood")
	public List<EnterVO> praStayFood(String praCd) {
		List<EnterVO> list = service.praStayFood(praCd);
		return list;
	}
	@ResponseBody
	@PostMapping(value = "/praStayFoodCnt")
	public List<EnterVO> praStayFoodCnt(String praCd) {
		List<EnterVO> list = service.praStayFoodCnt(praCd);
		return list;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/selectPracd2", produces = "application/json")
	public EnterVO selectPracd2(String praCd) {
		
		EnterVO vo = service.selectPracd2(praCd);
		if(vo == null) {
			//입원기록이 없으면 입원 전 기록을 가져온다
			vo = service.selectPracd(praCd);
		}else {
			vo = service.selectPracd2(praCd);
		}
		
		return vo ;
	}
	
//	@ResponseBody
//	@PostMapping(value = "/finalSum")
//	public int finalSum(String praCd) {
//		EnterVO vo = service.selectPracd2(praCd);
//		//null이면 입원을 안한거
//		 List<EnterVO> list = null;
//		
//		if(vo == null) {
//			list = service.sum(praCd);
//			System.out.println("입원안함"+list);
//		}else {
//			list = service.finalSum(praCd);
//			System.out.println("입원함"+list);
//		}
//		
//		return list;
//	}
//	
	
	@ResponseBody
	@PostMapping(value = "/onlyStay")
	public int onlyStay(String praCd){
		int cnt = service.onlyStay(praCd);
		return cnt;
	}
	
	@ResponseBody
	@PostMapping(value = "/resultPriceDetail")
	public EnterVO  resultPriceDetail (String praCd){
		EnterVO vo  = null;
		
		if( service.checkEnterYN(praCd) == null ){//입원안했다
			vo = service.selectPracd(praCd);
		}else {
			vo = service.selectPracd2(praCd);
		}
		return vo;
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "/resultPrice")
	public int  resultPrice (String praCd){
		log.debug("resultPrice");
		
		int price = 0;
		
		if(service.checkEnterYN(praCd) == null) {//입원 안했다
			price = service.sum(praCd);
		}else {
			price  = service.finalSum(praCd);
		}
		System.out.println("resultPrice"+price);
		return price;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/totalSum")
	public EnterVO totalSum (String praCd){
		
		EnterVO vo = null;
		
		if(service.checkEnterYN(praCd) == null) {//입원 안했다
			vo = service.selectPracd(praCd);
		}else {
			vo  = service.selectPracd2(praCd);
		}
		
		return vo;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/updateWeight")
	public int updateWeight(PatientVO patientVO){
		log.debug("updateWeight");
		int cnt = service.updateWeight(patientVO);
		
		return cnt ; 
	}
	
	
	
	
	
	
	
	

}
