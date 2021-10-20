package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.BookDao;
import kr.or.ddit.service.BookService;

/*
 * 서비스 클래스(비즈니스 클래스, 기능구현) 
 * 스프링 MVC 구조에서 Controller와 DAO를 연결해주는 역할
 * 서비스 레이어는 인터페이스(BookService)와 클래스(BookServiceImpl)를 함께 사용함
 * 스프링은 직접 클래스를 생성하는 것을 지양(싫어함)
 * 		 인터페이스를 통해 접근하는 것을 권장하는 프레임워크
 */

//Service 어노테이션 : 스프링에게 나는 서비스 클래스야 라고 알려줌
@Service
public class BookServiceImpl implements BookService {
	
	//private BookDao bookDao = BookDao.getInstance();
	//IoC : Inversion of Control 제어의 역전
	@Autowired
	BookDao bookDao;
	
	//map : Controller로부터 전달받은 파라미터
	@Override
	public String create(Map<String, Object> map) {
		//insert 쿼리 실행. 성공(1), 실패(0)을 리턴받음
		int affectRowCount = this.bookDao.insert(map);
		if(affectRowCount == 1) { //성공
			return "1";
		}
		return null;
	}
	
	//BookService를 implement한 메소드. 메소드 재정의. => BookService 시그니처 처리가 필요함.
	//map => {"bookId" : "4"}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		//Controller로부터 받은 파라미터(map)을 전달
		return this.bookDao.selectDetail(map);
	}
	
	//글 수정
	//map => {"bookId" : "4"}
	@Override
	public int edit(Map<String, Object> map) {
		int affectRowCount = this.bookDao.update(map);
		return affectRowCount;
	}
	
	//map => {"keyword" : "검색어"}
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		//Controller로부터 받은 파라미터(map)를 전달
		return this.bookDao.selectList(map);
	}

	@Override
	public int remove(Map<String, Object> map) {
		//return 0 또는 1이상
		return this.bookDao.delete(map);
	}
}
