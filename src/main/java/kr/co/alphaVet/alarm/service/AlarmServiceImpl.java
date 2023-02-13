package kr.co.alphaVet.alarm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.AlarmVO;
import kr.common.CommonDao;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Resource(name="commonDao")
	private CommonDao commonDao;

	@Override
	public int insertAlart(AlarmVO alarmVO) {
		return commonDao.insert("AlarmMapper_insertAlarm", alarmVO);
	}

	@Override
	public List<AlarmVO> alarmList(String empId) {
		return commonDao.selectList("AlarmMapper_alarmList", empId);
	}

	@Override
	public int alarmUncheckCnt(String empId) throws Exception {
		return commonDao.select("AlarmMapper_alarmUncheckCnt", empId);
	}

	@Override
	public void checkAlarm(String empId) throws Exception {
		commonDao.update("AlarmMapper_checkAlarm", empId);
	}
}
