package kr.or.ddit.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.car.service.CarService;
import kr.or.ddit.car.vo.CarVO;
import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.CusVO;
import kr.or.ddit.util.Pagination;

@RequestMapping(value = "/car/*")
@Controller
public class CarController {
	
	@Autowired
	private CusService cusService; //cusList 조회하기 위해 사용
	@Autowired
	private CarService carService;
	
	private static Logger logger = LoggerFactory.getLogger(CarController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		//forwarding
		return "car/list";
	}
	
	//자동차 등록 form
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		//forwarding
		return "car/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute CarVO carVo) throws Exception {
		
		System.out.println("carVo" + carVo.toString());
		
		//고객 번호
		String cusNum = carVo.getCusNum();
		
		//before vo(CarVO클래스 안의 carVo)
		List<CarVO> vo = carVo.getCarVo();
		
		//after vo(cusNum 값을 넣어줌)
		List<CarVO> voNew = new ArrayList<CarVO>();
		
		//1234null (cusNum은 넣지 않았기 때문에)
		for(CarVO row : vo) {
			row.setCusNum(cusNum);
			System.out.print(row.getCusNum());
			System.out.print(row.getCarNum());
			System.out.print(row.getMk());
			System.out.print(row.getPy());
			System.out.println(row.getDriDist());
			
			voNew.add(row);
		}
		
		System.out.println(voNew.toString());
		
		//고객의 자동차 정보 insert
		int result = this.carService.insertPost(voNew);
		
		//forwarding
		return "car/insert";
	}
	
	@RequestMapping(value = "/popup/cusList", method = RequestMethod.GET)
	public String cusList(Model model, @RequestParam(defaultValue = "1") String currentPage,
			@RequestParam Map<String, Object> map) throws Exception{

		//최초에 /cus/list를 요청했을 때 map은 null이므로 null처리함
				if(map.get("currentPage")==null) {
					map.put("currentPage", "1");
				}
				if(map.get("selSearch")==null) {
					map.put("selSearch", "");
				}
				if(map.get("keyword")==null) {
					map.put("keyword", "");
				}
				
				List<CusVO> list = this.cusService.selectAllList(map);
				
				//전체 글의 행수(카디널리티)
				int total = this.cusService.cusTotal(map);
				int startNum = Integer.parseInt(currentPage) * 15 - 14;
				int endNum = Integer.parseInt(currentPage) * 15;
				//endNum 보정 작업
				if(endNum > total) {
					endNum = total;
				}
				
				//테이블 왼쪽 하단의 Showing 1(시작 글번호) to 10(종료 글번호) of 57(전체 행의 개수-카디널리티) entries
				Map<String, Object> entriesMap = new HashMap<String, Object>();
				entriesMap.put("startNum", startNum);
				entriesMap.put("endNum", endNum);
				entriesMap.put("totalNum", total);
				
				//Pagination 처리
				Pagination paging = new Pagination(total, Integer.parseInt(currentPage), 15);
				
				model.addAttribute("list", list);
				model.addAttribute("entriesMap", entriesMap);
				model.addAttribute("paging", paging);
		
		
		//forwarding
		return "car/popup/cusList";
	}
}
