<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>등록 성공</title>
</head>
<body>
	<c:if test="${siteNum !=null}">
	<script type="text/javascript">
		alert("등록 완료!");
		opener.parent.location.reload();
		self.close();
	</script>
	</c:if>
	
	<c:if test="${siteNum ==null}">
	<script type="text/javascript">
		alert("등록 실패!");
		history.go(-1);	
	</script>
	</c:if>
</body>
</html>