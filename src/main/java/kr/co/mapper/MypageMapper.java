package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.AlarmVO;
import kr.co.vo.BoardVO;
import kr.co.vo.EmpMemoVO;
import kr.co.vo.ReplyVO;

@Mapper
public interface MypageMapper {

	public void insertBoard(BoardVO boardVO);

	public BoardVO selectBoard(int boNm);

	public List<BoardVO> selectNoticeList(String noticeCd);

	public List<BoardVO> selectGyeongjosaList(String gyeongjosaCd);

	public List<BoardVO> selectComplainList(String complainCd);

	public List<BoardVO> selectAcademicList(String academicCd);

	public BoardVO selectBoard2(BoardVO boardVO);

	public void deleteBoard(int boNm);

	public void insertReply(ReplyVO replyVO);

	public List<ReplyVO> replyList(ReplyVO replyVO);
	
	List<BoardVO> newBoardList();

	public void memoInsert(EmpMemoVO empMemoVO);

	public List<EmpMemoVO> memoList(String empId);

	public void memoDelete(int empMemoNm);

	public void memoCheckUpdate(EmpMemoVO empMemoVO);

	public List<AlarmVO> alarmList(String empId);

	public void updateBoard(int boNm);

	
}
