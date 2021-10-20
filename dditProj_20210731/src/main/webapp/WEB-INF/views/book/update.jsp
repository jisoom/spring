<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>책 수정하기</title>
</head>
<body>
<!-- 
<뷰>
뷰는 화면을 담당. 웹 어플리케이션에서 화면은 웹 브라우저가 렌더링함
서버에서 응답될 때 브라우저가 읽어서 해석할 수 있는 HTML로 최종 변환됨
 -->
	<h1>책 수정하기</h1>
	<form method="post">
		<input type="hidden" name="bookId" value="${data.BOOKID}"><br/>
		<p>제목 : <input type="text" name="title" value="${data.TITLE}" /></p>
		<p>카테고리 : <input type="text" name="category" value="${data.CATEGORY}" /></p>
		<p>가격 : <input type="text" name="price" value="${data.PRICE}"/></p>
		<p><input type="submit" value="수정" /></p>
	</form>
	<br/>
	<!-- 
	form 태그 안의 내용이 서버로 전송됨.
	name 속성을 가져야함. name 속성은 키, value 속성은 값.
	* 키 : 값 쌍을 HTTP 파라미터라고 부름.
	 -->
</body>
</html>