package net.aisw.wit.yaeipja.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	// 기본 URL
	@RequestMapping("/comm")
	public String GetIdx() {
		return "community/community";
	}
	
	@RequestMapping("/comm/write")
	public String GetWriteCommunity() {
		return "community/comm_write";
	}
}
