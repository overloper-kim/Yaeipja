package net.aisw.wit.yaeipja.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	@GetMapping("/")
	@ResponseBody
	public String GetIndex() {
		System.out.println("index 컨트롤러 실행");
		return "Hello SpringBoot~!";
	}
}
