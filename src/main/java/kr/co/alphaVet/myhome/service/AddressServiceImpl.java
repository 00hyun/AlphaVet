package kr.co.alphaVet.myhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.AddressMapper;
import kr.co.mapper.EmployeesMapper;
import kr.co.mapper.MyInfoMapper;
import kr.co.vo.AddressVO;
import kr.co.vo.EmpVO;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Inject
	private EmployeesMapper mapper;
	
	@Inject
	private MyInfoMapper myInfoMapper;
	
	@Inject
	private AddressMapper addressMapper;
	
	@Override
	public List<EmpVO> selectAdd() {
		return addressMapper.empList();
	}

	@Override
	public EmpVO selectEmp(String empId) {
		return mapper.selectEmp(empId);
	}

	@Override
	public void updateCurrent(String empId, String current) {
		if(current.equals("업무")) {
			myInfoMapper.updateCurrent(empId);			
		}else {
			myInfoMapper.updateCurrent2(empId);						
		}
		
	}

	@Override
	public List<AddressVO> privateAddressList(String empId) {
		return addressMapper.privateAddressList(empId);
	}

	@Override
	public void addrUpdate(AddressVO addressVO) {
		addressMapper.addrUpdate(addressVO);
	}

	@Override
	public void addrDelete(int addrNm) {
		addressMapper.addrDelete(addrNm);
	}

	@Override
	public void addrInsert(AddressVO addressVO) {
		addressMapper.addrInsert(addressVO);
	}

}
