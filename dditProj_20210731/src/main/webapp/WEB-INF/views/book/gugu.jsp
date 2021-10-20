<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>구구단 계산</title>
</head>
<body>
	<h2>구구단 계산</h2>
	<form method="post" action="/gugu_result">
		단을 입력해주세요. <input type="number" name="dan" value="3" /><br/>
		<input type="submit" value="확인">
	</form>
</body>
</html>