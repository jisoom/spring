package kr.or.ddit.site.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.emp.controller.EmpController;
import kr.or.ddit.site.service.SiteService;
import kr.or.ddit.site.vo.SiteVO;

@RequestMapping(value = "/site")
@Controller
public class SiteController {

	private static Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Autowired
	SiteService siteService;
	
	@RequestMapping(value = "/popUp/insert", method = RequestMethod.GET)
	public String insert() {
		//forwarding
		return "site/popUp/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertPost(ModelAndView mav,
			@ModelAttribute SiteVO siteVo) {
		logger.info("siteVo : " + siteVo);
		int siteNum = this.siteService.insert(siteVo); //insert 성공하면 site기본키 받아옴
		if(siteNum== 0) {//insert 실패
			mav.setViewName("redirect:/site/insert");
		}else {//insert 성공
			mav.addObject("siteNum", siteNum);
			/* mav.setViewName("redirect:/site/detail?siteNum=" + siteNum); */
			mav.setViewName("site/insertSuccess");
		}
		return mav;
	}
}
