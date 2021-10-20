package kr.or.ddit.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.*;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.PointVO;

//스프링 프레임워크가 브라우저의 요청(request)을 받아들이는
//컨트롤러라고 인지하여 자바 빈(java bean)으로 등록해서 관리함
@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//서비스를 호출하기 위해 BookService를 의존성 주입함. BookService는 인터페이스.
	@Autowired
	BookService bookService;
	/*
	 * MVC pattern(model2방식) : 웹페이지와 java code를 분리
	 * 1. Model : 데이터 처리 클래스(DAO, DTO), back end
	 * - Data Access Object(DAO) : 실제적인 비즈니스 로직을 처리
	 * - Data Transfer Object(DTO) : 데이터를 저장, 전달
	 * 	 VO(Value Object), bean(빈), TO(Table Object)
	 * 2. Controller : 프로그램의 흐름을 제어(servlet class)
	 * 3. View : 화면 처리(jsp), front end
	 */
	
	//브라우저의 요청 주소(URI)가 /create일 때 실행되는 자바 컨트롤러 메서드
	//RequestMapping어노테이션 : 브라우저의 요청 URI에 실행되는 자바 메서드 지정
	//method 속성 : http 요청 메서드
	// 1) GET 메서드 : 데이터를 변경하지 않는 경우
	// 2) POST 메서드 : 데이터가 변경될 경우
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create() {
		//ModelAndView 
		//- 컨트롤러가 반환할 데이터를 담당하는 모델(Model)
		//- 화면을 담당하는 뷰(View)의 경로(board/list(.jsp)처럼)
		//Autowire 어노테이션을 사용할 수 없음
		ModelAndView mav = new ModelAndView();
		//servlet-context.xml에 지정되어있음 (경로 쓸 때 /WEB-INF/views/book/create.jsp로 안써도됨)
		//		<beans:property name="prefix" value="/WEB-INF/views/" />
		//		<beans:property name="suffix" value=".jsp" />
		mav.setViewName("book/create");
		mav.addObject("message", "환영합니다.");
		return mav;
	}
	
	//title=피터팬&category=소설&price=10000 => map => {"title" : "피터팬", "category" : "소설", "price" : 10000}
	//RequestParam 어노테이션을 통해 HTTP 파라미터를 map 변수에 자동으로 바인딩함
	//HTTP 파라미터 : 웹 브라우저에서 서버로 전달하는 데이터.
	//팁> 스프링은 객체 타입이나 스칼라 타입(일반 변수)일 경우 특별한 어노테이션 없이도 HTTP 파라미터를 자바 메소드의 파라미터로 변환하여
	//	 컨트롤러 메소드를 호출함. 하지만 Map 타입은 예외.
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createSubmit(ModelAndView mav,
			@RequestParam Map<String, Object> map) {
		
		//insert 성공(1), 실패(null)
		String bookId = this.bookService.create(map);
		
		if(bookId == null) {//insert 실패. 다시 데이터를 입력받아야 하므로 생성 화면으로 리다이렉트 함
			/*
			 * redirect : urI 변경. 데이터 전달이 안됨. 파라미터만 전달.
			 * 주로 컨트롤러의 다른 method로 이동시 주로 사용됨
			 * 스프링은 뷰 파일을 찾아가는 것(forward 방식)이 아니라 웹 페이지의 주소를 변경함
			 */
			mav.setViewName("redirect:/create");
			
		}else {
			//book 테이블에서의 book_id 컬럼의 값(추가된 책의 아이디)
			//book.xml => selectKey order="BEFORE" keyProperty="bookId" resultType="int"
			mav.setViewName("redirect:/detail/" + map.get("bookId"));
		}
		return mav;
	}
	
	//경로 패턴 지정
	@RequestMapping("/detail/{bookId}")
	public ModelAndView detail(@PathVariable("bookId") int bookId,
			ModelAndView mav) {
		logger.debug("bookId :" + bookId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bookId", bookId);
				
		Map<String, Object> detailMap = this.bookService.detail(map);
		System.out.println("detailMap : " + detailMap.toString());
		mav.addObject("bookId", bookId);
		mav.addObject("data", detailMap);
		mav.setViewName("book/detail");
		
		return mav;
	}
	
	//글 수정
	//update?bookId=4 => String bookId, @RequestParam String bookId, @RequestParam Map<String, Object> map
	//update/4 => RequestMapping(value="/update/{bookId}")
	//		   => PathVariable("bookId") String bookId
	//map => {"bookId":"4"}
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.bookService.detail(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		//forwarding
		mav.setViewName("book/update");
		return mav;
		
	}
	
	//bookId, title, category, price
	//스프링은 http 메소드가 GET인지 POST인지 상관없이 RequestMapping 어노테이션이
	//있으면 무조건 파라미터를 넣어줌.
	//map => {"bookId":1,"title":"제목수정","category":"IT","price":"10000"}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView updatePost(@RequestParam Map<String, Object> map,
			ModelAndView mav) {
		int result = this.bookService.edit(map);
		
		if(result > 0) { //업데이트 성공
			String bookId = map.get("bookId").toString();
			//@RequestMapping("/detail/{bookId}")
			mav.setViewName("redirect:/detail/" + bookId);
		}else { //업데이트 실패
			//갱신 화면을 바로 다시 보여줌
			//update 메서드 호출
			mav = this.update(map);
			//리다이렉트(GET 메소드로 리다이렉트)
			//mav.setViewName("redirect:/update");
		}
		
		return mav;
		
	}
	
	//form 태그의 기본 HTTP 메소드는 GET. 검색 버튼을 클릭하면 /list?keyword=검색어
	//map => {"keyword" : "검색어"}
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.bookService.list(map);
		
		ModelAndView mav = new ModelAndView();
		//데이터를 뷰에 전달할 수 있도록 mav객체에 넣음
		mav.addObject("data", list);
		
		//forwarding. /book/list 뷰를 리턴함
		mav.setViewName("book/list");
		
		//list.jsp에 keyword를 추가
		//목록 페이지에서 keyword HTTP 파라미터가 있을 때..
		if(map.containsKey("keyword")) {
			//파라미터가 있다면 뷰(list.jsp)에 keyword를 전달함
			mav.addObject("keyword", map.get("keyword"));
		}
		
		return mav;
	}
	
	@RequestMapping(value ="/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(@RequestParam Map<String, Object> map,
			ModelAndView mav) {
		int result = this.bookService.remove(map);
		if(result > 0) { //삭제 성공
			//목록 화면을 바로 다시 보여줌(forwarding)
			//this.list(map);
			//@RequestMapping(value="/list", method=RequestMethod.GET)
			mav.setViewName("redirect:/list");
		}else { //삭제 실패
			String bookId = map.get("bookId").toString();
			mav.setViewName("redirect:/detail/" + bookId);
		}
		return mav;
	}
	
	///register?userId=a001&amp;password=1234
	// @RequestParam Map<String, Object> map 
	//URL 경로 상의 쿼리 파라미터 정보로부터 요청 데이터를 각각 받을 수 있음
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerByParameter(String userId, String password) {
		logger.info("registerByParameter에 왔다");
		logger.info("userId : " + userId);
		logger.info("password : " + password);
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("password", password);
		//forwarding
		return "book/success";
	}
	
	//URL 경로 상의 경로 변수로부터 요청 데이터를 얻을 수 있음
	///register/a001
	@RequestMapping(value="/register/{userId}", method=RequestMethod.GET)
	public String registerByPath(@PathVariable("userId") String userId) {
		logger.info("registerByPath");
		logger.info("userId : " + userId);
		
		return "book/success";
	}
	
	//name => userId, password, coin
	@RequestMapping(value="/register02", method=RequestMethod.POST)
	public String regiseter02(String userId, String password, int coin) {
		logger.info("register02");
		logger.info("userId : " + userId); //a001
		logger.info("password : " + password); //1234
		logger.info("coin : " + coin); //100
		
		return "book/success";
	}
	/*
	 * <프로젝트 파일 구성>
	 * 1. pom.xml
	 * - 메이븐 프로젝트 빌드 파일
	 * - C:\Users\PC-02\.m2\repository
	 * 2. src/main/java
	 * - 자바 소스 경로
	 * 3. src/main/resources
	 * - 리소스 파일 경로(mybatis의 xml이 들어감)
	 * 4. WEB-INF/spring/root-context.xml
	 * - 스프링 설정 파일
	 * 5. WEB-INF/spring/appServlet/servlet-context.xml
	 * - 스프링 웹 설정 파일
	 * 6. WEB-INF/views
	 * - 뷰 파일 경로(jsp)
	 */
	
	//구구단 계산
	//ModelAndView를 사용하지 않고 jsp를 return
	@RequestMapping(value="/gugu" , method=RequestMethod.GET)
	public String gugu() {
		//WEB-INF/views/book/gugu.jsp
		return "book/gugu";
	}
	
	//구구단 계산 결과
	//action="/gugu_result" , method = RequestMethod.POST 생략
	//name="dan" => RequestParam 어노테이션을 통해 받을 수 있음
	//Model 사용
	@RequestMapping("/gugu_result")
	public String gugu_result(@RequestParam (defaultValue="3") int dan, Model model) {
		String result = "";
		for(int i=1; i <=9; i++) {
			result += dan + " X " + i + " = " + dan * i + "<br/>";
		}
		//ModelAndView 사용시..
		//mav.addObject("result",result); 
		model.addAttribute("dan", dan);
		model.addAttribute("result", result);
		return "book/gugu_result";
	}
	
	//성적 계산
	@RequestMapping("/point")
	public String point() {
		return "book/point";
	}
	
	//성적 계산 결과
	/* form 데이터의 전달 방법
	 * 1) RequestParam 어노테이션
	 * 2) ModelAttribute 어노테이션 : 모델 클래스(VO)로 한꺼번에 전달
	 */
	@RequestMapping("/point_result")
	public String point_result(@ModelAttribute PointVO pointVo, Model model) {
		//total 필드에 총점 입력
		pointVo.setTotal(pointVo.getKor() + pointVo.getEng() + pointVo.getMat());
		
		//average 필드에 평균 입력(소수점 2자리의 실수 값)
		String average = String.format("%.2f", pointVo.getTotal()/3.0);
		pointVo.setAverage(Double.parseDouble(average));
		model.addAttribute("pointVo", pointVo); //*********
		
		return "book/point_result";
	}
	
	@RequestMapping("/move")
	public String move() {
		//return "redirect:/gugu";
		return "redirect:/mypage?id=a001&name=kimculsu&age=23";
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model,
			@RequestParam String id,
			@RequestParam String name, //names로 하면 받아올 수 없음
			@RequestParam int age
			) {
		System.out.println("id" + id);
		System.out.println("name" + name);
		System.out.println("age" + age);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "book/mypage";
	}
	
	//이미지 업로드
	//★MultipartFile picture 변수명과 <input type="file" name="picture" /> name 속성의 값이 같아야함
	@RequestMapping(value = "/registerFile01", method = RequestMethod.POST)
	public String registerFile01(MultipartFile picture) {
		logger.info("registerFile01");
		
		//uploadFolder : 파일 저장 경로
		String uploadFolder = "D:\\upload";
		
		logger.info("originalName : " + picture.getOriginalFilename());
		logger.info("size : " + picture.getSize());
		logger.info("contentType : " + picture.getContentType());
		
		File saveFile = new File(uploadFolder, picture.getOriginalFilename());
		try {
			//transferTo()의 파라미터로는 java.io.File의 객체를 지정하면 됨
			picture.transferTo(saveFile);
			
		}catch (Exception ex) {
			logger.info(ex.getMessage());
		}
		
		return "success"; // /book/success로 하면 success.jsp 파일로 이동
	}
	
	//이미지 업로드 화면 띄우기
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public String uploadAjax() {
		logger.info("uploadAjax");
		//forwarding
		return "book/uploadAjax";
	}
	
	//이미지 업로드 실제 처리(ajax 사용)
	/*
	 * @ResponseBody를 사용하면 경로가 아닌 문자열로 인식함
	 * @Responsebody 어노테이션을 사용하면 http요청 body를 자바 객체로 전달받을 수 있음
	 * return할 때, 객체를 리턴하는 경우 자동으로 json으로 변환해주기 때문에 @Responsebody를 쓰지 않아도됨
	 */
	@ResponseBody
	@RequestMapping(value="/uploadAjaxAction", method=RequestMethod.POST)
	public Map<String, Object> uploadAjaxPost(MultipartFile[] uploadFile) { //파일 여러개이기 때문에 배열로 받음
		logger.info("uploadAjaxPost");
		
		//파일명을 담을 map을 생성
		Map<String, Object> map = new HashMap<String, Object>();
		int i =0;
		
		//파일이 업로드 될 폴더(resources 폴더안의 images 폴더)
		//이클립스의 Window 메뉴에서 preference -> General의 Workspace 선택 후
		//상단의 모든 Refresh 체크박스를 체크함 => 자동 리프레시(새로고침)가 되어 웹에서 바로 이미지를 볼 수 있음 
		String uploadFolder = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\dditProj\\src\\main\\webapp\\resources\\images";
		
		//--------------------------오늘 날짜에서 연/월/일로 분리한 그 폴더를 생성해줌 시작
		//getFolder() : 오늘 날짜의 경로를 문자열로 생성.
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("업로드 경로 : " + uploadPath);
		
		//해당 경로가 있는지 검사. ex)2021 > 7 > 29
		if(uploadPath.exists()==false) {
			//해당 경로가 없으면 생성
			uploadPath.mkdirs();
		}
		//--------------------------오늘 날짜에서 연/월/일로 분리한 그 폴더를 생성해줌 끝
		
		
		//formData.append("uploadFile",files[i]);
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("-----------------------------");
			logger.info("upload 파일명 : " + multipartFile.getOriginalFilename());
			logger.info("upload 파일 사이즈 : " + multipartFile.getSize());
			
			//파일의 실제 명을 변수에 대입
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//인터넷 익스플로러의 경우 경로 정보 삭제해주어야함. 전체 파일 경로가 전송되므로..
			//맨 뒤의 \의 위치 + 1부터 마지막까지 substring하면 파일명만 가져와지고 이를 다시 파일명으로 대입함
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			logger.info("파일 명 : " + uploadFileName);
			
			//------------------파일명 중복 방지를 위한 UUID 처리 (임의의 값 생성 처리) 시작
			//임의의 값(5e16266f-b7eb-4e40-b559-74367464787a)을 생성
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//------------------파일명 중복 방지를 위한 UUID 처리 (임의의 값 생성 처리) 끝 
			
			//map에 파일명을 넣어줌{"data0" : "이미지1", "data1":"이미지2", "data2":"이미지3"}
			//map이므로 키가 달라야함 => i++해줘야함
			map.put("data"+ (i++), uploadFileName);
			
			//복사될 대상 파일 객체 생성 new File(경로, 파일명)
			//날짜별 폴더 생성 하려면 uploadFolder -> uploadPath로 해줌
			File saveFile = new File(uploadPath, uploadFileName); 
			
			try {
				//원본파일.transferTo(복사될 대상 파일)
				multipartFile.transferTo(saveFile);
				
			}catch (Exception e) {
				logger.info(e.getMessage());
				
			}//end catch
		}//end for
		
		//map객체랑 OK리턴
		return map;
	}
	
	//오늘 날짜를 2021-07-29 형식으로 문자열에 넣음. 그런 후
	//2021\07\29으로 연도 월 일을 분리해 냄
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
		
	}

}
