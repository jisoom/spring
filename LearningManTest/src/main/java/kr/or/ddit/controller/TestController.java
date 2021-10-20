package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "test/home";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "test/list";
	}
	@RequestMapping(value = "/acco", method = RequestMethod.GET)
	public String acco() {
		return "test/acco";
	}
	@RequestMapping(value = "/examHistory", method = RequestMethod.GET)
	public String examHistory() {
		return "test/examHistory";
	}
	@RequestMapping(value = "/lectureList", method = RequestMethod.GET)
	public String lectureList() {
		return "test/lectureList";
	}
	@RequestMapping(value = "/color/colorList", method = RequestMethod.GET)
	public String colorList() {
		return "test/color/colorList";
	}
	@RequestMapping(value = "/examInsert", method = RequestMethod.GET)
	public String examInsert() {
		return "test/examInsert";
	}
	@RequestMapping(value = "/teaching/list", method = RequestMethod.GET)
	public String teachingList() {
		return "teaching/list";
	}
	@RequestMapping(value = "/teaching/detail", method = RequestMethod.GET)
	public String teachingDetail() {
		return "teaching/detail";
	}
	@RequestMapping(value = "/teaching/attend", method = RequestMethod.GET)
	public String teachingAttend() {
		return "teaching/attend";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/notiles/login";
	}

}
