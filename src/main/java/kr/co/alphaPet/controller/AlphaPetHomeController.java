package kr.co.alphaPet.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaPet.service.IAppHomeService;
import kr.co.alphaPet.service.IClinicService;
//import kr.co.alphaVet.wonmu.controller.HttpResponse;
//import kr.co.alphaVet.wonmu.controller.JsonNode;
import kr.co.mapper.AppHomeMapper;
import kr.co.mapper.EnterMapper;
import kr.co.vo.AppCont1;
import kr.co.vo.AppCont2;
import kr.co.vo.AppReceiptVO;
import kr.co.vo.AppStayVO;
import kr.co.vo.ClinicVO;
import kr.co.vo.EmpVO;
import kr.co.vo.EnterPatiVO;
import kr.co.vo.EnterVO;
import kr.co.vo.HospitalVO;
import kr.co.vo.MemberVO;
import kr.co.vo.PetBoardVO;
import kr.co.vo.PetIsMemberVO;
import kr.co.vo.PetVO;
import kr.co.vo.PraVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.StayNoteVO;
import kr.co.vo.VaccineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AlphaPetHomeController {

	@Inject
	IAppHomeService appHomeService;

	@Inject
	private IClinicService clinicService;

	@RequestMapping(value = "/appHome", method = RequestMethod.GET)
	public String appHome(Model model, HttpSession session) throws IOException {
		log.info("appHome");
		String userId = (String) session.getAttribute("userId");
		log.debug(userId);
		// userId 가지고 환자정보 리스트 불러오기
		List<PetVO> petList = appHomeService.petList(userId);
		model.addAttribute("petList", petList);
		
		List<AppCont1> cont1 = appHomeService.cont1();
		model.addAttribute("cont1",cont1);
		
		List<AppCont2> cont2 = appHomeService.cont2();
		model.addAttribute("cont2",cont2);

//		String WeatherURL = "https://dmanimal.co.kr/adoption";
//		Connection connection = Jsoup.connect(WeatherURL);
//		connection.userAgent("Chrome");
//		connection.header("User-Agent",
//				"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.79 Safari/537.36");
//
//		Document doc = connection.get();
//		Elements elements = doc.select(".blocked ._fade_link");
//		Elements elements2 = doc.select("._fade_link .card-thumbnail-wrap");
//		Elements elements3 = doc.select(".blocked .title-block");
//
//		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//		for (int i = 0; i < elements.size(); i++) {
//			Map<String, Object> map = new HashedMap();
//			Element el = elements.get(i);
//			Element el2 = elements2.get(i);
//			Element el3 = elements3.get(i);
//
//			String img = "https://dmanimal.co.kr/" + el.attr("href");
//			String href = el2.attr("style");
//			href = href.replace("background-image: url(", "");
//			href = href.replace(");  background-size: cover; background-position: 50% 50%;", "");
//			String title = el3.text();
//			title = title.replace("공지", "");
//
//			map.put("href", img);
//			map.put("image", href);
//			map.put("title", title);
//
//			list.add(map);
//		}
//
//		model.addAttribute("abandonmap", list);
//		System.out.println("abandonmap" + list);
//		
//		
//		///크롤링
//		String WeatherURL1 = "https://tv.naver.com/sbs.sbstvanimal";
//		Connection connection1 = Jsoup.connect(WeatherURL1);
//		connection1.userAgent("Chrome");
//		connection1.header("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.79 Safari/537.36");
//
//		Document doc1 = Jsoup.connect(WeatherURL1).get();
//		Elements elements1 = doc1.select(".cds_type img"); //이미지 img
//		Elements elements31 = doc1.select(".cds_type a");//주소
//
//		List<Map<String, Object>> catList = new ArrayList<Map<String, Object>>();
//		for (int i = 0; i < elements1.size(); i++) {
//			Map<String, Object> map = new HashedMap();
//			Element el = elements1.get(i);
//			Element el2 = elements31.get(i);
//
//			String img = el.attr("src");
//			String title = el.attr("alt");
//			String href = "https://tv.naver.com/" + el2.attr("href"); //사진
//
//			map.put("image", img);
//			map.put("href", href);
//			map.put("title", title);
//
//			catList.add(map);
//		}
//		
//		model.addAttribute("catMap", catList);
//		System.out.println("catMap" + catList);
//		///크롤링
		
	//////////////////
		

		return "alphaPet/appHome";
	}

	@PostMapping("/clinicList")
	@ResponseBody
	public List<ClinicVO> clinicList() {
		List<ClinicVO> clinicList = clinicService.selectClinicList();

		return clinicList;
	}

	@PostMapping("/selectClinic")
	@ResponseBody
	public ClinicVO selectClinic(String cliCd) {
		log.debug(cliCd);

		ClinicVO clinicVO = clinicService.selectClinic(cliCd);
		System.out.println("clinicVO"+clinicVO);

		return clinicVO;
	}

	@PostMapping("/hospitalSelect")
	@ResponseBody
	public List<HospitalVO> hospitalSelect(String patId) {
		log.debug(patId);

		List<HospitalVO> clinicList = clinicService.hospitalSelect(patId);

		return clinicList;
	}
	
	@PostMapping("/patWeight")
	@ResponseBody
	public List<PraVO> patWeight(String patId) {
		log.debug("patWeight",patId);
		
		List<PraVO> patWeight = appHomeService.patWeight(patId);
		
		return patWeight;
	}

	@PostMapping("/isMember")
	@ResponseBody
	public List<PetIsMemberVO> isMember(PetIsMemberVO vo) throws Exception {
		log.debug("isMember :: " + vo);
		List<PetIsMemberVO> isMemberList = clinicService.isMember(vo);
		log.debug("isMemberList :: " + isMemberList);

		PetVO petVO = new PetVO();
		HospitalVO hospitalVO = new HospitalVO();

		for (int i = 0; i < isMemberList.size(); i++) {
			petVO.setPatId(isMemberList.get(i).getPatId()); // 환자 ID
			petVO.setPatName(isMemberList.get(i).getPatName()); // 환자 이름
			petVO.setPatWeight(isMemberList.get(i).getPatWeight()); // 환자 몸무게
			petVO.setPatBirth(isMemberList.get(i).getPatBirth()); // 환자 생일
			petVO.setAnimalCd(isMemberList.get(i).getAnimalCd()); // 동물 종류
			petVO.setUserId(vo.getUserId()); // 로그인 아이디
			log.debug("petVO :: " + petVO);

			// 환자 VO를 petVO에 담아서 pet테이블에 insert 시킨다.
			appHomeService.insertPet(petVO);

			// 병원 코드로 병원 정보 select
			ClinicVO clinicVO = clinicService.selectClinic(vo.getCliCd());
			log.debug("clinicVO :: " + clinicVO);

			hospitalVO.setPatId(isMemberList.get(i).getPatId());
			hospitalVO.setCliCd(clinicVO.getCliCd());
			hospitalVO.setCliName(clinicVO.getCliName());
			hospitalVO.setCliTel(clinicVO.getCliTel());
			hospitalVO.setCliAddr1(clinicVO.getCliAddr1());
			hospitalVO.setCliAddr2(clinicVO.getCliAddr2());
			log.debug("hospitalVO :: " + hospitalVO);

			// 병원 VO를 hospitalVO에 담아서 hospital테이블에 insert 시킨다.
			appHomeService.insertHos(hospitalVO);
		}

		return isMemberList;
	}

	@PostMapping("/accessPetList")
	@ResponseBody
	public List<PetIsMemberVO> accessPetList(String userId) {
		// 회원의 인증된 병원 / 환자 정보를 가져온다
		List<PetIsMemberVO> accessList = appHomeService.accessList(userId);
		log.debug("accessList :: " + accessList);

		return accessList;
	}

	@PostMapping("/carePraList")
	@ResponseBody
	public List<PraVO> carePraList(PetIsMemberVO vo) throws Exception {
		log.debug("patId만 넘어와도 됨 :: " + vo);
		List<PraVO> praList = appHomeService.carePraList(vo);
		log.debug("진료내역 :: " + praList);

		return praList;
	}

	@PostMapping("/careVaccineList")
	@ResponseBody
	public List<VaccineVO> careVaccineList(PetIsMemberVO vo) throws Exception {
		log.debug("patId만 넘어와도 됨 :: " + vo);
		List<VaccineVO> vaccineList = appHomeService.careVaccineList(vo);
		log.debug("백신내역 :: " + vaccineList);

		return vaccineList;
	}

	@PostMapping(value="/careStayList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<EnterVO> careStayList(PetIsMemberVO vo) throws Exception {
		log.debug("patId만 넘어와도 됨 :: " + vo);
		List<EnterVO> stayList = appHomeService.careStayList(vo);
		log.debug("입원내역 :: " + stayList);
		
		return stayList;
	}

	// 입원 상세
	@PostMapping("/stayDetail")
	@ResponseBody
	public List<AppStayVO> stayDetail(String stCd) throws Exception {

		List<AppStayVO> stayDetail = appHomeService.stayDetail(stCd);

		return stayDetail;
	}

	// 백신 상세
	@PostMapping("/vaccineDetail")
	@ResponseBody
	public List<VaccineVO> vaccineDetail(VaccineVO vaccineVO) throws Exception {

		List<VaccineVO> vaccineDetail = appHomeService.vaccineDetail(vaccineVO);

		return vaccineDetail;
	}

	// 병원 check List
	@PostMapping("/app/boardList")
	@ResponseBody
	public List<PetBoardVO> boardList() {
		String abType = "펫과사전";
		List<PetBoardVO> boardList = appHomeService.hosBoardList(abType);

		return boardList;
	}

	// 접수신청
	@PostMapping("/insertAppReceipt")
	@ResponseBody
	public int insertAppReceipt(String patId) {
		log.debug("insertAppReceipt", patId);
		int cnt = appHomeService.insertAppReceipt(patId);
		return cnt;
	}

	// 접수신청 중복체크
	@PostMapping("/checkReceipt")
	@ResponseBody
	public int checkReceipt(String patId) {
		log.debug("checkReceipt", patId);
		int check = appHomeService.checkReceipt(patId);

		int cnt = 0;
		if (check > 0) {
			cnt = 0;
		} else {
			cnt = appHomeService.insertAppReceipt(patId);
		}
		return cnt;
	}

	// 예약 의사
	@PostMapping("/app/empList")
	@ResponseBody
	public List<EmpVO> empList(String animalCd) {
		log.debug("empList :: ", animalCd);
		List<EmpVO> empList = appHomeService.empList(animalCd);

		return empList;
	}

	// 예약 리스트(의사)
	@PostMapping("/app/reservationList")
	@ResponseBody
	public List<ReservationVO> reservationList(String empId) {
		log.debug("empId :: ", empId);
		List<ReservationVO> reservationList = appHomeService.reservationList(empId);

		return reservationList;
	}

	@PostMapping("/app/reservationInsert")
	@ResponseBody
	public void reservationInsert(ReservationVO reservationVO) throws ParseException {
		appHomeService.reservationInsert(reservationVO);
	}

	// 예약 리스트(내가 예약)
	@PostMapping("/reservationMyList")
	@ResponseBody
	public List<ReservationVO> reservationMyList(String patId) throws ParseException {
		List<ReservationVO> resList = appHomeService.reservationMyList(patId);
		return resList;
	}

}
