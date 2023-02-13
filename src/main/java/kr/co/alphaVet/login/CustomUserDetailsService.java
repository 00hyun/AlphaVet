package kr.co.alphaVet.login;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.mapper.EmployeesMapper;
import kr.co.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private EmployeesMapper eMapper;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		log.debug("username : " + username);
		
		EmpVO empVO = eMapper.selectEmp(username);

		return empVO == null ? null : new CustomUser(empVO);
	}

}
