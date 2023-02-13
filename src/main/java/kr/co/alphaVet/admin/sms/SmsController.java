package kr.co.alphaVet.admin.sms;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.SmsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sms")
public class SmsController {

	@Inject
	SmsService sService;
	
	@ResponseBody
	@PostMapping("/list")
	public List<SmsVO> smsList(){
		return sService.smsList(); 
	}

	@ResponseBody
	@PostMapping("/insert")
	public int insertSms(SmsVO smsVO) {
		return sService.insertSms(smsVO);
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateSms(SmsVO smsVO) {
		return sService.updateSms(smsVO);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public int deleteSms(String smsCd) {
		log.debug(smsCd);
		return sService.delete(smsCd);
	}
	
	@ResponseBody
	@PostMapping("/empSmsList")
	public List<SmsVO> empSmsList() {
		return sService.empSmsList();
	}
}
