package kr.co.alphaVet.admin.drug;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.mapper.DrugMapper;
import kr.co.vo.DrugVO;
import kr.common.CommonDao;

@Service
public class DrugServiceImpl implements DrugService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Inject
	DrugMapper dMapper;

	@Override
	public List<DrugVO> drugList() {
		return commonDao.selectList("DrugMapper_drugListOrderByAmount");
	}
	
}
