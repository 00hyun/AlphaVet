package kr.co.alphaVet.Home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.HomeMapper;
import kr.co.vo.EmpVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	private HomeMapper mapper;
	
	@Override
	public EmpVO selectDoctor(String empId) throws Exception {
		return mapper.selectDoctor(empId);
	}

	
}
