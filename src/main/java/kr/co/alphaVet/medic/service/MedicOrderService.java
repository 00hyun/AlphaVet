package kr.co.alphaVet.medic.service;

import java.util.List;

import kr.co.vo.OrderDetailVO;
import kr.co.vo.OrdersetVO;

public interface MedicOrderService {

	int insertOrderset(OrdersetVO ordersetVO, List<OrderDetailVO> orderDetailList);

	List<OrdersetVO> selectOrderSetList(String name) throws Exception;
	
}
