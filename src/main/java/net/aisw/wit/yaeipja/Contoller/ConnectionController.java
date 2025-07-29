package net.aisw.wit.yaeipja.Contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConnectionController {
	@RequestMapping("/conn")
	public String GetConnection() {
		return "connection/connection";
	}
}
