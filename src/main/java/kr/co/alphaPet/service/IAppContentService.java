package kr.co.alphaPet.service;

import java.util.List;

import kr.co.vo.AppCommentVO;
import kr.co.vo.AppLikeVO;
import kr.co.vo.PetBoardVO;

public interface IAppContentService {

	public List<PetBoardVO> appContentList(String abType);
	public PetBoardVO contentRead(int abNm);
	public List<AppCommentVO> commentList(int abNm);
	public int registerComment(AppCommentVO appcommentVO);
	public int modifyComment(AppCommentVO appcommentVO);
	public int deleteComment(AppCommentVO appcommentVO);
	public int registerLike(AppLikeVO applikeVO);
	public int deleteLike(AppLikeVO applikeVO);
	public int stayLike(AppLikeVO applikeVO);
	public int cntHitUp(int abNm);


}
