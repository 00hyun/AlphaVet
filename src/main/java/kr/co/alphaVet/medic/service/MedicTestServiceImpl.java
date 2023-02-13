package kr.co.alphaVet.medic.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.PraImgVO;
import kr.co.vo.PraVO;
import kr.common.CommonDao;

@Service
public class MedicTestServiceImpl implements MedicTestService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public String selectPraCd(String recNm) throws Exception {
		return commonDao.select("PraMapper_selectPraCd", recNm);
	}

	@Override
	public void insertPraImgs(PraImgVO praImgVO) throws Exception {
		commonDao.insert("PraMapper_insertPraImgs", praImgVO);
	}

	@Override
	public PraVO getPraHistoryDetail(String recNm) throws Exception {
		return commonDao.select("PraMapper_getPraHistoryDetail", recNm);
	}

	@Override
	public PraImgVO selectPraImg(String praCd) throws Exception {
		return commonDao.select("PraMapper_selectPraImg", praCd);
	}

}
