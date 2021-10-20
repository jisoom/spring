package kr.or.ddit.emp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.dao.EmpDao;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	EmpDao empDao;
	
	//EMP테이블에 insert
	@Override
	public int insert(EmpVO empVo) {
		//EMP 테이블에 insert 성공 시 0보다 큼 
		int affectRowCount = this.empDao.insert(empVo);
		if(affectRowCount > 0) { //성공
			//EMP 테이블의 기본키를 return
			//emp.xml에서 insert하기 전 수행하는 selectKey에 
			//SELECT NVL(MAX(EMP_NUM),0)+1 FROM EMP => 이것이 setEmpNum()처리가 되었음
			//=> empVo.getEmpNum() 사용할 수 있음
			return empVo.getEmpNum();
		}else { //실패
			return 0;
		}
	}
}
