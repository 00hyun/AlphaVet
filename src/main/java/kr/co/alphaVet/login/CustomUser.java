package kr.co.alphaVet.login;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.vo.EmpVO;

public class CustomUser extends User {

	private EmpVO empVO;

	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	// 파라미터 : memVO =>
	/*
	 * select a.USER_ID, a.USER_PW, a.USER_NAME, a.COIN, a.REG_DATE, a.UPD_DATE,
	 * a.ENABLED, b.AUTH from MEM a, MEM_AUTH b where a.USER_ID = b.USER_ID and
	 * a.USER_ID=#{username}
	 */
	// return memVO==null?null : new CustomUser(memVO);
	public CustomUser(EmpVO empVO) {
//		public User(String username, String password,
//				Collection<? extends GrantedAuthority> authorities)
//		Java 스트림을 사용할 경우 
//		사용자가 정의한(select한) MemVO 타입의 객체 memVO를
//		스프링 시큐리티의 UserDetailsService 타입으로 변환
//		회웑정보를 보내줄테니 이제부터 스프링이 관리해줘...!

//		memVO.getMemAuthVOList().stream()
//		 .map(auth->new SimpleGrantedAuthority(auth.getAuth()))
//		 .collect(Collectors.toList()
//		);

		super(empVO.getEmpId(), empVO.getEmpPw(), empVO.getEmpAuthVOList()
				.stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getEmpAuthName()))
				.collect(Collectors.toList()));

		this.empVO = empVO;
	}

	public EmpVO getEmpVO() {
		return empVO;
	}

	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}

	@Override
	public String toString() {
		return "CustomUser [empVO=" + empVO + "]";
	}

}
