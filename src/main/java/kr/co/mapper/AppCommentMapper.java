package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.AppCommentVO;

@Mapper
public interface AppCommentMapper {

	public List<AppCommentVO> commentList(int abNm);
	public int registerComment(AppCommentVO appcommentVO);
	public int modifyComment(AppCommentVO appcommentVO);
	public int deleteComment(AppCommentVO appcommentVO);
}
