package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.MemberVO;

@Mapper
public interface MemberMapper {

	public MemberVO selectMember(String memId) throws Exception;

}
