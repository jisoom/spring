<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<!-- *********************************서브 메뉴 시작************************************* -->

	<!-- 수강생 내강의 부분 서브메뉴  -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 6);"><a class="button" href="#">수강 강의</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">출결 조회</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">온라인 강의</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">성적 조회</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">강의 평가</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">질문 게시판</a></li>
		</ul>
	</header>

	<!-- 강사 내강의 부분 서브메뉴  -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">담당 강의</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">출결 관리</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">수강생 조회</a></li>
			<!-- 수강생 클릭 -> 수강생 리스트 출력 /상세 조회 -> 성적등록  -->
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">온라인 강의</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">강의 평가 조회</a></li>
			<li style="width: calc(100%/ 6);"><a class="button primary" href="#">질문 게시판</a></li>
		</ul>
	</header>

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

	<!-- 관리자 수강생 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<!-- 수강생 목록에서 버튼으로 수강생 정보 입력 후 등록 -->
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">수강생 목록</a></li>
			<!-- 수강생 정보 검색해서  아이디,비밀번호 등록-->
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">수강생 계정 등록</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">수강 신청</a></li>
		</ul>
	</header>

	<!-- 관리자 직원 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 2);"><a class="button primary"
				href="#">직원 목록</a></li>
			<li style="width: calc(100%/ 2);"><a class="button primary"
				href="#">직원 계정 등록</a></li>
		</ul>
	</header>

	<!-- 관리자 강의 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 5);"><a class="button primary" href="#">개설 강의 관리</a></li>
			<li style="width: calc(100%/ 5);"><a class="button primary" href="#">온라인 강의 영상 관리</a></li>
			<li style="width: calc(100%/ 5);"><a class="button primary" href="#">강의 관리</a></li>
			<li style="width: calc(100%/ 5);"><a class="button primary" href="#">과목 관리</a></li>
			<li style="width: calc(100%/ 5);"><a class="button primary" href="#">강의실 관리</a></li>
		</ul>
	</header>

	<!-- 관리자 상담 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 2);"><a class="button primary"
				href="#">신입 상담 신청서 조회</a></li>
			<li style="width: calc(100%/ 2);"><a class="button primary"
				href="#">상담 내역 등록</a></li>
		</ul>
	</header>

	<!-- 관리자 매출 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">전체 매출 조회</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">강사별 매출 조회</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">월별 매출 조회</a></li>
		</ul>
	</header>

	<!-- 관리자 노선 관리 서브메뉴 -->
	<header class="subMenu">
		<ul>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">노선 관리</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">셔틀버스 관리</a></li>
			<li style="width: calc(100%/ 3);"><a class="button primary"
				href="#">운행 정보 관리</a></li>
		</ul>
	</header>
	<!-- *********************************서브 메뉴 끝************************************* -->

	<!-- *********************************검색 & 리스트 시작************************************* -->

	<section>
		<h2>수강생 목록</h2>
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
		<div class="table-wrapper">
			<table class="alt">
				<thead>
					<tr>
						<th>학년</th>
						<th>학년</th>
						<th>학년</th>
						<th>학년</th>
						<th>학년</th>
						<th>학년</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>xx고등학교</td>
						<td>대전광역시 대덕구 오정동</td>
						<td>3dddddddddddddddddddddddd</td>
						<td>dddddddddddddddddddddddddd3</td>
						<td>3</td>
					</tr>
					<tr>
						<td>홍길동</td>
						<td>xx고등학교</td>
						<td>ddddddddddddddddddddddddddddddd3</td>
						<td>3dddddddddddddddddddddddd</td>
						<td>dddddddddddddddddddddddddd3</td>
						<td>3</td>
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

	<!-- *********************************아코디언 메뉴 시작************************************* -->

		<section class="ui-accordion">
			<div class="aco-item" id="aco-item-1">
				<strong class="aco-tit"><span class="qna-num">01</span>질문1</strong>
				<div class="qna-txtBox">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Architecto libero nemo obcaecati autem, magnam cumque veritatis
						non inventore ipsa quis. Consectetur delectus aperiam velit minus
						incidunt illum aut veniam impedit.</p>
				</div>
			</div>
			<div class="aco-item" id="aco-item-2">
				<strong class="aco-tit"><span class="qna-num">02</span>질문2</strong>
				<div class="qna-txtBox">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Architecto libero nemo obcaecati autem, magnam cumque veritatis
						non inventore ipsa quis. Consectetur delectus aperiam velit minus
						incidunt illum aut veniam impedit.</p>
				</div>
			</div>
		</section>
		<!-- *********************************아코디언 메뉴 끝************************************* -->
	</section>
	


</body>
</html>