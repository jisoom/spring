<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>
<body>
${list}<br/>
<c:forEach var="row" items="${list}" varStatus="stat">
${stat.index} : ${stat.count} : ${row.userName} : ${row.password} <br/>
</c:forEach>
</body>
</html>