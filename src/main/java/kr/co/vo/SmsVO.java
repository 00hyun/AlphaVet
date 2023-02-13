package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SmsVO {
	private String smsCd;
	private String smsTitle;
	private String smsContent;
	private String smsType;
	private String cliCd;
}
