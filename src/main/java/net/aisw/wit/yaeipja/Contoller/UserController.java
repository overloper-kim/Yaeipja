package net.aisw.wit.yaeipja.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/login")
	public String getLoginPage() {
		return "user/login";
	}
	
	@GetMapping("/signup")
	public String getSignupPage() {
		return "user/signup";
	}
}
