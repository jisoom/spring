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
	margin: 0  0 10px 20px;
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

article > a:hover {
	text-decoration: none;
}

article > a:hover h3{
	font-size:1.25em;
} 
article > a:hover p {
	font-weight: normal;
	font-size: 14px;
}

article a:hover>.list-wrap {
	transform: scale(1.1);
	transition: 0.3s;
}
.posts article:after {
    background: rgba(210, 215, 217, 0.75);
    bottom: -3em;
    content: '';
    display: block;
    height: 1px;
    position: absolute;
    right: 0;
    width: calc(100% + 6em);
}
.posts article:before {
    background: rgba(210, 215, 217, 0.75);
    content: '';
    display: block;
    height: calc(100% + 6em);
    left: -3em;
    position: absolute;
    top: 0;
    width: 1px;
}

</style>
<script type="text/javascript">
/* window.open 할 때 a태그의 id 넘겨주고 선택한 색상 디비에 저장... -> $(function)할 때 강의 색상 디비에 저장된 색상으로 조회 */
/* function fn_colorList() {
	window.open("/color/colorList","color", "width=350,height=300");
}  */
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
	<section>
		<header class="major">
			<h3>내 수강 목록</h3>
		</header>
		
		<div class="posts">
			<article>
				<!-- a태그로 감싸진 박스 누르면 수강 상세정보 페이지로 이동 -->
				<a href="#">
					<div class="list-wrap">
						<!-- 조회된 리스트 갯수만큼 아이디 list[i] 부여 -->
						<div id="list1" class="colorBox"></div>
						<h3>영어-1</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<!-- 색상 변경 할 지 안할지 미정.. -->
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
			<article>
				<a href="#">
					<div class="list-wrap">
						<div id="list2" class="colorBox"></div>
						<h3>영어-2</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
			<article>
				<a href="#">
					<div class="list-wrap">
						<div id="list3" class="colorBox"></div>
						<h3>영어-3</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
			<article>
				<a href="#">
					<div class="list-wrap">
						<div id="list4" class="colorBox"></div>
						<h3>수학-1</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
			<article>
				<a href="#">
					<div class="list-wrap">
						<div id="list5" class="colorBox"></div>
						<h3>수학 -2</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
			<article>
				<a href="#">
					<div class="list-wrap">
						<div id="list6" class="colorBox"></div>
						<h3>수학 -3</h3>
						<p>담당 강사 : xxx 강의실 : 402호 </p>
						<p>수강 기간 : 2021/09/03~2021/10/15</p>
					</div>
				</a>
				<ul class="actions">
					<li><button type="button" onclick="fn_colorList()">More</button></li>
				</ul>
			</article>
		</div>
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
</body>
</html>