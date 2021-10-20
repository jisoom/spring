<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
function fn_testCreate() {
	location.href="/testInsert";
}
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">출제 이력</h1>
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
	<!-- 강사 시험출제 서브메뉴  -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">출제 이력</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">문제 출제</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">임시 저장</a></li>
		</ul>
	</header>

	<form method="post" action="#">
		<div class="row flexEnd">
			<table class="tableSearch">
				<tr>
					<td>
						<div class="col-2 col-12-xsmall">
							<select class="btn btn-default selectCategory"
								name="selectCategory">
								<option value="">전체</option>
								<option value="">-----</option>
								<option value="1">등록일자</option>
								<option value="1">수강여부</option>
								<option value="1">이름</option>
							</select>
						</div>
					</td>
					<td>
						<div class="col-12 col-12-xsmall">
							<input class="form-control inputText" type="text"
								name="demo-name" id="demo-name" value=""
								placeholder="검색어를 입력 해주세요.">
						</div>
					</td>
					<td>
						<div class="col-12 col-12-xsmall">
							<input type="submit" value="검색" class="form-control buttonSearch">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div style="text-align: right; margin-bottom: 10px;">
		<button class="button" type="button" onclick="fn_testCreate()">추가</button>
	</div>
	<div class="table-wrapper">
		<table class="tableList">
			<thead>
				<tr>
					<th>글번호</th>
					<th>문항 수</th>
					<th>시험 시간</th>
					<th>시험 제목</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>40개</td>
					<td>50분</td>
					<td>1월 모의고사</td>
				</tr>
				<tr>
					<td>2</td>
					<td>40개</td>
					<td>50분</td>
					<td>2월 모의고사</td>
				</tr>
				<tr>
					<td>3</td>
					<td>40개</td>
					<td>50분</td>
					<td>3월 모의고사</td>
				</tr>
			</tbody>
		</table>

	</div>

	<!-- *********************************검색 & 리스트 끝************************************* -->



	<!-- *********************************페이징 처리 시작************************************* -->
	<ul class="pagination flexCenter">
		<li><button class="button" disabled="disabled">Prev</button></li>
		<li><a href="#" class="page active">1</a></li>
		<li><a href="#" class="page">2</a></li>
		<li><a href="#" class="page">3</a></li>
		<li><span>…</span></li>
		<li><a href="#" class="page">8</a></li>
		<li><a href="#" class="page">9</a></li>
		<li><a href="#" class="page">10</a></li>
		<li><button class="button">Next</button></li>
	</ul>
	<!-- *********************************페이징 처리 끝************************************* -->
</body>
</html>