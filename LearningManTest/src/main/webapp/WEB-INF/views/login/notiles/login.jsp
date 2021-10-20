<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>러닝맨 로그인</title>
<style type="text/css">
	body{
		background-image: url("/resources/images/login.jpg");
		background-size: 100%;
		background-attachment:fixed;
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
	}
	#login_wrapper { 
		background-color: white;
	    border: 20px solid lightblue;
	    padding: 5px 20px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 450px; height: 250px;
	    margin-left: -220px;
	    margin-top : -160px;
	    
	    display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	} 
	h1{
		font-size: 25px;
		padding-bottom: 20px;
	}
	.form{
		width: 300px;
	}
	.form > div{
		display: flex;
		justify-content: center;
		padding-bottom: 7px;
		align-items: center;
	}
	label{
		flex: 1;
		text-align: left;
	}
	button{
		width: 85px;
		float: right;
		padding: 3px;
	}
	input {
		padding: 5px;
	}
	find {
		display: flex;
	}
</style>
</head>
<body>
	<div id="login_wrapper">
		<div>
			<h1>Learning Man Academy</h1>
		</div>
		<div>
			<form method="post" action="<%=request.getContextPath()%>/home">
				<div>
					<label>아이디</label>
					<input type="text" id="id" name="id" maxlength="20" placeholder="username" required>
				</div>
				<div>
					<label>비밀번호</label>
					<input type="password" id="pwd" name="pwd" maxlength="20" placeholder="password" required>
				</div>
				<button type="submit" id="btn_login" >로그인</button>
			</form>
		</div>
		<div id="find">
			<div class="custom-control custom-checkbox">
				<input id="temp" class="custom-control-input custom-control-input-danger" type="checkbox"
					value="정연"><label for="temp" class="custom-control-label">정연</label>
		    </div>
			<a href="#">아이디 찾기</a>
			<a href="#">비밀번호 찾기</a>
		</div>
	</div>
</body>
</html>