package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Repository 어노테이션 : 스프링에게 데이터에 접근하는 클래스임을 알려줌
//					   스프링이 데이터를 관리하는 클래스라고 인지하여 자바빈(java bean)으로 등록하여 관리
@Repository
public class BookDao {
	//매퍼 XML을 실행시키기 위해 SqlSessionTemplate 클래스의 객체를 멤버 변수로 선언
	//new 키워드를 통해 직접 생성하지 않고, Dependency Injection을 통해 주입받음
	//root-context.xml에서 미리 만들어 놓은 SqlSessionTemplate 타입 객체를
	//BookDao 객체에 주입하여 sqlSessionTemplate.select() 이런식으로 사용할 수 있게 됨
	//멤버변수(필드) 위에 Autowired 어노테이션으로 의존성을 주입하는 방식을 필드 인젝션이라고함
	//SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(); X
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//map : Service 레이어로부터 전달받은 파라미터 그대로 매퍼 XML에 전달할 것임
	//int : insert 쿼리가 성공시 1개의 행이 생김. 성공(1), 실패(0)
	public int insert(Map<String, Object> map) {
		//insert(매퍼xml의 namespace.id, 전달할 데이터)
		//namespace.id : 매퍼 쿼리 이름
		return this.sqlSessionTemplate.insert("book.insert", map);
	}
	
	//책 상세 map => {"bookId" : "4"}
	public Map<String, Object> selectDetail(Map<String, Object> map) {
		//selectOne() : 데이터를 1행만 가져올 때 사용.
		//쿼리 결과 행의 수가 0이면 selectOne() 메소드는 null을 반환, 
		//쿼리 결과 행의 수가 여러개면 TooManyResultsException 예외를 throw함
		return this.sqlSessionTemplate.selectOne("book.select_detail", map);
	}
	
	//책 수정
	public int update(Map<String, Object> map) {
		//update(namespace.id,파라미터)
		//update 구문은 조건에 일치하는 모든 행을 갱신하므로 0 혹은 1이상을 리턴
		return this.sqlSessionTemplate.update("book.update", map);
	}
	
	//책 목록
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		//selectList(namespace.id,파라미터)
		return this.sqlSessionTemplate.selectList("book.select_list", map);
	}
	
	//책 삭제
	public int delete(Map<String, Object> map) {
		//delete(namespace.id, 파라미터)
		//return 영향받은 행의 개수(0또는 1이상)
		return this.sqlSessionTemplate.delete("book.delete", map);
	}
	
	
}
