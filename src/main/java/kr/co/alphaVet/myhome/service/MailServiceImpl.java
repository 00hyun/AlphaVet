package kr.co.alphaVet.myhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.MailMapper;
import kr.co.vo.MailVO;

@Service
public class MailServiceImpl implements MailService {

	@Inject
	private MailMapper mapper;
	
	@Override
	public void insertMail(MailVO mailVO) {
		mapper.insertMail(mailVO);
	}

	@Override
	public List<MailVO> selectMailList(String empId) {
		return mapper.selectMailList(empId);
	}

	@Override
	public MailVO selectMail(MailVO vo) {
		return mapper.selectMail(vo.getMailNm());
	}

	@Override
	public void mailDelete(int mailNm) {
		mapper.mailDelete(mailNm);
	}

}
