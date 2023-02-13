package kr.co.alphaVet.test.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.alphaVet.test.service.TestService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediTest")
public class TestController {
	@Inject
	TestService service;
	
	@GetMapping("/medicTest")
	   public String medicTest() throws Exception {
		   
		   return "/medicTest";
	   }
	
	@GetMapping("/fileSelect")
	public String fileSelect() {
		return "professor/fileup";
	}
	
	@PostMapping("/fileUp")
	@ResponseBody
	public String fileUp(MultipartFile file, HttpServletRequest request) throws Exception {
		log.debug("aaa"+ file.getOriginalFilename());
		log.debug("aaa"+ file.getSize());
		
		String originalName = file.getOriginalFilename();
		
		// 절대경로 구하기
		ServletContext servletContext = request.getSession().getServletContext();
		
		String realPath = servletContext.getRealPath("/resources/assets/images/testPhoto");
		// realPath 결과값
		// => D:\A_TeachingMaterial\08_Framework\02.SPRING2\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\University_ProjectTest2\resources\profile
		
	
		log.debug("궁금쓰.. 얘가 뭔데.. 도대체.." + servletContext.getContextPath());		// 얘는 안뜨네..
		log.debug("궁금쓰.. 얘가 뭔데.. 도대체..22" + servletContext.getRealPath("/resources/assets/images/testPhoto"));		// 얘는 D:\부터 시작해서 실제 경로
		
		// 일단 랜덤문자열 생성
		String uuid = UUID.randomUUID().toString();
		
		// 내가 저장하고싶은 파일 이름. 겹치면 안되니까 위에서 생성한 uuid 랜덤값에 오리지널네임 붙여서 만들기!
		String saveFileName = uuid + "_" + originalName;
		
		// 파일패스는 나중에 <img src="여기!!!">서 꺼내 쓸 경로). 위에서 새로만든 saveFileName으로 만들고, 이걸 디비에 올려야해!
		String filePath = servletContext.getContextPath() + "/resources/assets/images/testPhoto" + saveFileName;
		
		// db에 경로 저장. 경로로 꺼내서 쓸거니까.
		int cnt = service.insertProfileImg(filePath);
		
		// 실제경로의 d드라이브 a티칭 어쩌구 거기에  폴더 객체
		File dir = new File(realPath);
		
		// dir 없으면 만들어라
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// 이름이 겹치면 안되니까, 그리고 디비에 올린거랑 똑같은 이름인게 꺼내져야 하니까. a_teaching 어쩌구에 생성한 폴더에 아까 uuid로 만든 saveFileName을 가진 파일 객체를 생성할거야. 그 객체는
		File photoFile = new File(realPath + "/" + saveFileName);
		//여기서 저장돼. minji라고 전송된(받은 파일)을 랜덤이름값으로 복사해서 실제 경로에 저장할거야.
		file.transferTo(photoFile);
		// 얘는 실제 경로에 파일 생성해서 저장할 애. d드라이브 A_Teaching 블라블라~~ 그 경로에 실제로 저장.
		// realPath = D:\A_TeachingMaterial\08_Framework\02.SPRING2\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\University_ProjectTest2\resources\profile
		
		if(cnt > 0 ) {
			
			return "OK";
		}

		return "NG";
	}

	@ResponseBody
	@GetMapping(value = "/fileDisplay")
	public List<Map<String, String>> fileDisplay() throws Exception {
		
		List<Map<String, String>> imgMap = service.selectFile();
		
		return imgMap;
		
	}
	
	
}
