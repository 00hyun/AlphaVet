package kr.co.alphaVet.myhome.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alphaVet.myhome.service.MypageService;
import kr.co.vo.AlarmVO;
import kr.co.vo.BoardVO;
import kr.co.vo.EmpMemoVO;
import kr.co.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	@Inject
	private MypageService mypageService;
	
	@GetMapping("/myHome")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("alphaVet/myhome/myHome");
		
		return mav;
	}
	
	@PostMapping(value = "/insertBoard", produces = "application/json;charset=UTF-8")  //사용자의 upload 요청을 받는 요청 url
	@ResponseBody  //ajax 요청으로 받겠다는 의미
	public BoardVO insertBoard (HttpServletRequest req, List<MultipartFile> uploadFiles, BoardVO boardVO, Model model) throws IllegalStateException, IOException {
		mypageService.insertBoard(boardVO);

		int boNm = boardVO.getBoNm();
		
		boardVO = mypageService.selectBoard(boNm);
		
		return boardVO;
	}
	
	@PostMapping("/deleteBoard")
	@ResponseBody
	public void deleteBoard(int boNm) {
		mypageService.deleteBoard(boNm);
	}
	
	@PostMapping("/selectBoard")
	@ResponseBody
	public BoardVO selectBoard(BoardVO boardVO) {
		boardVO = mypageService.selectBoard2(boardVO);
		
		return boardVO;
	}
	
	@PostMapping("/noticeBoardList")
	@ResponseBody
	public List<BoardVO> noticeBoardList() {
		String noticeCd = "1";
		List<BoardVO> noticeBoardList = mypageService.selectNoticeList(noticeCd);
		
		return noticeBoardList;
	}
	
	@PostMapping("/gyeongjosaBoardList")
	@ResponseBody
	public List<BoardVO> gyeongjosaBoardList() {
		String gyeongjosaCd = "2";
		List<BoardVO> gyeongjosaBoardList = mypageService.selectGyeongjosaList(gyeongjosaCd);
		
		return gyeongjosaBoardList;
	}

	@PostMapping("/complainBoardList")
	@ResponseBody
	public List<BoardVO> complainBoardList() {
		String complainCd = "3";
		List<BoardVO> complainBoardList = mypageService.selectComplainList(complainCd);
		
		return complainBoardList;
	}
	
	
	@PostMapping("/academicBoardList")
	@ResponseBody
	public List<BoardVO> academicBoardList() {
		String academicCd = "4";
		List<BoardVO> academicBoardList = mypageService.selectAcademicList(academicCd);
		
		return academicBoardList;
	}
	
	
	@PostMapping("/academicPapago")
	@ResponseBody
	public String academicPapago(String selectTo, String selectFrom, String changeData) {
		String data = mypageService.academicPapago(selectTo, selectFrom, changeData);
		
		return data;
	}
	
	
	@PostMapping("/newBoardList")
	@ResponseBody
	public List<BoardVO> newBoardList() {
		List<BoardVO> BoardList = mypageService.newBoardList();
		
		return BoardList;
	}
	
	///댓글
	@PostMapping("/insertReply")
	@ResponseBody
	public String insertReply(ReplyVO replyVO){
		mypageService.insertReply(replyVO);
		mypageService.updateBoard(replyVO.getBoNm());
		return "";
	}
	
	@PostMapping("/replyList")
	@ResponseBody
	public List<ReplyVO> replyList(ReplyVO replyVO){
		List<ReplyVO> replyList = mypageService.replyList(replyVO);
		System.out.println(replyList);
		return replyList;
	}
	
	@PostMapping("/memoInsert")
	@ResponseBody
	public void memoInsert(EmpMemoVO empMemoVO){
		mypageService.memoInsert(empMemoVO);
	}
	
	@PostMapping("/memoList")
	@ResponseBody
	public List<EmpMemoVO> memoList(String empId){
		List<EmpMemoVO> memoList = mypageService.memoList(empId);
		return memoList;
	}
	
	@PostMapping("/memoDelete")
	@ResponseBody
	public void memoDelete(EmpMemoVO empMemoVO){
		int empMemoNm = empMemoVO.getEmpMemoNm();
		mypageService.memoDelete(empMemoNm);
	}
	
	@PostMapping("/memoCheckUpdate")
	@ResponseBody
	public void memoCheckUpdate(EmpMemoVO empMemoVO){
		mypageService.memoCheckUpdate(empMemoVO);
	}
	
	@PostMapping("/myhome/alarmList")
	@ResponseBody
	public List<AlarmVO> alarmList(String empId){
		List<AlarmVO> alarmList = mypageService.alarmList(empId);
		return alarmList;
	}
	
	
	
	
}
