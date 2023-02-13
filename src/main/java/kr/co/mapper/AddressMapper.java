package kr.co.mapper;

import java.util.List;

import kr.co.vo.AddressVO;
import kr.co.vo.EmpVO;

public interface AddressMapper {

	List<AddressVO> privateAddressList(String empId);  //개인 주소록

	void addrUpdate(AddressVO addressVO);  //수정

	void addrDelete(int addrNm);

	void addrInsert(AddressVO addressVO);

	List<EmpVO> empList();

}
