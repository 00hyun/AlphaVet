package kr.co.alphaVet.medic.service;

import kr.co.vo.PraImgVO;
import kr.co.vo.PraVO;

public interface MedicTestService {

	String selectPraCd(String recNm) throws Exception;

	void insertPraImgs(PraImgVO praImgVO) throws Exception;

	PraVO getPraHistoryDetail(String recNm) throws Exception;

	PraImgVO selectPraImg(String praCd) throws Exception;

}
