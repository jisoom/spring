package kr.or.ddit.item.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.item.vo.MemberVO2;


//데이터와 Access(접근 및 활용)하는 Object로써의 클래스라고 String에게 알려줌
@Repository
public class MemberDao {

	//Oracle과 통신 => Connection 객체가 필요. => ConnectionPool에서 미리 만들어주어짐
	//SqlSessionTemplate를 활용하자
	//DI(의존성 주입)에 의해 Spring에서 new를 하여(IoC제어의 역전) 생성된 객체를 우리는 사용함
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
	public MemberVO2 selectMember(MemberVO2 memberVo) {
		//.selectOne("namespace.id",파라미터)
		//memberVo => memberid 필드를 사용함(where조건은로..)
		
		return this.sqlsessionTemplate.selectOne("member.select",memberVo);
	}
	
	
	
	
	
	
	
	
}
