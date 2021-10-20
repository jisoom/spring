<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function() {
		
	});

	function fn_check() {
		//이름
		var v_nm = document.getElementById("nm");
		//우편번호
		var v_addr1 = document.getElementById("addr1");
		//주소
		var v_addr2 = document.getElementById("addr2");
		//상세주소
		var v_addr3 = document.getElementById("addr3");
		//연락처
		var v_pne = document.getElementById("pne");
		//월급
		var v_sal = document.getElementById("sal");
		
		//isNaN : 자바스크립트 내장함수.
		//숫자가 아닌 값이 있으면 true, 숫자만 있으면 false
		if(isNaN(v_sal.value)){
			alert("월급은 숫자만 입력해주세요");
			return false;
		};
		
		if (v_nm.value == "") {
			alert("이름을 입력해주세요");
			return false;
		}
		if (v_addr1.value == "") {
			alert("우편번호를 입력해주세요");
			return false;
		}
		if (v_addr2.value == "") {
			alert("주소를 입력해주세요");
			return false;
		}
		if (v_addr3.value == "") {
			alert("상세 주소를 입력해주세요");
			return false;
		}
		if (v_pne.value == "") {
			alert("연락처를 입력해주세요");
			return false;
		}
		if (v_sal.value == "") {
			alert("월급을 입력해주세요");
			return false;
		}

		//EmpVO의 addr속성을 위한 요소.
		var v_addr = document.getElementById("addr");
		//주소 3개 하나로 합치기(addr 보낼때 hidden에 해당하는 name이 addr인 것을 보냄, 하지만 넘어갈 때 name이 addr1, addr2, addr3인 것도 넘어감)
		v_addr.value = v_addr1.value + " " + v_addr2.value + " " + v_addr3.value;

		//return false; //submit을 시키진 않음
		return true; // submit함
	}
</script>
<div class="card card-primary" style="margin-top: 5%;">
	<div class="card-header">
		<h3 class="card-title">다수리 직원 등록</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<form method="post" action="/emp/insert" onsubmit="return fn_check()">
		<input type="hidden" name="addr" id="addr" value="">
		<div class="card-body">
			<div class="form-group">
				<label for="nm">이름</label> 
				<input type="text" name="nm" class="form-control" id="nm" placeholder="이름 입력">
			</div>
			<div class="form-group">
				<label for="addr1">우편번호</label> 
				<input type="text" name="addr1" class="form-control" id="addr1" placeholder="우편번호 입력">
			</div>
			<div class="form-group">
				<label for="addr2">주소1</label> 
				<input type="text" name="addr2" class="form-control" id="addr2" placeholder="주소 입력"> 
				<input type="text" name="addr3" class="form-control" id="addr3" placeholder="상세주소 입력">
			</div>
			<div class="form-group">
				<label for="pne">연락처</label> 
				<input type="text" name="pne" class="form-control" id="pne" placeholder="연락처 입력">
			</div>
			<div class="form-group">
				<label for="sal">월급</label> 
				<input type="text" name="sal" class="form-control" id="sal" placeholder="숫자만 입력">
			</div>
		</div>
		<!-- /.card-body -->

		<div class="card-footer">
			<button type="submit" class="btn btn-primary">확인</button>
			<button type="button" class="btn btn-primary" onclick="javascript:location.href='/emp/list'">취소</button>
		</div>
	</form>
</div>