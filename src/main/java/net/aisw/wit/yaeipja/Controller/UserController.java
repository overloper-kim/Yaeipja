package net.aisw.wit.yaeipja.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.aisw.wit.yaeipja.Service.UserService;
import net.aisw.wit.yaeipja.dto.UserDTO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String getLoginPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("logged") == null) {
			return "user/login";
		} else {
			System.out.println("이미 로그인함");

			return "index";
		}
	}

	@PostMapping("/login")
	@ResponseBody
	public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest request) {
		try {
			UserDTO user= new UserDTO();
			user.setId(id);
			user.setPw(pw);
			System.out.println(user.toString());

			int result = userService.login(user);
			System.out.println(result);

			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("logged", user);
				session.setMaxInactiveInterval(30 * 60);

				return "success";
			} else {
				return "none";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "exeption";
		}
	}

	@GetMapping("/signup")
	public String getSignupPage() {
		return "user/signup";
	}

	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam("id") String id) {
		UserDTO user = new UserDTO();
		user.setId(id);

		int result = userService.getUserID(user);

		if (result > 0) {
			return "duplicate";
		} else {
			return "available";
		}
	}

	// AJAX로 회원가입 처리
	@PostMapping("/signup")
	@ResponseBody
	public String signup(@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("nickname") String nickname, @RequestParam("phone") String phone,
			@RequestParam(value = "address", required = false) String address, @RequestParam("sex") String sex,
			@RequestParam(value = "height", required = false) String height,
			@RequestParam(value = "weight", required = false) String weight) {
		try {
			UserDTO user = new UserDTO();
			user.setId(id);
			user.setPw(pw);
			user.setNickname(nickname);
			user.setPhone(phone);
			user.setAddress(address);
			user.setSex(sex);
			user.setHeight(height);
			user.setWeight(weight);

			System.out.println("받은 유저 정보: " + user.toString());

			// 아이디 중복 확인
			int duplicateCheck = userService.getUserID(user);
			if (duplicateCheck > 0) {
				return "duplicate";
			}

			// 회원가입 처리
			int result = userService.signup(user);

			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/login";
	}
}