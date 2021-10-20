package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "test/test";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "test/list";
	}
	@RequestMapping(value = "/acco", method = RequestMethod.GET)
	public String acco() {
		return "test/acco";
	}
	@RequestMapping(value = "/mockTest", method = RequestMethod.GET)
	public String mockTest() {
		return "test/mockTest";
	}
	@RequestMapping(value = "/lectureList", method = RequestMethod.GET)
	public String lectureList() {
		return "test/lectureList";
	}
	@RequestMapping(value = "/color/colorList", method = RequestMethod.GET)
	public String colorList() {
		return "test/color/colorList";
	}
	@RequestMapping(value = "/testInsert", method = RequestMethod.GET)
	public String testInsert() {
		return "test/testInsert";
	}
}
