<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세</title>
</head>
<body>
<!-- 컨트롤러에서 전달받은 데이터를 보여주는 방법은
달러{데이터 이름} 형식으로 사용하면 됨 -->
	<h1>책 상세</h1>
	<p>제목 : ${data.TITLE} </p>
	<p>카테고리 : ${data.CATEGORY}</p>
	<!--maxFractionDigits : 천단위 쉼표 구분자  -->
	<p>가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${data.PRICE}" /></p>
	<p><a href="/update?bookId=${bookId}">수정</a></p>
	<form method="post" action="/delete">
		<input type="hidden" name="bookId" value="${bookId}" />
		<input type="submit" value="삭제" />
	</form>
	<p><a href="/list">목록으로</a></p>
	${data.BOOKID}<br/>
</body>
</html>