package kr.co.alphaVet.myhome.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.activation.FileDataSource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.MidiDevice.Info;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import kr.co.alphaVet.myhome.service.AddressService;
import kr.co.alphaVet.myhome.service.MailService;
import kr.co.alphaVet.myhome.service.MypageService;
import kr.co.vo.EmpVO;
import kr.co.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailController {

	@Inject
	private MailService service;
	
	@Inject
	private AddressService addressService;
	
	@Inject
	private JavaMailSenderImpl mailSender;

	String uploadPath = "C:\\upload\\";
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	@ResponseBody
	public String mailSending(MailVO mailVO, HttpServletRequest req) throws Exception {
		
		ServletContext  sc = req.getSession().getServletContext();  // ContextPath
		String realPath = sc.getRealPath("/resources/images/mailFile");
		mailVO.getFile().transferTo(new File(realPath + "\\" + mailVO.getFile().getOriginalFilename()));
		mailVO.getFile().transferTo(new File(uploadPath + "\\" + mailVO.getFile().getOriginalFilename()));
		mailVO.setMfPath("/resources/images/mailFile/" + mailVO.getFile().getOriginalFilename());
		mailVO.setMfName(mailVO.getFile().getOriginalFilename());
		
		MimeMessage msg = mailSender.createMimeMessage();
		
		MimeMessageHelper message = new MimeMessageHelper(msg, true, "UTF-8");
		
		String empId = mailVO.getEmpId();
		EmpVO empVO = addressService.selectEmp(empId);
		
		message.setFrom(empVO.getEmpMail());  //보내는 사람
		message.setTo(mailVO.getToMail());  //받는 사람
		message.setSubject(mailVO.getMailTitle());
		message.setText(mailVO.getMailCon(), true);
		
//		log.debug("오리진파일내임 : " + mailVO.getFile().getOriginalFilename());
		FileDataSource fds = new FileDataSource(uploadPath+mailVO.getFile().getOriginalFilename());
		message.addAttachment(MimeUtility.encodeText(mailVO.getFile().getOriginalFilename(), "UTF-8", "B"), fds);
		
		mailSender.send(msg);

		log.debug("mailVO ::: " + mailVO);
		service.insertMail(mailVO);

		return "mailSuccess";
	}
	
	@PostMapping("/mailList")
	@ResponseBody
	public List<MailVO> mailList(String empId){
		List<MailVO> mailList = service.selectMailList(empId);
		log.debug("mailList :: "+ mailList);
		return mailList;
	} 
	
	@PostMapping("/mailDetail")
	@ResponseBody
	public MailVO mailDetail(MailVO vo){
		MailVO mailVO = service.selectMail(vo);
		log.debug("mailVO :: " + mailVO);
		
		return mailVO;
	} 
	
	@PostMapping("/mailDelete")
	@ResponseBody
	public void mailDelete(int mailNm){
		service.mailDelete(mailNm);
	} 
	
	
	
}
