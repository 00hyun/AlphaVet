package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.AppLikeVO;
import kr.co.vo.PetBoardVO;

@Mapper
public interface AppContentMapper {

	public List<PetBoardVO> appContentList(String abType);
	public PetBoardVO contentRead(int abNm);
	public int likeUp(int abLikeCnt);
	public int cntUp(int abNm);
	public int cntDown(int abNm);
	public int registerLike(AppLikeVO applikeVO);
	public int deleteLike(AppLikeVO applikeVO);
	public int likeCntUp(int abNm);
	public int stayLike(AppLikeVO applikeVO);
	public int likeCntDown(AppLikeVO applikeVO);
	public int cntHitUp(int abNm);

}
