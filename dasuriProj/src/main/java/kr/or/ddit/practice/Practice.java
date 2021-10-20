package kr.or.ddit.practice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Practice {

	@RequestMapping(value = "/home")
	public String home() {
		return "practice/p/practice";
	}
}
