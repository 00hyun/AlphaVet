package kr.co.alphaVet.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ZoomController {

	@GetMapping("/zoom")
	public String showZoom() {
		return "CDN/index";
	}
	@GetMapping("/zoom2")
	public String showZoom2() {
		return "CDN/meeting";
	}
}
