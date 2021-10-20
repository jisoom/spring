package kr.or.ddit.chart.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.chart.service.GoogleChartService;

//json을 리턴하는 method가 있을 경우 @RestController 사용(Spring 4.0부터 사용 가능)
//만약 Controller어노테이션 사용 시 메소드에 ResponseBody를 사용하면 됨.
@Controller
@RequestMapping("/chart")
public class GoogleChartController {
	
	@Autowired
	GoogleChartService googleChartService;
	
	@RequestMapping("/chart01")
	public ModelAndView chart01() {
		//forwarding
		return new ModelAndView("chart/chart01");
	}
	
	@RequestMapping("/chart01Multi")
	public String chart01Multi() {
		//forwarding
		return "chart/chart01Multi";
	}
	
	@RequestMapping("/chart02")
	public String chart02() {
		return "chart/chart02";
	}
	
	@ResponseBody
	@RequestMapping("/chart02_money")
	public JSONObject chart02_money() {
		//DB를 통해 List로 가져온 데이터를 변경해준 JSON데이터로 리턴
		return this.googleChartService.getChartData();
	}
}
