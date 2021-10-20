<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery.min.js"></script>
<title>내강의 목록</title>
<style type="text/css">
.list-wrap {
	display: block;
	width: 100%;
	background-color: #fafafa;
	border-radius: 0.375em;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.list-wrap h3 {
	margin: 0 0 10px 20px;
}

.list-wrap p {
	color: #7f888f;
	margin-left: 20px;
	margin-bottom: 5px;
	font-size: 14px;
}

.colorBox {
	border-radius: 0.375em;
	display: block;
	position: relative;
	height: 80px;
	background-color: red;
	margin-bottom: 20px;
}

article.lectureList>a:hover {
	text-decoration: none;
}

article.lectureList a:hover>.list-wrap {
	transform: scale(1.1);
	transition: 0.2s;
}
</style>
<script type="text/javascript">
$(function () {
	$("#list1").css("background-color", "#FFA7A7");
	$("#list2").css("background-color", "#FFC19E");
	$("#list3").css("background-color", "#FFE08C");
	$("#list4").css("background-color", "#B2EBF4");
	$("#list5").css("background-color", "#B2CCFF");
	$("#list6").css("background-color", "#B7F0B1");
});
</script>
</head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">내 강의 목록</h1>
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

	<div class="posts">
		<article class="lectureList">
			<!-- a태그로 감싸진 박스 누르면 수강 상세정보 페이지로 이동 -->
			<a href="#">
				<div class="list-wrap">
					<!-- 조회된 리스트 갯수만큼 아이디 list[i] 부여 -->
					<div id="list1" class="colorBox"></div>
					<h3>영어-1</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			<!-- 색상 변경 할 지 안할지 미정.. -->
			
		</article>
		<article class="lectureList">
			<a href="#">
				<div class="list-wrap">
					<div id="list2" class="colorBox"></div>
					<h3>영어-2</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			
		</article>
		<article class="lectureList">
			<a href="#">
				<div class="list-wrap">
					<div id="list3" class="colorBox"></div>
					<h3>영어-3</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			
		</article>
		<article class="lectureList">
			<a href="#">
				<div class="list-wrap">
					<div id="list4" class="colorBox"></div>
					<h3>수학-1</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			
		</article>
		<article class="lectureList">
			<a href="#">
				<div class="list-wrap">
					<div id="list5" class="colorBox"></div>
					<h3>수학 -2</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			
		</article>
		<article class="lectureList">
			<a href="#">
				<div class="list-wrap">
					<div id="list6" class="colorBox"></div>
					<h3>수학 -3</h3>
					<p>담당 강사 : xxx 강의실 : 402호</p>
					<p>수강 기간 : 2021/09/03~2021/10/15</p>
				</div>
			</a>
			
		</article>
	</div>
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