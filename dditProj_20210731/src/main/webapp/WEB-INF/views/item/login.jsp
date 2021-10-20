<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
$(function() {
// 	$("#btnLogin").click(function(){}
	$("#btnLogin").on("click",function(){
		
		var id=$("#id").val();
		var pwd=$("#pwd").val();
		var param={"id":id,"pwd":pwd};//json데이터
		console.log("param : "+param.id + ", pwd : "+param.pwd);
		$.ajax({
			type:"post"
			,url:"/item/login_result"
			,data:param
			,success:function(result){
				console.log("result:"+result);
				$("#result").html(result);
			}
		});
	});
	
	alert("왔다");
	
});	
</script>
</head>
<body>

id : <input type="text" id="id"/>
pwd : <input type="password" id="pwd">
<input type="button" id="btnLogin" value="로그인">

<div id="result"></div>
</body>
</html>