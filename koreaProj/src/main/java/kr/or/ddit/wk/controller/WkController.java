package kr.or.ddit.wk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.site.vo.SiteVO;
import kr.or.ddit.util.Pagination;
import kr.or.ddit.wk.service.WkService;
import kr.or.ddit.wk.vo.WkVO;

@RequestMapping("/wk")
@Controller
public class WkController {

	private static Logger logger = LoggerFactory.getLogger(WkController.class);
	private int size = 3; //한 페이지에서 보여질 글 행의 갯수
	
	@Autowired
	WkService wkService;
	
	//currentPage : 사용자 현재 페이지 번호(emp)
	//currentSitePage : 사용자 현재 페이지 번호(site)
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Model model, @RequestParam(defaultValue = "1") String currentPage,
			@RequestParam(defaultValue = "1") String currentSitePage) {
		
		//사원을 위한 용도
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		//사원 정보 목록
		List<EmpVO> empVoList = this.wkService.selectEmpList(map);
		logger.info("empVoList", empVoList);
		
		//사업장을 위한 용도
		Map<String, Object> siteMap = new HashMap<String, Object>();
		siteMap.put("currentSitePage", currentSitePage);
		//사업장 정보 목록
		List<SiteVO> siteVoList = this.wkService.selectSiteList(siteMap);
		logger.info("siteVoList", siteVoList);
		
		model.addAttribute("empVoList", empVoList);
		model.addAttribute("siteVoList", siteVoList);
		
		//--------------------------------------사원 페이징--------------------------------------------------
		//페이징 영역 Pagination(전체 게시글의 개수, 사용자가 요청한 페이지 번호, 한 페이지에 보여질 글 행의 수)
		int total = this.wkService.selectCountEmp();
		Pagination paging = new Pagination(total, Integer.parseInt(currentPage), size);
		
		String pagingStr = "";
		
		//1. [이전]
		// 1 2 3 => [이전] 필요 없음
		if(paging.getStartPage() > 3) { //[이전] 4 5 6
			pagingStr += "<a href='/wk/insert?currentPage=" + (paging.getStartPage() - 3) + "'>[이전]</a>&nbsp;";
		}
		
		//2. 페이징 번호
		for(int i=paging.getStartPage(); i<=paging.getEndPage(); i++) {
			pagingStr += "<a href='/wk/insert?currentPage=" + i + "'>[" + i + "]</a>&nbsp;";
		}
		//3. [다음]
		//7(startPage) 8 9(endPage) => 전체 페이지는 11까지라면 아직 [다음]이 필요함
		//10 11(totalPage) => [다음]필요하지 않음
		//즉, 페이지 이동 링크 끝번호가 마지막 페이지보다 작을 때.. => [다음]
		if(paging.getEndPage() < paging.getTotalPages()) { 
			pagingStr += "<a href='/wk/insert?currentPage=" + (paging.getEndPage() + 1) + "'>[다음]</a>&nbsp;";
			//paging.getStartPage() + 3 으로도 할 수 있음
		}
		logger.info("pagingStr : " + pagingStr);
		//jsp에서 페이징 영역에 활용될 예정
		model.addAttribute("pagingStr", pagingStr);
		
		
		//--------------------------------------사업장 페이징--------------------------------------------------
		//페이징 영역 Pagination(전체 게시글의 개수, 사용자가 요청한 페이지 번호, 한 페이지에 보여질 글 행의 수)
		int siteTotal = this.wkService.selectCountSite();
		logger.info("dd" + siteTotal);
		Pagination sitePaging = new Pagination(siteTotal, Integer.parseInt(currentSitePage), size);
		
		String sitePagingStr = "";
		
		//1. [이전]
		// 1 2 3 => [이전] 필요 없음
		if(sitePaging.getStartPage() > 3) { //[이전] 4 5 6
			sitePagingStr += "<a href='/wk/insert?currentSitePage=" + (sitePaging.getStartPage() - 3) + "'>[이전]</a>&nbsp;";
		}
		
		//2. 페이징 번호
		for(int i=sitePaging.getStartPage(); i<=sitePaging.getEndPage(); i++) {
			sitePagingStr += "<a href='/wk/insert?currentSitePage=" + i + "'>[" + i + "]</a>&nbsp;";
		}
		//3. [다음]
		//7(startPage) 8 9(endPage) => 전체 페이지는 11까지라면 아직 [다음]이 필요함
		//10 11(totalPage) => [다음]필요하지 않음
		//즉, 페이지 이동 링크 끝번호가 마지막 페이지보다 작을 때.. => [다음]
		if(sitePaging.getEndPage() < sitePaging.getTotalPages()) { 
			sitePagingStr += "<a href='/wk/insert?currentSitePage=" + (sitePaging.getEndPage() + 1) + "'>[다음]</a>&nbsp;";
			//paging.getStartPage() + 3 으로도 할 수 있음
		}
		logger.info("sitePagingStr : " + sitePagingStr);
		//jsp에서 페이징 영역에 활용될 예정
		model.addAttribute("sitePagingStr", sitePagingStr);
		
		
		//forwarding
		return "wk/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(@RequestParam Map<String, Object> map) throws ParseException {
		//{empNum=4, empNm=박명수, 
		//siteNum=2021001, siteNm=대전 사업장, wkStartDt=2021-08-25}
		logger.info("map : " + map.toString());
		
		//근무 테이블용 Value Object 생성(파라미터로 보내주기 위해)
		//@RequestParam의 map에는 hidden으로 된 WkVO에 없는 것들도 존재 => 사용하는 것들만 넣어줌
		WkVO wkVo = new WkVO();
		String empNumStr = (String) map.get("empNum");
		String siteNumStr = (String) map.get("siteNum");
		String wkStartDtStr = (String)map.get("wkStartDt");
		
		//2021-08-01
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format.parse(wkStartDtStr);
		
		wkVo.setEmpNum(Integer.parseInt(empNumStr));
		wkVo.setSiteNum(Integer.parseInt(siteNumStr));
		wkVo.setWkStartDt(date);
		
		//wkVo.setEmpNum(Integer.parseInt(map.get("empNum").toString()));
		//wkVo.setSiteNum(Integer.parseInt(map.get("siteNum").toString()));
		
		logger.info("wkVo : " + wkVo);
		
		WkVO resultVo = this.wkService.insert(wkVo);
		
		logger.info("resultVo : " + resultVo);
		//redirect : insert메소드를 다시 실행
		return "redirect:/wk/insert"; //Get방식 insert가 실행됨
		
	}
	
	//{"empNum":varEmpNum} JSON 형식
	//RequestBody 어노테이션 : Post방식으로 넘어온 HTTP 파라미터를 Map에 매핑
	@ResponseBody
	@RequestMapping(value = "/selectEmpDetail", method = RequestMethod.POST)
	public EmpVO selectEmpDetail(@RequestBody Map<String, Object> map) {
		logger.info("map : " + map.get("empNum"));
		//직원 번호 :empNum
		String empNumStr = (String)map.get("empNum");
		int empNum = Integer.parseInt(empNumStr);
		
		EmpVO empVo = this.wkService.selectEmpDetail(empNum);
		logger.info("empVo : " + empVo);
		
		return empVo;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	public Map<String, Object> deletePostEmp(@RequestBody Map<String, Object> map) {
		logger.info("empNumDel : " + map.get("empNum"));
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//wk(근무) 테이블에 해당 사원이 있는지 체킹
		int result = this.wkService.selectCheckWkEmp(map);
		
		//wk(근무) 테이블에 해당 사원이 있다면 삭제하지 않음
		if(result > 0) {
			resultMap.put("empNum","0");
		}else {//없다면
			//삭제된 사원 번호를 받음 (map의 키 : empNum)
			resultMap = this.wkService.deleteEmp(map);
		}
		
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteSite", method = RequestMethod.POST)
	public Map<String,Object> deletePostSite(@RequestBody Map<String, Object> map) {
		logger.info("siteNumDel : " + map.get("siteNum"));
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//wk(근무) 테이블에 해당 사업장이 있는지 체킹
		int result = this.wkService.selectCheckWkSite(map);
		
		//wk(근무) 테이블에 해당 사업장이 있다면 삭제하지 않음
		if(result > 0) {
			resultMap.put("siteNum", "0");
		}else {
			resultMap = this.wkService.deleteSite(map);
		}
		
		return resultMap;
	}
}
