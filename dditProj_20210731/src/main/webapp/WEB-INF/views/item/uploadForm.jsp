<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>다중 이미지 업로드</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" 
		  action="/item/uploadFormAction">
		제품명 : <input type="text" name="itemName" id="itemName"/><br/>  
		가격 : <input type="text" name="price" id="price"/><br/>
		요약 : <textarea name="description" id="description" rows="5" cols="20"></textarea><br/>  
		첨부파일 : <input type="file" name="picture" id="picture" multiple /><br/>
		<input type="submit" value="새글입력" />	  
	</form>
</body>
</html>