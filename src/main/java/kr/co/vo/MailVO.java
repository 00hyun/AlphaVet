package kr.co.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MailVO {
	private int mailNm;
	private String empId;
	private String toMail;  //받는 사람 이메일 주소
	private String mailTitle;
	private String mailCon;
	private String mailDate;
	private int mailReceiver;
	
	private MultipartFile file;
	
	private int mfNm;
	private String mfName;
	private String mfPath;
	private String mfSize;
	private String mfType;
	
	private String empJob;
	private String empName;
	private String empProfile;
	private String empMail;
	
}