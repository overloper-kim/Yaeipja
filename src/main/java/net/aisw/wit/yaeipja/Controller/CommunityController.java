package net.aisw.wit.yaeipja.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.aisw.wit.yaeipja.Service.CommunityService;
import net.aisw.wit.yaeipja.dto.CommunityDTO;
import net.aisw.wit.yaeipja.dto.UserDTO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 커뮤니티 목록 페이지
	@GetMapping("/community")
	public String getCommunityList(Model model) {
		List<CommunityDTO> communityList = communityService.getCommunityList();
		model.addAttribute("communityList", communityList);
		return "community/community";
	}

	// 커뮤니티 작성 페이지
	@GetMapping("/community/write")
	public String getCommunityWritePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("logged") == null) {
			return "redirect:/login";
		}
		return "community/comm_write";
	}

	// 커뮤니티 게시글 작성 처리
	@PostMapping("/community/write")
	@ResponseBody
	public String writeCommunity(
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpServletRequest request
	) {
		try {
			HttpSession session = request.getSession();
			UserDTO loggedUser = (UserDTO) session.getAttribute("logged");

			if(loggedUser == null) {
				return "login_required";
			}

			CommunityDTO community = new CommunityDTO();
			community.setTitle(title);
			community.setContent(content);
			community.setAuthor(loggedUser.getId());

			int result = communityService.insertCommunity(community);

			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}

	// 커뮤니티 게시글 상세 보기
	@GetMapping("/community/view")
	public String getCommunityView(@RequestParam("id") int id, Model model) {
		CommunityDTO community = communityService.getCommunityById(id);
		model.addAttribute("community", community);
		return "community/comm_view";
	}
}
