<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>출결 관리</title>
</head>
<body>
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="<%=request.getContextPath()%>/teaching/detail">강의 정보</a></li>
			<li style="width: calc(100%/ 6);"><a class="button"
				href="<%=request.getContextPath()%>/teaching/attend">출결 관리</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="#">수강생 조회</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="#">온라인 강의</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="#">강의 평가 조회</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="#">질문 게시판</a></li>
		</ul>
	</header>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">출결 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Dashboard v1</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<div class="table-wrapper">
		<div style="text-align: center; margin-bottom: 10px;">
			<h3>[&lt;] 2021-09-04 [&gt;]</h3>
		</div>
		
		<table class="tableList" style="text-align: center;">
			<thead>
				<th>순번</th>
				<th>이름</th>
				<th>출석</th>
				<th>결석</th>
				<th>지각</th>
				<th>조퇴</th>
				<th>비고</th>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>2</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>3</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>4</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>5</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>6</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>7</td>
					<td>홍길동</td>
					<td><button type="button" class="button primary">출석</button></td>
					<td><button type="button" class="button info">결석</button></td>
					<td><button type="button" class="button warning">지각</button></td>
					<td><button type="button" class="button secondary">조퇴</button></td>
					<td><input type="text" class="form-control" id="usr" value=""
						readonly="readonly"></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>