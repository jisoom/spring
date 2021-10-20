package kr.or.ddit.item.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.BoardController;
import kr.or.ddit.item.vo.UserVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/user/register", method =RequestMethod.GET)
	public String insertUser() {
		//forwarding
		return "user/register";
	}
	
	/*
	 * RequestBody
	 * POST 방식으로 넘어온 HTTP 파라미터를 VO에 매핑해줌
	 * 
	 * BindingResult : 오류 내역 확인
	 */
	@ResponseBody
	@RequestMapping(value = "/user/register", method =RequestMethod.POST)
	public UserVO insertUserPost(@RequestBody @Valid UserVO userVo,
			BindingResult bindingResult) {
		
		logger.info("userVo : " + userVo);
		logger.info("bindingResult : " + bindingResult);
		logger.info("bindingResult.hasErrors()) : " + bindingResult.hasErrors());
		
		return userVo;
	}
}
