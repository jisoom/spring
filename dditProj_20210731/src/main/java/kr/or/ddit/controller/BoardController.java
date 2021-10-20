package kr.or.ddit.controller;

/*import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;*/
import org.slf4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
//클래스 레벨 요청 경로 지정
@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	//mybatis의 로그
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	/*
	 * 요청 경로 매핑
	 * - RequestMapping 어노테이션
	 * - 요청 경로는 반드시 설정해야 하는 필수 정보
	 * - 컨트롤러의 클래스 레벨과 메서드 레벨로 지정가능
	 * - 클래스 레벨로 요청 경로 지정 시
	 * 	  메서드 레벨에서 지정한 경로의 기본 경로로 취급됨
	 * - 클래스 레벨의 요청 경로에 메서드 레벨의 요청 경로를 덧붙인 형태가
	 * 	  최종 경로가 됨 /board/register
	 */
	
	@RequestMapping(value="/register")
	public String registerForm() {
		
		//lombok의 로그
		log.info("registerForm");
		
		return "board/register";
	}
	
	//속성이 하나일 때는 속성명을 생략할 수 있음
	@RequestMapping("/modify")
	public String modifyForm() {
		log.debug("test");
		//view/board/modify.jsp => forwarding
		return "board/modify";
	}
	
	//http://localhost:8090/board/detail?boardNo=7  (before, AsIs)
	/*
	 * 경로 패턴 매핑
	 * - 요청 경로를 동적으로 표현이 가능한 경로 패턴을 지정할 수 있음
	 * - !경로 변수!에 해당하는 값을 파라미터 변수에 설정할 수 있음
	 */
	//http://localhost:8090/board/detail/7  (after, ToBe)
	
	@RequestMapping("/detail/{boardNo}")
	public ModelAndView detail(@PathVariable("boardNo") int boardNo
			, ModelAndView mav) {
		log.info("boardNo : " + boardNo);
		mav.addObject("boardNo", boardNo);
		mav.setViewName("board/detail");
		
		return mav;
	}
	
	//http://localhost:8090/
}
