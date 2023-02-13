package kr.co.alphaPet.service;

import kr.co.vo.UserVO;

public interface IAppUserService {
	
	public String userCheck(String usdrId);
	
	public void appJoin(UserVO userVO) throws Exception;
		
	
}
