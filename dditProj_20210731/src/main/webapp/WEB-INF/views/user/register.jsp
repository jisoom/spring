<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
String date = sdf.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		//가입 버튼 클릭 시 실행
		$("#btn").on("click",function(){
		const userNo = $("#no").val();
		const userName = $("#name").val();
		
		const data = {"no":userNo, "name":userName};
		console.log("no : " +data.no + "name : " + data.name);
			$.ajax({
				type:"post"
				,url:"/user/register"
				,data:JSON.stringify(data) //보낼때(request)
				,dataType:"json" //받을때(response)
				,contentType:"application/json"
				,cache:false
				,success:function(data) {
					console.log("data2 : " +data);
				}
			
			});
			
		});
		
	});
</script>
</head>
<body>
	<c:set var="no" value="<%=date%>"></c:set>
	
	<form id="frm" method="post" action="/user/register">
		회원번호 : <input type="text" name="no" id="no" value="${no}" /><br/>
		회원이름 : <input type="text" name="name" id="name" value="" /><br/>
		<input type="button" value="가입" id="btn" />
	</form>
</body>
</html>