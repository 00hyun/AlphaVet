package kr.co.mapper;

import java.util.List;

import kr.co.vo.MailVO;

public interface MailMapper {

	void insertMail(MailVO mailVO);

	List<MailVO> selectMailList(String empId);

	MailVO selectMail(int mailNm);

	void mailDelete(int mailNm);

}
