package kr.or.ddit.item.vo;
//MEMBER 테이블용
/*
	MEMBERID
	PASSWORD
	NAME
	EMAIL
 */


//자바빈 클래스
public class MemberVO2 {
	
	private String memberid;
	private String password;
	private String name;
	private String email;
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "MemberVO2 [memberid=" + memberid + ", password=" + password + ", name=" + name + ", email=" + email
				+ "]";
	}
	
	
}
