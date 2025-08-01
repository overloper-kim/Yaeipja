package net.aisw.wit.yaeipja.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String GetIndex() {
		System.out.println("index 컨트롤러 실행");
		return "index";
	}
}
