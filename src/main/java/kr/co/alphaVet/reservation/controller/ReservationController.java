package kr.co.alphaVet.reservation.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;

import org.apache.commons.imaging.internal.Debug;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.co.alphaVet.admin.sms.SmsService;
import kr.co.alphaVet.reservation.service.ReservationService;
import kr.co.vo.EnterVO;
import kr.co.vo.ReservationVO;
import kr.co.vo.SmsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReservationController {
	
	@Inject
	private ReservationService service;
	
	@Inject
	private SmsService sService;
	
	@GetMapping("/reservation")
	public String rsHome(Model model) throws Exception {
		
		
		// 문자 메시지 저장 목록
		List<SmsVO> smsList = sService.smsList();
		model.addAttribute("smsList", smsList);
		log.debug("smsList : "+smsList);
		
		return "alphaVet/reservation/reservation";
	}
	
    @ResponseBody
	@PostMapping(value="/reservation/resList", produces = "application/json;charset=utf-8")
	public List<ReservationVO> reservationList(Model model) throws Exception{
		List<ReservationVO> reservationList = service.reservationList();
		model.addAttribute("reservationList", reservationList);
    	
		return reservationList;
	}
    
    @ResponseBody
    @PostMapping(value="/reservation/resEmpList", produces = "application/json;charset=utf-8")
    public List<ReservationVO> resEmpList(Model model) throws Exception{
    	List<ReservationVO> resEmpList = service.resEmpList();
    	model.addAttribute("resEmpList", resEmpList);
    	
    	return resEmpList;
    }
	
	
	// 달력 
	@PostMapping("/reservation/calendar")
	@ResponseBody
	public ResponseEntity<String> calendar(@RequestBody String patId) throws Exception {
//		System.out.println("calendar :: " + empId);
		List<ReservationVO> calendar = null;
		ResponseEntity<String> entity = null;
		try {
			calendar = service.getCalendar(patId);
			String jsonArray = new Gson().toJson(calendar);
			
			System.out.println(jsonArray);
			entity = new ResponseEntity<String>(jsonArray, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return entity;
	}
	
	
	// 일정 등록
	@ResponseBody
	@RequestMapping(value = "/reservation/insert.do", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public ResponseEntity<ReservationVO> insertCalendar(@RequestBody ReservationVO reservationVO, String str) throws Exception {
//		System.out.println("insert :: patId :: " + reservationVO.getPatId());
		ResponseEntity<ReservationVO> entity = null;
		
//		System.out.println(reservationVO.getResAllDay());
		
		service.insert(reservationVO);
		
		ReservationVO calendar = null;
		try {
			calendar = service.getCalendarOne(reservationVO.getResNm());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		entity = new ResponseEntity<ReservationVO>(calendar, HttpStatus.OK);
		return entity;
	}
	
	
	// 일정 삭제
	@ResponseBody
	@RequestMapping(value = "/reservation/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCalendar(int resNm) throws Exception{
		
		ResponseEntity<String> entity = null;
		int result = service.delete(resNm);
		
		if(result > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("ERROR", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/reservation/selectOne", method = RequestMethod.POST)
	public ResponseEntity<ReservationVO> selectOneCalendar(int resNm) throws Exception{
		ResponseEntity<ReservationVO> entity = null;
		ReservationVO reservationVO = service.selectOne(resNm);
		
		String resStartDate = reservationVO.getResStartDate().substring(0,10);
		String resEndDate = reservationVO.getResEndDate().substring(0, 10);
		reservationVO.setResStartDate(resStartDate);
		reservationVO.setResEndDate(resEndDate);

		entity = new ResponseEntity<ReservationVO>(reservationVO, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 일정 수정
	@ResponseBody
	@RequestMapping(value = "/reservation/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, String> updateCalendar(@RequestBody ReservationVO reservationVO) throws Exception{
		Map<String, String> resultMap = new HashMap<String, String>();
		log.debug("reservationVO :: " + reservationVO);
		
		service.update(reservationVO);
		resultMap.put("result", "SUCCESS");
		return resultMap;
	}
	
	
	//동물 이름 자동완성
	@RequestMapping(value = "/reservation/autocompletePat")
	@ResponseBody
	public Map<String, Object> autocompletePat(@RequestParam Map<String, Object> patNameMap) throws Exception {

		List<Map<String, Object>> patNameList = service.autocompletePat(patNameMap);
		
		patNameMap.put("patNameList", patNameList);

		return patNameMap;
	}

	
	//일정 수의사 이름 자동완성
	@RequestMapping(value = "/reservation/autocompleteEmp")
	@ResponseBody
	public Map<String, Object> autocompleteEmp(@RequestParam Map<String, Object> empNameMap) throws Exception {
		
		List<Map<String, Object>> empNameList = service.autocompleteEmp(empNameMap);
		
		empNameMap.put("empNameList", empNameList);
		
		return empNameMap;
	}
	
	
	// 문자 메시지 전송
		@PostMapping(value="/reservation/sendSms",produces="application/json;charset=utf-8") 
		@ResponseBody
	   public String sendSms(@RequestBody ReservationVO reservationVO) throws Exception {
	      service.sendSms(reservationVO);
	      
	      int rslt = service.sendSms(reservationVO);
	      
	      if(rslt > 0) {
	         return "OK";
	      }
	      return "NG";
	   }
		
		// 진짜 문자 메시지 전송
		@ResponseBody
		@PostMapping(value = "reservation/sendMSG",produces = "application/json;charset=utf-8")
		public void sendMSG(@RequestBody Map<String, String> data) {
			System.out.println(data.get("phoneNumber"));
			System.out.println(data.get("content"));
			send_msg(data.get("phoneNumber"), data.get("content"));
		}
		
//		@SuppressWarnings("unchecked")
		public void send_msg(String tel, String content) {
	        String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
	        String requestUrl= "/sms/v2/services/";                   		// 요청 URL
	        String requestUrlType = "/messages";                      		// 요청 URL
	        String accessKey = "z94NZh6sJ0bsg7aIUh5w";                     						// 개인 인증키
	        String secretKey = "3Hn9GXb27gxn5VxnFXnQB9JTw1n4bEQliiVk9trb";  										// 2차 인증을 위해 서비스마다 할당되는 service secret
	        String serviceId = "ncp:sms:kr:299827593140:test1";        									// 프로젝트에 할당된 SMS 서비스 ID
	        String method = "POST";											// 요청 method
	        String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
	        requestUrl += serviceId + requestUrlType;
	        String apiUrl = hostNameUrl + requestUrl;

	        // JSON 을 활용한 body data 생성

	        JsonObject bodyJson = new JsonObject();
	        JsonObject toJson = new JsonObject();
		    JsonArray  toArr = new JsonArray();
		    
		    toJson.addProperty("content",content);
		    toJson.addProperty("to",tel);
		    toArr.add(toJson);
		    
		    bodyJson.addProperty("type","sms");	// 메시지 Type (sms | lms)
		    bodyJson.addProperty("contentType","COMM");
		    bodyJson.addProperty("countryCode","82");
		    bodyJson.addProperty("from","01044579605");	// 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.		
		    bodyJson.addProperty("content",content);	// 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.		
		    bodyJson.add("messages", toArr);		
		    

		    String body = bodyJson.toString();
		    
		    System.out.println(body);
		    
	        try {

	            URL url = new URL(apiUrl);

	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setUseCaches(false);
	            con.setDoOutput(true);
	            con.setDoInput(true);
	            con.setRequestProperty("content-type", "application/json");
	            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
	            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
	            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
	            con.setRequestMethod(method);
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            
	            wr.write(body.getBytes());
	            wr.flush();
	            wr.close();

	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            System.out.println("responseCode" +" " + responseCode);
	            if(responseCode==202) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }

	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            
	            System.out.println(response.toString());

	        } catch (Exception e) {
	            System.out.println(e);
	        }
	    }
		
		public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
		    String space = " "; 
		    String newLine = "\n"; 
		    

		    String message = new StringBuilder()
		        .append(method)
		        .append(space)
		        .append(url)
		        .append(newLine)
		        .append(timestamp)
		        .append(newLine)
		        .append(accessKey)
		        .toString();

		    SecretKeySpec signingKey;
		    String encodeBase64String;
			try {
				signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
				Mac mac = Mac.getInstance("HmacSHA256");
				mac.init(signingKey);
				byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
			} catch (UnsupportedEncodingException e) {
				encodeBase64String = e.toString();
			}
		    

		  return encodeBase64String;
		}		
		
		
		
	
}
