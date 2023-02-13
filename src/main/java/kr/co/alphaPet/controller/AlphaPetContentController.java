package kr.co.alphaPet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaPet.service.IAppContentService;
import kr.co.vo.AppCommentVO;
import kr.co.vo.AppLikeVO;
import kr.co.vo.PetBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AlphaPetContentController {

	
	@Autowired
	private IAppContentService service;
	
	//펫과사전 목록
	@GetMapping("/content")
	public String appContentList(String abType, Model model) {
		log.debug("abType:" + abType);
		model.addAttribute("appContentList",service.appContentList(abType));
		return "alphaPet/appContent";
	}

	//펫과사전 상세보기, 댓글리스트, 좋아요 눌렸으면 하트 채우기, 조회수 증가
	@GetMapping("/contentRead")
	public String appContentRead(int abNm, Model model, HttpServletRequest request) {
		//조회수 증가(게시판번호로 넘기기)
		service.cntHitUp(abNm);
		// 펫과사전 상세보기		
		log.debug("abNm:"+abNm);
		model.addAttribute("contentRead",service.contentRead(abNm));
		// 본글과 댓글을 끌어오도록 하자.
		model.addAttribute("commentList", service.commentList(abNm));
		// model 에 좋아요 눌렀는지 체크 여부를 담는다. cnt값이나 1일때 ok 등에 담겨서 read로.
		AppLikeVO applikeVO = new AppLikeVO();
		applikeVO.setUserId(""+request.getSession().getAttribute("userId"));
		applikeVO.setAbNm(abNm);
		model.addAttribute("stayLike", service.stayLike(applikeVO));
		log.debug("stayLike:"+service.stayLike(applikeVO));
		return "alphaPet/content/appContentRead";
	}
	

	//댓글등록
	@PostMapping("/registerComment")
	public String appRegisterComment(AppCommentVO appcommentVO, Model model, HttpServletRequest request) {
		appcommentVO.setUserId((String)request.getSession().getAttribute("userId"));
		log.debug("appcommentVO:"+appcommentVO);
		//appcommentVO를 서비스로 넘겨주면 된다.
		service.registerComment(appcommentVO);
//		service.cntUp(appcommentVO.getAbNm()); //AppContentServiceImpl 참고
		return "redirect:/contentRead?abNm="+appcommentVO.getAbNm();
	}
	
	//댓글수정
	@PostMapping("/modifyComment")
	@ResponseBody
	public String appModifyComment(@RequestBody AppCommentVO appcommentVO, HttpServletRequest request) {
		appcommentVO.setUserId((String)request.getSession().getAttribute("userId"));
		// jsp에서 ajax에서 같은 아이디인지 확인. jsp에서 session userId를 보내야함
		log.debug("appcommentVO:"+appcommentVO);
		int cnt = service.modifyComment(appcommentVO);
		if (cnt>0) {
			return "OK";
		}
		return "NG";
	}
	
	//댓글삭제
	@PostMapping("/removeComment")
	@ResponseBody
	public String appDeleteComment(@RequestBody AppCommentVO appcommentVO, HttpServletRequest request) {
		appcommentVO.setUserId((String)request.getSession().getAttribute("userId"));
		log.debug("appcommentVO:"+appcommentVO);
		int cnt = service.deleteComment(appcommentVO);
		if(cnt>0) {
			return "OK";
		}
		return "NG";
	}
	
	//LikeVO의 게시글번호, userId 이용. 좋아요 등록되어 있으면 좋아요 눌렀을 때 -1, 좋아요 등록 안되어있으면 +1
	//게시글 테이블에 좋아요수 업데이트
	
	//좋아요 등록
	@PostMapping("/appCountLikeUp")
	@ResponseBody
	public String countLikeUp(@RequestBody AppLikeVO applikeVO, HttpServletRequest request) {
		applikeVO.setUserId((String)request.getSession().getAttribute("userId"));
		log.debug("applikeVO:"+applikeVO);

//		service.likeCntUp(applikeVO.getAbNm()); //AppContentServiceImpl 참고
		int cnt = service.registerLike(applikeVO);
		if(cnt>0) {
			return "OK";
		}
		return "NG";
	}

	//좋아요 취소
	@PostMapping("/appCountLikeDown")
	@ResponseBody
	public String countLikeDown(@RequestBody AppLikeVO applikeVO, HttpServletRequest request) {
		applikeVO.setUserId((String)request.getSession().getAttribute("userId"));
		log.debug("applikeVO:"+applikeVO);
//		service.likeCntDown(applikeVO.getAbNm()); //AppContentServiceImpl 참고
		int cnt = service.deleteLike(applikeVO);
		if(cnt > 0) {
			return "OK";
		}
		return "NG";
	}
	
}