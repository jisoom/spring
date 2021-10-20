<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>내 정보 상세</title>
<style type="text/css">
#topLevelDiv{
	margin-top: 10px;	
}	
</style>
</head>
<body>
<section>
	<form method="post" action="#">
		<div class="row gtr-uniform">
			<div class="col-1">
				제목
			</div>
			<div class="col-11">
				<input type="text" name="demo-name" id="demo-name" value=""
					placeholder="Name">
			</div>
		</div>
		<div class="row gtr-uniform">
			<div class="col-1">
				시험과목
			</div>
			<div class="col-3">
				<select name="demo-category" id="demo-category">
					<option value="">--과목--</option>
					<option value="1">수학</option>
					<option value="1">영어</option>
				</select>
			</div>
		</div>
		<div class="row gtr-uniform">
			<div class="col-1">
				공개일
			</div>
			<div class="col-7">
				<input type="date" name="demo-email" id="demo-email" value="">
				<select name="demo-category" id="demo-category">
					<option value="">시</option>
					<option value="0">00</option>
					<option value="1">01</option>
					<option value="1">02</option>
					<option value="1">03</option>
					<option value="1">04</option>
					<option value="1">05</option>
				</select>
				<select name="demo-category" id="demo-category">
					<option value="">분</option>
					<option value="0">00</option>
					<option value="1">01</option>
					<option value="1">02</option>
					<option value="1">03</option>
					<option value="1">04</option>
					<option value="1">05</option>
				</select>
			</div>
		</div>
			<!-- Break -->
			<div class="col-12">
				<select name="demo-category" id="demo-category">
					<option value="">- Category -</option>
					<option value="1">Manufacturing</option>
					<option value="1">Shipping</option>
					<option value="1">Administration</option>
					<option value="1">Human Resources</option>
				</select>
			</div>
			<!-- Break -->
			<div class="col-4 col-12-small">
				<input type="radio" id="demo-priority-low" name="demo-priority"
					checked=""> <label for="demo-priority-low">Low</label>
			</div>
			<div class="col-4 col-12-small">
				<input type="radio" id="demo-priority-normal" name="demo-priority">
				<label for="demo-priority-normal">Normal</label>
			</div>
			<div class="col-4 col-12-small">
				<input type="radio" id="demo-priority-high" name="demo-priority">
				<label for="demo-priority-high">High</label>
			</div>
			<!-- Break -->
			<div class="col-6 col-12-small">
				<input type="checkbox" id="demo-copy" name="demo-copy"> <label
					for="demo-copy">Email me a copy</label>
			</div>
			<div class="col-6 col-12-small">
				<input type="checkbox" id="demo-human" name="demo-human" checked="">
				<label for="demo-human">I am a human</label>
			</div>
			<!-- Break -->
			<div class="col-12">
				<textarea name="demo-message" id="demo-message"
					placeholder="Enter your message" rows="6"></textarea>
			</div>
			<!-- Break -->
			<div class="col-12">
				<ul class="actions">
					<li><input type="submit" value="Send Message" class="primary"></li>
					<li><input type="reset" value="Reset"></li>
				</ul>
			</div>
		
	</form>
</section>	
</body>
</html>