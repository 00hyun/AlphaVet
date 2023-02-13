package kr.co.mapper;

import java.util.List;

import kr.co.vo.AddressVO;

public interface MyInfoMapper {
	
	//업무
	void updateCurrent(String empId);
	
	//자리비움
	void updateCurrent2(String empId);

}
