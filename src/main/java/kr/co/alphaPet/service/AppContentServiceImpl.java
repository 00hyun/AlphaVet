package kr.co.alphaPet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.AppCommentMapper;
import kr.co.mapper.AppContentMapper;
import kr.co.vo.AppCommentVO;
import kr.co.vo.AppLikeVO;
import kr.co.vo.PetBoardVO;

@Service
public class AppContentServiceImpl implements IAppContentService {

	@Autowired
	private AppContentMapper appContentMapper;

	@Autowired
	private AppCommentMapper appCommentMapper;
	
	@Override
	public List<PetBoardVO> appContentList(String abType){
		return appContentMapper.appContentList(abType);
	}

	@Override
	public PetBoardVO contentRead(int abNm) {
		PetBoardVO petBoardVO = appContentMapper.contentRead(abNm);
		return petBoardVO;
	}

	@Override
	public List<AppCommentVO> commentList(int abNm) {
		return appCommentMapper.commentList(abNm);
	}

	@Override
	public int registerComment(AppCommentVO appcommentVO) {
		appCommentMapper.registerComment(appcommentVO);
		return appContentMapper.cntUp(appcommentVO.getAbNm());
	}

	@Override
	public int modifyComment(AppCommentVO appcommentVO) {
		return appCommentMapper.modifyComment(appcommentVO);
	}

	@Override
	public int deleteComment(AppCommentVO appcommentVO) {
		appCommentMapper.deleteComment(appcommentVO);
		return appContentMapper.cntDown(appcommentVO.getAbNm());
	}

	@Override
	public int registerLike(AppLikeVO applikeVO) {
		appContentMapper.registerLike(applikeVO);
		return appContentMapper.likeCntUp(applikeVO.getAbNm());
	}

	@Override
	public int deleteLike(AppLikeVO applikeVO) {
		appContentMapper.deleteLike(applikeVO);
		return appContentMapper.likeCntDown(applikeVO);
	}

	@Override
	public int stayLike(AppLikeVO applikeVO) {
		return appContentMapper.stayLike(applikeVO);
	}

	@Override
	public int cntHitUp(int abNm) {
		return appContentMapper.cntHitUp(abNm);
	}


}
