package kr.or.ddit.emp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.vo.EmpVO;

//interface : 소통을 위한 매개체
//클래스가 implements를 하여 구현을 해줘야 함(메소드-버튼, 필드-아이템)
//int a = 10; => public abstract int a = 0; (수정이 불가능)
public interface EmpService {
	//int a = 10; //a는 무조건 10 변경할 수 없음
	
	//메소드 시그니처
	public int insert(EmpVO empVo);

	public EmpVO selectEmp(String empNum);

	public int update(EmpVO empVo);

	public int delete(String empNum);

	public List<EmpVO> selectEmpList(String currentPage);

	public int empTotal();

	public EmpVO login(EmpVO empVo, HttpSession session);

	public List<EmpVO> selectEmpAllList();
}
