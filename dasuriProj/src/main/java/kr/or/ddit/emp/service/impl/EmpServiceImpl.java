package kr.or.ddit.emp.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.dao.EmpDao;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {

	/*
	 * @Autowired와 @Inject의 차이점
	 * 1. @Autowired
	 * - Spring 프레임워크(라이브러리 집합 + 디자인 패턴)에서 지원하는 어노테이션
	 * - 객체의 타입을 찾아서 있으면 객체를 자동으로 주입(new)
	 * - 사용처 : 생성자, 일반 메소드, setter메소드, 멤버변수
	 * 
	 * 2. @Inject
	 * - Java에서 지원하는 어노테이션. 특정 프레임워크에 종속되지 않음
	 * - 사용처 : 생성자, 일반 메소드, setter메소드, 멤버변수
	 */ 
	
	//@Autowired
	@Inject
	EmpDao empDao;
	
	//직원 번호가 리턴됨
	//직원 등록
	@Override
	public int insert(EmpVO empVo) {
		int result = this.empDao.insert(empVo);
		if(result > 0) { //insert가 잘되었다면..
			//방금 입력된 직원의 번호를 get
			return empVo.getEmpNum();
		}else {//insert가 안되었다면..
			return 0;
		}
	}
	
	//직원번호를 조건으로 하여 직원의 정보를 리턴
	@Override
	public EmpVO selectEmp(String empNum) {
		return this.empDao.selectEmp(empNum);
	}

	//직원번호(empNum)를 조건으로 하여 empVo에 담긴 대로 직원 정보를 update함
	@Override
	public int update(EmpVO empVo) {
		return this.empDao.update(empVo);
	}
	
	//직원번호(String empNum)를 조건으로 하여 해당직원의 데이터를 삭제
	@Override
	public int delete(String empNum) {
		return this.empDao.delete(empNum);
	}
	
	//직원 목록 가져오기
	@Override
	public List<EmpVO> selectEmpList(String currentPage) {
		return this.empDao.selectEmpList(currentPage);
	}
	
	//EMP테이블의 카디널리티
	@Override
	public int empTotal() {
		return this.empDao.empTotal();
	}
	
	//직원 로그인
	@Override
	public EmpVO login(EmpVO empVo, HttpSession session) {
		//직원번호(empNum), 비밀번호(pwd)를 통해 select한 결과를 객체에 담음
		EmpVO empVoResult = this.empDao.login(empVo);
		
		if(empVoResult != null) { //입력값에 해당되는 직원이 있으면..
			//세션 변수에 정보를 입력(직원번호, 직원명)
			session.setAttribute("empNum", empVoResult.getEmpNum());
			session.setAttribute("nm", empVoResult.getNm());
			session.setAttribute("adminYn", empVoResult.getAdminYn());
		
			return empVoResult;
		}else { //로그인 실패
			return null;
		}
		
	}
	
	//모든 직원 목록 가져오기
	@Override
	public List<EmpVO> selectEmpAllList() {
		return this.empDao.selectEmpAllList();
	}
}
