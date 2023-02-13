package kr.co.alphaVet.medic.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.alphaVet.medic.service.MedicTestService;
import kr.co.vo.PraImgVO;
import kr.co.vo.PraVO;

@Controller
public class MedicTestController {
	
	@Inject
	private MedicTestService mService;
	
	@GetMapping("/medicTest")
	public String medicTest(String recNm, Model model) throws Exception {
		
		String praCd = mService.selectPraCd(recNm);
		model.addAttribute("praCd", praCd);

		PraImgVO praImgVO = mService.selectPraImg(praCd);
		model.addAttribute("praImgVO", praImgVO);
		
		return "medicTest";
	}
	
	@ResponseBody
	@PostMapping("/insertPraImgs")
	public int insertPraImgs(PraImgVO praImgVO, HttpServletRequest req) throws Exception {
		System.out.print(praImgVO.toString());
		
		ServletContext  sc = req.getSession().getServletContext();  // ContextPath
		String realPath = sc.getRealPath("/resources/images/praImgs");
		
		if(praImgVO.getPraImgFile1() != null && praImgVO.getPraImgFile1().toString() != "") {
			System.out.println("안빔");
			praImgVO.getPraImgFile1().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile1().getOriginalFilename()));
			praImgVO.setPraImg1("/resources/images/praImgs/" +praImgVO.getPraImgFile1().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile2() != null && praImgVO.getPraImgFile2().toString() != "") {
			System.out.println("안빔");
			praImgVO.getPraImgFile2().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile2().getOriginalFilename()));
			praImgVO.setPraImg2("/resources/images/praImgs/" +praImgVO.getPraImgFile2().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile3() != null && praImgVO.getPraImgFile3().toString() != "") {
			System.out.println("안빔");
			praImgVO.getPraImgFile3().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile3().getOriginalFilename()));
			praImgVO.setPraImg3("/resources/images/praImgs/" +praImgVO.getPraImgFile3().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile4() != null && praImgVO.getPraImgFile4().toString() != "") {
			System.out.println("안빔");
			praImgVO.getPraImgFile4().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile4().getOriginalFilename()));
			praImgVO.setPraImg4("/resources/images/praImgs/" +praImgVO.getPraImgFile4().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile5() != null && praImgVO.getPraImgFile5().toString() != "") {
			praImgVO.getPraImgFile5().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile5().getOriginalFilename()));
			praImgVO.setPraImg5("/resources/images/praImgs/" +praImgVO.getPraImgFile5().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile6() != null && praImgVO.getPraImgFile6().toString() != "") {
			praImgVO.getPraImgFile6().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile6().getOriginalFilename()));
			praImgVO.setPraImg6("/resources/images/praImgs/" +praImgVO.getPraImgFile6().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile7() != null && praImgVO.getPraImgFile7().toString() != "") {
			praImgVO.getPraImgFile7().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile7().getOriginalFilename()));
			praImgVO.setPraImg7("/resources/images/praImgs/" +praImgVO.getPraImgFile7().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile8() != null && praImgVO.getPraImgFile8().toString() != "") {
			praImgVO.getPraImgFile8().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile8().getOriginalFilename()));
			praImgVO.setPraImg8("/resources/images/praImgs/" +praImgVO.getPraImgFile8().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile9() != null && praImgVO.getPraImgFile9().toString() != "") {
			praImgVO.getPraImgFile9().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile9().getOriginalFilename()));
			praImgVO.setPraImg9("/resources/images/praImgs/" +praImgVO.getPraImgFile9().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile10() != null && praImgVO.getPraImgFile10().toString() != "") {
			praImgVO.getPraImgFile10().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile10().getOriginalFilename()));
			praImgVO.setPraImg10("/resources/images/praImgs/" +praImgVO.getPraImgFile10().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile11() != null && praImgVO.getPraImgFile11().toString() != "") {
			praImgVO.getPraImgFile11().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile11().getOriginalFilename()));
			praImgVO.setPraImg11("/resources/images/praImgs/" +praImgVO.getPraImgFile11().getOriginalFilename());
		}
		
		if(praImgVO.getPraImgFile12() != null && praImgVO.getPraImgFile12().toString() != "") {
			praImgVO.getPraImgFile12().transferTo(new File(realPath + "/" + praImgVO.getPraImgFile12().getOriginalFilename()));
			praImgVO.setPraImg12("/resources/images/praImgs/" +praImgVO.getPraImgFile12().getOriginalFilename());
		}
		
		mService.insertPraImgs(praImgVO);

		return 1;
	}
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("/getPraHistoryDetail")
	public PraVO getPraHistoryDetail(String recNm) throws Exception {
		System.out.println("접수번호 : " + recNm);
		
		PraVO praVO = new PraVO();
		
		praVO = mService.getPraHistoryDetail(recNm);
		
		return praVO;
	}
}
