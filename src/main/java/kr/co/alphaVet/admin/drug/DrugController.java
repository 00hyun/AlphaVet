package kr.co.alphaVet.admin.drug;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vo.DrugVO;

@Controller
@RequestMapping("/drug")
public class DrugController {

	@Inject
	DrugService dService;
	
	@ResponseBody
	@PostMapping(value="/list")
	public List<DrugVO> drugList(){
		return dService.drugList();
	}
}
