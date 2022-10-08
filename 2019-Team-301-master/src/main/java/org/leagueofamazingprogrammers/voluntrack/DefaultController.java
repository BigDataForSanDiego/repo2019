package org.leagueofamazingprogrammers.voluntrack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {
	public static final String HOMEPAGE = "index";

//	@GetMapping("/")
//	public String test() {
//		return "index";
//	}

	@GetMapping("/")
	public String dashboard() {
		return "dashboard";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

}
