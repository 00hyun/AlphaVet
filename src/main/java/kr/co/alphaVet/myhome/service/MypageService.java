package kr.co.alphaVet.myhome.service;

import java.util.List;

import kr.co.vo.AlarmVO;
import kr.co.vo.BoardVO;
import kr.co.vo.EmpMemoVO;
import kr.co.vo.ReplyVO;

public interface MypageService {

	void insertBoard(BoardVO boardVO);

	BoardVO selectBoard(int boNm);

	List<BoardVO> selectNoticeList(String noticeCd);

	List<BoardVO> selectGyeongjosaList(String gyeongjosaCd);

	List<BoardVO> selectComplainList(String complainCd);

	List<BoardVO> selectAcademicList(String academicCd);

	BoardVO selectBoard2(BoardVO boardVO);

	void deleteBoard(int boNm);

	void insertReply(ReplyVO replyVO);

	List<ReplyVO> replyList(ReplyVO replyVO);

	List<BoardVO> newBoardList();

	void memoInsert(EmpMemoVO empMemoVO);  //insert

	List<EmpMemoVO> memoList(String empId);  //selectList

	void memoDelete(int empMemoNm);  //delete

	void memoCheckUpdate(EmpMemoVO empMemoVO);  //위젯여부

	List<AlarmVO> alarmList(String empId);  //알람

	String academicPapago(String selectTo, String selectFrom, String changeData);  //번역

	void updateBoard(int boNm);  //게시판 댓글 수 +1


}
