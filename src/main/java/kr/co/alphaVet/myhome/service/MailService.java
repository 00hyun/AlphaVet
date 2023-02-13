package kr.co.alphaVet.myhome.service;

import java.util.List;

import kr.co.vo.MailVO;

public interface MailService {

	void insertMail(MailVO mailVO);

	List<MailVO> selectMailList(String empId);

	MailVO selectMail(MailVO vo);

	void mailDelete(int mailNm);

}
