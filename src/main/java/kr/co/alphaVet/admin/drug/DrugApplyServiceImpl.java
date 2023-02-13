package kr.co.alphaVet.admin.drug;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.DrugApplyMapper;
import kr.co.vo.DaDetailVO;
import kr.co.vo.DrugApplyVO;
import kr.common.CommonDao;

@Service
public class DrugApplyServiceImpl implements DrugApplyService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Inject
	DrugApplyMapper dMapper;
	
	@Override
	public List<DrugApplyVO> daList(Map<String, Object> dataMap) {
		return dMapper.daList(dataMap);
	}

	@Override
	public List<DaDetailVO> daDetail(int daNm) throws Exception {
		return commonDao.selectList("DrugApplyMapper_daDetail", daNm);
	}

	@Override
	public int insertDa(List<DaDetailVO> daDetailList) throws Exception {
		
		int sum = 0;
		for(DaDetailVO vo : daDetailList) {
			sum += (vo.getDaDtAmount() * vo.getDrugCostPrice());
		}
		DrugApplyVO drugApplyVO = new DrugApplyVO();
		drugApplyVO.setDaPrice(sum);
		
		int cnt = commonDao.insert("DrugApplyMapper_insertDa", drugApplyVO);
		
		if(cnt>0) {
			for(DaDetailVO daDetailVO : daDetailList) {
				daDetailVO.setDaNm(drugApplyVO.getDaNm());
				cnt += commonDao.insert("DrugApplyMapper_insertDaDt", daDetailVO);
			}
		}
		
		return cnt;
	}

	@Override
	public int updateDaDtCheck(List<DaDetailVO> daDetailList) throws Exception {
		for(DaDetailVO daDetailVO : daDetailList) {
			commonDao.update("DrugApplyMapper_updateDaDtCheck", daDetailVO);
			if(daDetailVO.getDaDtCheck().equals("Y")) {
				commonDao.update("DrugMapper_updateAmount", daDetailVO);
			}
		}
		
		int cnt = commonDao.select("DrugApplyMapper_countDaDTStateN", daDetailList.get(0).getDaNm());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("daNm", ""+daDetailList.get(0).getDaNm());
		map.put("daState", "N");
		
		if(cnt == 0) {
			map.put("daState", "Y");
			cnt = commonDao.update("DrugApplyMapper_updateDaState", map);
		}else {
			cnt = commonDao.update("DrugApplyMapper_updateDaState", map);
		}
		
		return cnt;
	}

}
