package kr.or.ddit.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// /chart/*에서 /*는 생략 가능함
@RequestMapping("/chart/*")
@Controller
public class ChartMainController {
	
	@RequestMapping(value = "/chartMain", method = RequestMethod.GET)
	public String chartMain() {
		//forwarding
		return "chart/chartMain";
	}
	
	
}
