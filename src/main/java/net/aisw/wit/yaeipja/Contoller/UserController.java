package net.aisw.wit.yaeipja.Contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.aisw.wit.yaeipja.Service.userService;
import net.aisw.wit.yaeipja.dto.userDTO;

@Controller
public class UserController {

	@Autowired
	private userService userService;

	@GetMapping("/login")
	public String getLoginPage() {
		return "user/login";
	}
	
	@GetMapping("/signup")
	public String getSignupPage() {
		return "user/signup";
	}
	
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam("id") String id) {
		userDTO user = new userDTO();
		user.setId(id);
		
		int result = userService.getUserID(user);
		
		if (result > 0) {
			return "duplicate"; // 중복된 아이디
		} else {
			return "available"; // 사용 가능한 아이디
		}
	}
	
	// 회원가입 처리
	@PostMapping("/signup")
	public String signup(userDTO user) {
		try {
			// 아이디 중복 확인
			int duplicateCheck = userService.getUserID(user);
			if (duplicateCheck > 0) {
				return "redirect:/signup?error=duplicate";
			}
			
			// 회원가입 처리
			int result = userService.signup(user);
			
			if (result > 0) {
				return "redirect:/login?success=signup";
			} else {
				return "redirect:/signup?error=fail";
			}
		} catch (Exception e) {
			return "redirect:/signup?error=exception";
		}
	}
}
