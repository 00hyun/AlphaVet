package kr.co.alphaVet.medic.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.OrderDetailVO;
import kr.co.vo.OrdersetVO;
import kr.common.CommonDao;

@Service
public class MedicOrderServiceImpl implements MedicOrderService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public int insertOrderset(OrdersetVO ordersetVO, List<OrderDetailVO> orderDetailList) {
		 int cnt = commonDao.insert("ordersetMapper_insertOrderset", ordersetVO);
		 
		 if(cnt > 0) {
			 for(OrderDetailVO orderDetailVO : orderDetailList) {
				 orderDetailVO.setOrderNm(ordersetVO.getOrderNm());
				 
				 cnt += commonDao.insert("ordersetMapper_insertOrderDetail", orderDetailVO);
			 }
		 }
		 
		 return cnt;
	}

	@Override
	public List<OrdersetVO> selectOrderSetList(String empId) throws Exception {
		return commonDao.selectList("ordersetMapper_selectOrderSetList", empId);
	}

	
}
