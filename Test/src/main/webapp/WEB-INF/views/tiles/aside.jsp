<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Login -->
<section id="login" class="alt">
	<form method="post" action="#">
		아이디<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" />
		비밀번호<input type="password" name="pwd" id="pwd"
			placeholder="비밀번호를 입력하세요" />
	</form>
</section>

<!-- Menu -->
<nav id="menu">
	<header class="major">
		<h2>Menu</h2>
	</header>
	<ul>
		<!-- 공통 -->
		<li><a href="index.html">Homepage</a></li>
		<li><span class="opener">소개</span>
			<ul>
				<li><a href="#">학원 소개</a></li>
				<li><a href="#">학원 시간표</a></li>
				<li><a href="#">찾아오시는 길</a></li>
			</ul>
		</li>
		<li><span class="opener">커뮤니티</span>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">신입 상담 예약 신청</a></li>
				<li><a href="#">차량 노선 조회</a></li>
			</ul>
		</li>


		<!-- 수강생인 경우 -->
		<!-- 공통 포함 -->
		<li><span class="opener">강의</span>
			<ul>
				<li><a href="#">내 수강 목록</a></li>
				<li><a href="#">강의 시간표</a></li>
			</ul>
		</li>
		<li><span class="opener">온라인 시험</span>
			<ul>
				<li><a href="#">시험 목록</a></li>
				<!-- 학년, 과목 select박스로 선택 할 수 있음 (시험 응시는 수강생만 할 수 있음)  -->
				<li><a href="#">점수 확인</a></li>
				<!-- 응시한 시험 목록만 출력/ 옆에 점수 표시, 시험 문제 보기 버튼 => 오답노트 추가할 수 있음 -->
			</ul>
		</li>
		<li><a href="#">오답노트</a></li>
		<li><span class="opener">퀴즈 러닝</span>
			<ul>
				<li><a href="#">퀴즈 단어장 목록</a></li>
				<li><a href="#">즐겨 찾기</a></li>
				<li><a href="#">검색</a></li>
			</ul>
		</li>
		<li><span class="opener">내 정보</span>
			<ul>
				<li><a href="#">정보 상세</a></li>
				<li><a href="#">수강료 납부 내역</a></li>
			</ul>
		</li>
		
		
		<!-- 강사인 경우 -->
		<!-- 공통 포함 -->
		<li><span class="opener">강의</span>
			<ul>
				<li><a href="#">내 강의 목록</a></li>
				<li><a href="#">강의 시간표</a></li>
			</ul>
		</li>
		<li><span class="opener">온라인 시험</span>
			<ul>
				<li><a href="#">시험 목록</a></li>
				<li><a href="#">시험 출제</a></li>
			</ul>
		</li>
		<li><span class="opener">내 정보</span>
			<ul>
				<li><a href="#">정보 상세</a></li>
			</ul>
		</li>
		<li><span class="opener">업무 쪽지</span>
			<ul>
				<li><a href="#">쪽지 보내기</a></li>
				<li><a href="#">보낸 쪽지함</a></li>
				<li><a href="#">받은 쪽지함</a></li>
			</ul>
		</li>
		
		<!-- 관리자인 경우 -->
		<!-- 공통 포함 -->
		<li><span class="opener">내 정보</span>
			<ul>
				<li><a href="#">정보 상세</a></li>
			</ul>
		</li>
		<li><span class="opener">업무 쪽지</span>
			<ul>
				<li><a href="#">쪽지 보내기</a></li>
				<li><a href="#">보낸 쪽지함</a></li>
				<li><a href="#">받은 쪽지함</a></li>
			</ul>
		</li>
		<li><span class="opener">관리</span>
			<ul>
				<li><a href="#">수강생 관리</a></li>
				<li><a href="#">직원 관리</a></li>
				<li><a href="#">강의 관리</a></li>
				<li><a href="#">공지사항 관리</a></li>
				<li><a href="#">운영 일정 관리</a></li>
				<li><a href="#">문자 및 카톡 보내기</a></li>
				<li><a href="#">신입 상담 예약 관리</a></li>
				<li><a href="#">매출 관리</a></li>
				<li><a href="#">등하원 노선 관리</a></li>
			</ul>
		</li>
<!-- 		<li><a href="generic.html">Generic</a></li>
		<li><a href="generic.html">Generic</a></li>
		<li><a href="generic.html">Generic</a></li>
		<li><a href="elements.html">Elements</a></li>
		<li><span class="opener">Submenu</span>
			<ul>
				<li><a href="#">Lorem Dolor</a></li>
				<li><a href="#">Ipsum Adipiscing</a></li>
				<li><a href="#">Tempus Magna</a></li>
				<li><a href="#">Feugiat Veroeros</a></li>
			</ul></li>
		<li><a href="#">Etiam Dolore</a></li>
		<li><a href="#">Adipiscing</a></li>
		<li><span class="opener">Another Submenu</span>
			<ul>
				<li><a href="#">Lorem Dolor</a></li>
				<li><a href="#">Ipsum Adipiscing</a></li>
				<li><a href="#">Tempus Magna</a></li>
				<li><a href="#">Feugiat Veroeros</a></li>
			</ul></li>
		<li><a href="#">Maximus Erat</a></li>
		<li><a href="#">Sapien Mauris</a></li>
		<li><a href="#">Amet Lacinia</a></li>
	</ul>
</nav> -->

<!-- Section -->
<section>
	<header class="major">
		<h2>Ante interdum</h2>
	</header>
	<div class="mini-posts">
		<article>
			<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore aliquam.</p>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore aliquam.</p>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper
				dolore aliquam.</p>
		</article>
	</div>
	<ul class="actions">
		<li><a href="#" class="button">More</a></li>
	</ul>
</section>

<!-- Section -->
<section>
	<header class="major">
		<h2>Get in touch</h2>
	</header>
	<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare
		velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed
		aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus
		aliquam.</p>
	<ul class="contact">
		<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
		<li class="icon solid fa-phone">(000) 000-0000</li>
		<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
			Nashville, TN 00000-0000
		</li>
	</ul>
</section>

<!-- <a href="#sidebar" class="toggle">Toggle</a> -->