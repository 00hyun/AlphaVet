package kr.co.alphaVet.myhome.service;

import java.util.List;

import kr.co.vo.AddressVO;
import kr.co.vo.EmpVO;

public interface AddressService {

	List<EmpVO> selectAdd();

	EmpVO selectEmp(String empId);

	void updateCurrent(String empId, String current);

	List<AddressVO> privateAddressList(String empId);

	void addrUpdate(AddressVO addressVO);

	void addrDelete(int addrNm);

	void addrInsert(AddressVO addressVO);


}
