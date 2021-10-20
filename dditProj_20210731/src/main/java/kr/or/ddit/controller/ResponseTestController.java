package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.vo.Member;

@Controller
public class ResponseTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	//1. return 타입이 void라면.. 요청 경로(/board/goHome0101)와 동일한 뷰(/board/goHome0101.jsp)를 가리킴
	@RequestMapping(value="/board/goHome0101",method=RequestMethod.GET)
	public void home0101() {
		logger.info("home0101");
	}
	
	//2. String 타입
	//뷰 파일의 경로와 파일 이름을 나타내기 위해 사용
	@RequestMapping(value = "/board/goHome0201", method = RequestMethod.GET)
	public String home0201() {
		logger.info("home0201");
		//forwarding
		return "board/home0201";
	}
	
	//3. redirect :
	//반환값이 redirect:로 시작하면 리다이렉트 방식으로 처리(다른 URI 요청)
	@RequestMapping(value = "/board/goHome0204", method = RequestMethod.GET)
	public String home0204() {
		logger.info("home0204");
		
		return "redirect:/board/goHome0205";
	}
	
	//3_2.
	@RequestMapping(value = "/board/goHome0205")
	public String home0205() {
		logger.info("home0205");
		
		return "board/home0205";
	}
	
	//4. 자바빈즈 클래스 타입
	//JSON 객체 타입의 데이터를 만들어서 반환하는 용도로 사용됨
	//JSON 형식 : [{"id" :"a001", "name" : "김은대" }]
	@ResponseBody
	@RequestMapping(value = "/board/goHome0301", method = RequestMethod.GET)
	public ModelAndView home0301() {
		Member member = new Member();
		ModelAndView mav = new ModelAndView();
		member.setUserName("김은대");
		member.setPassword("1234");
		
		mav.addObject("member", member);
		mav.setViewName("board/goHome0301");
		
		//Responsebody 어노테이션 사용 후 jsp에서는
		//Member [userName=김은대, password=1234]
		//Responsebody 어노테이션 사용 안해도 결과가 같은 이유?
		//반환 값이 객체 타입이면 JSON 타입으로 자동 변환됨
		return mav;
	}
	
	//5. 컬렉션 List 타입
	//JSON 객체 배열 타입의 데이터를 만들어 반환하는 용도로 사용함
	@ResponseBody
	@RequestMapping(value = "/board/goHome0401", method = RequestMethod.GET)
	public ModelAndView home0401(ModelAndView mav) {
		logger.info("home0401");
		//다형성(폴리머피즘)
		List<Member> list = new ArrayList<Member>();
		Member member = new Member();
		list.add(member);
		Member member2 = new Member();
		list.add(member2);
		
		logger.info("객체 비교 : " + (member==member2));
		logger.info("값 비교 : " + (member.equals(member2)));
		
		mav.addObject("list", list);
		//forwarding
		mav.setViewName("board/goHome0401");
		
		return mav;
	}
	
	//6. 컬렉션 Map 타입
	//Map 형태의 컬렉션 자료를 JSON 객체 타입의 데이터로 만들어서 반환하는 용도로 사용
	@RequestMapping(value = "/board/goHome0501")
	public ModelAndView home0501(ModelAndView mav) {
		logger.info("home0501");
		Map<String, Member> map = new HashMap<String, Member>();
		
		Member member = new Member();
		map.put("key1", member);
		
		Member member2 = new Member();
		map.put("key2", member2);
		
		mav.addObject("map", map);
		//forwarding
		mav.setViewName("board/goHome0501");
		
		return mav;
	}
	
	//7. ResponseEntity<Void> 타입
	//response할 때 Http 헤더 정보와 내용을 가공하는 용도로 사용
	//200 OK 상태 코드를 전송
	@RequestMapping(value ="/board/goHome0601", method = RequestMethod.GET)
	public String home0601(Model model) {
		logger.info("home0601");
		
		model.addAttribute("status", new ResponseEntity<Void>(HttpStatus.OK));
		//forwarding
		return "board/goHome0601";
	}
	
	//8. ResponseEntity<String> 타입
	//response할 때 Http 헤더 정보와 문자열 데이터를 전달하는 용도로 사용
	//SUCCESS 메시지와 200 OK 상태코드를 전송
	@RequestMapping(value = "/board/goHome0701", method = RequestMethod.GET)
	public String home0701(Model model) {
		logger.info("home0701");
		
		model.addAttribute("statusMessage", new ResponseEntity<String>("SUCCESS", HttpStatus.OK));
		
		return "board/goHome0701";
	}
	
	//9. ResponseEntity<자바빈즈 클래스> 타입
	//response 할 때 Http 헤더 정보와 객체 데이터를 전달하는 용도로 사용
	//객체의 JSON 타입의 데이터와 200 OK 상태코드를 전송
	@RequestMapping(value = "/board/goHome0801", method = RequestMethod.GET)
	public String home08(Model model) {
		logger.info("home08");
		
		Member member = new Member();
		
		model.addAttribute("member", new ResponseEntity<Member>(member, HttpStatus.OK));
		
		return "board/goHome0801";
	}
	
}
