package kr.co.alphaVet.Home.service;

import kr.co.vo.EmpVO;

public interface HomeService {

	EmpVO selectDoctor(String empId) throws Exception;

}
