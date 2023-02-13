package kr.co.alphaVet.admin.chart;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;

@Service
public class ChartServiceImpl implements ChartService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<Map<String, Object>> animalTypeCnt(Map<String, Object> dataMap) throws Exception {
		return commonDao.selectList("chartMapper_animalTypeCnt", dataMap);
	}

	@Override
	public List<Map<String, Object>> daysPayment(Map<String, Object> dataMap) throws Exception {
		return commonDao.selectList("chartMapper_daysPayment", dataMap);
	}

	@Override
	public List<Map<String, Object>> daysPra(Map<String, Object> dataMap) throws Exception {
		return commonDao.selectList("chartMapper_daysPra", dataMap);
	}

	@Override
	public List<Map<String, Object>> drugCnt(Map<String, Object> dataMap) throws Exception {
		return commonDao.selectList("chartMapper_drugCnt", dataMap);
	}
	
	@Override
	public List<Map<String, Object>> praCntByEmp(Map<String, Object> dataMap) throws Exception {
		return commonDao.selectList("chartMapper_praCntByEmp", dataMap);
	}
	
}
