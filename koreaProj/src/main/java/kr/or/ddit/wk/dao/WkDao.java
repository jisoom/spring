package kr.or.ddit.wk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.site.vo.SiteVO;
import kr.or.ddit.wk.vo.WkVO;

@Repository
public class WkDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//근무(WK) 테이블에 데이터를 입력. 어떤 사원이 어떤 사업장에 근무하는지..
	public int insert(WkVO wkVo) {
		return this.sqlSessionTemplate.insert("wk.insert",wkVo);
	}
	
	//사원 정보 목록
	public List<EmpVO> selectEmpList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("wk.selectEmpList", map);
	}
	
	//사업장 정보 목록
	public List<SiteVO> selectSiteList(Map<String, Object> siteMap) {
		return this.sqlSessionTemplate.selectList("wk.selectSiteList", siteMap);
	}
	
	//사원 정보 상세보기
	public EmpVO selectEmpDetail(int empNum) {
		return this.sqlSessionTemplate.selectOne("wk.selectEmpDetail", empNum);
	}
	
	//사원 정보  삭제
	public int deleteEmp(Map<String, Object> empNum) {
		return this.sqlSessionTemplate.delete("wk.deleteEmp", empNum);
	}

	//사업장 정보 삭제
	public int deleteSite(Map<String,Object> siteNum) {
		return this.sqlSessionTemplate.delete("wk.deleteSite", siteNum);
	}
	
	//특정 사원의 정보가 존재하는가
	public int selectCheckWkEmp(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("wk.selectCheckWkEmp", map);
	}
	
	//특정 사업장의 정보가 존재하는가
	public int selectCheckWkSite(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("wk.selectCheckWkSite", map);
	}
	
	//사원의 모든 인원 수 구하기
	public int selectCountEmp() {
		return this.sqlSessionTemplate.selectOne("wk.selectCountEmp");
	}

	//사업장 모든 갯수 구하기
	public int selectCountSite() {
		return this.sqlSessionTemplate.selectOne("wk.selectCountSite");
	}
}
