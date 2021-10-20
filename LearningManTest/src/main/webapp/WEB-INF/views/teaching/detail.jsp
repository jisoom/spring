<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>담당 강의</title>
<style type="text/css">
#teachingTable td:nth-child(odd) {
	text-align: right;
}

input[type="text"] {
	cursor: default;
}
</style>
</head>
<body>
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 6);"><a class="button"
				href="<%=request.getContextPath()%>/teaching/detail">강의 정보</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="<%=request.getContextPath()%>/teaching/attend">출결 관리</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary"
				href="#">수강생 조회</a></li>
			<!-- 수강생 클릭 -> 수강생 리스트 출력 /상세 조회 -> 성적등록  -->
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
					<h1 class="m-0">담당 강의</h1>
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
		<table class="tableList">
			<tr>
				<td class="textAlignR cursorD">개설 강의명 :</td>
				<td colspan="3"><input type="text" class="form-control"
					id="usr" value="수학 1학년 1학기" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="textAlignR">과목 :</td>
				<td><input type="text" class="form-control" id="usr" value="수학"
					readonly="readonly"></td>
				<td class="textAlignR">학년 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="1학년" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="textAlignR">요일 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="월,수" readonly="readonly"></td>
				<td class="textAlignR">교시 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="1,2,3" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="textAlignR">강의 시작일 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="2021-09-01" readonly="readonly"></td>
				<td class="textAlignR">강의 종료일 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="2021-09-30" readonly="readonly"></td>
			</tr>
			<tr>			
				<td class="textAlignR">
					<div class="custom-control custom-checkbox">
				<input id="temp" class="custom-control-input custom-control-input-danger" type="checkbox"
					value="정연"><label for="temp" class="custom-control-label">정연</label>
		            </div>
				</td>
				<td><input type="text" class="form-control" id="usr"
					value="301호" readonly="readonly"></td>
				<td class="textAlignR">진행상태 :</td>
				<td><input type="text" class="form-control" id="usr"
					value="진행중" readonly="readonly"></td>
			</tr>
		</table>
	</div>
</body>
</html>