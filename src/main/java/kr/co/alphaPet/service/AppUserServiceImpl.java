package kr.co.alphaPet.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.AppJoinMapper;
import kr.co.mapper.AppLoginMapper;
import kr.co.vo.UserVO;

@Service
public class AppUserServiceImpl implements IAppUserService {

	@Inject
	private AppLoginMapper appLoginMapper;
	
	@Autowired
	private AppJoinMapper appJoinMapper;
	
	@Override
	public String userCheck(String usdrId) {
		return appLoginMapper.userCheck(usdrId);
	}
	
	@Override
	public void appJoin(UserVO userVO) throws Exception {
		appJoinMapper.appJoin(userVO);
		
	}
}
