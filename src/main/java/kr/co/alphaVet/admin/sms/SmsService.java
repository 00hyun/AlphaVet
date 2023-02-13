package kr.co.alphaVet.admin.sms;

import java.util.List;

import kr.co.vo.SmsVO;

public interface SmsService {
	public List<SmsVO> smsList();
	public int insertSms(SmsVO smsVO);
	public int updateSms(SmsVO smsVO);
	public int delete(String smsCd);
	public List<SmsVO> empSmsList();
}
