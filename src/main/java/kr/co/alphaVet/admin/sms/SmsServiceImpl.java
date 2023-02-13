package kr.co.alphaVet.admin.sms;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.SmsVO;
import kr.common.CommonDao;

@Service
public class SmsServiceImpl implements SmsService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<SmsVO> smsList() {
		return commonDao.selectList("SmsMapper_smsList", "h001");
	}

	@Override
	public int insertSms(SmsVO smsVO) {
		return commonDao.insert("SmsMapper_insertSms", smsVO);
	}

	@Override
	public int updateSms(SmsVO smsVO) {
		return commonDao.update("SmsMapper_updateSms", smsVO);
	}

	@Override
	public int delete(String smsCd) {
		return commonDao.delete("SmsMapper_deleteSms", smsCd);
	}

	@Override
	public List<SmsVO> empSmsList() {
		return commonDao.selectList("SmsMapper_empSmsList");
	}

}
