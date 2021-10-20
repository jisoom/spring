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
	<section>
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
		<header class="major">
			<h3>출제 이력</h3>
		</header>
		<section>
			<form method="post" action="#">
				<div class="row gtr-uniform">

					<!-- Break -->
					<div class="col-2 col-12-xsmall">
						<select name="demo-category" id="demo-category">
							<option value="">전체</option>
							<option value="">-----</option>
							<option value="1">등록일자</option>
							<option value="1">수강여부</option>
							<option value="1">이름</option>
						</select>
					</div>

					<!-- Break -->
					<div class="col-6 col-12-xsmall">
						<input type="text" name="demo-name" id="demo-name" value=""
							placeholder="검색어를 입력 해주세요.">
					</div>

					<!-- Break -->
					<div class="col-4 col-12-xsmall">
						<ul class="actions">
							<li><input type="submit" value="검색" class="primary"></li>
						</ul>
					</div>
				</div>
			</form>
			<div style="text-align: right; margin-bottom: 10px;">
				<button id="testBtn" type="button" onclick="fn_testCreate()">추가</button>
			</div>
			<div class="table-wrapper">
				<table class="alt">
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
					</tbody>
				</table>

			</div>

			<!-- *********************************검색 & 리스트 끝************************************* -->



			<!-- *********************************페이징 처리 시작************************************* -->
			<ul class="pagination">
				<li><span class="button disabled">Prev</span></li>
				<li><a href="#" class="page active">1</a></li>
				<li><a href="#" class="page">2</a></li>
				<li><a href="#" class="page">3</a></li>
				<li><span>…</span></li>
				<li><a href="#" class="page">8</a></li>
				<li><a href="#" class="page">9</a></li>
				<li><a href="#" class="page">10</a></li>
				<li><a href="#" class="button">Next</a></li>
			</ul>
			<!-- *********************************페이징 처리 끝************************************* -->
		</section>
	</section>
</body>
</html>