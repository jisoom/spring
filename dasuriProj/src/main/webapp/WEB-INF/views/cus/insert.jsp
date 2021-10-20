<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	$(function() {
		CKEDITOR.replace("cusDetail");
		
		//이미지 미리보기 처리
		$("#cusImage").on("change", handleImgFileSelect);
	});

	//e : 이미지가 change된 이벤트
	function handleImgFileSelect(e) {
		//파일 객체에 이미지 파일을 담음
		var files = e.target.files;
		//멀티 파일이라면 배열로 처리
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			//파일 객체의 타입이 이미지인지 체킹
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			//파일을 sel_file 변수에 넣음
			sel_file = f;
			
			//파일을 읽는 reader 객체 생성
			var reader = new FileReader(); //(1)
			reader.onload = function(e) { // (3)
				//e.target.result : base64형태의 이미지 자체
				$("#img").attr("src", e.target.result);
				$("#cusImageLabel").text(e.target.result);
			}
			//f : filesArr 파일 배열에 들어있는 파일 객체 자체
			reader.readAsDataURL(f); //(2) f(이미지 파일 객체를 ) 다읽으면 => onload 됐다고 인식 ->(3)으로 이동
		}); //end for
	}
	
	function fn_check() {
		//이름
		var v_cusNm = document.getElementById("cusNm");
		//우편번호
		var v_zipcode = document.getElementById("zipcode");
		//주소
		var v_addr1 = document.getElementById("addr1");
		//상세주소
		var v_addr2 = document.getElementById("addr2");
		//연락처
		var v_pne = document.getElementById("pne");
		//고객 상세정보
		var v_cusDetail = document.getElementById("cusDetail");
		//고객 이미지
		var v_cusImage = document.getElementById("cusImage");
		
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
		if (v_cusDetail.value == "") {
			alert("상세정보를 입력해주세요");
			return false;
		}
		if (v_cusImage.value == "") {
			alert("사진을 등록해주세요");
			return false;
		}

		//return false; //submit을 시키진 않음
		return true; // submit함
	}
</script>
<div class="card card-primary" style="margin-top: 5%;">
	<div class="card-header">
		<h3 class="card-title">다수리 고객 등록</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<form method="post" action="/cus/insert" onsubmit="return fn_check()" 
		enctype="multipart/form-data">
		<input type="hidden" name="addr" id="addr" value="">
		<div class="card-body">
			<div class="form-group">
				<label for="cusNm">이름</label> 
				<input type="text" name="cusNm" class="form-control" id="cusNm" placeholder="이름 입력" >
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> 
				<input type="password" name="pwd" class="form-control" id="pwd" placeholder="비밀번호 입력">
			</div>
			<div class="form-group">
				<label for="addr1">우편번호</label> 
				<input type="text" name="zipcode" class="form-control" id="zipcode" placeholder="우편번호 입력">
			</div>
			<div class="form-group">
				<label for="addr1">주소</label> 
				<input type="text" name="addr1" class="form-control" id="addr1" placeholder="주소 입력"> 
			</div>
			<div class="form-group">
				<label for="addr2">상세 주소</label> 
				<input type="text" name="addr2" class="form-control" id="addr2" placeholder="상세주소 입력">
			</div>
			<div class="form-group">
				<label for="pne">연락처</label> 
				<input type="text" name="pne" class="form-control" id="pne" placeholder="연락처 입력">
			</div>
			<div class="form-group">
				<label for="cusDetail">상세정보</label>
				<textarea class="form-control" id="cusDetail" name="cusDetail" rows="5" cols="10"></textarea> 
			</div>
			<div class="form-group">
				<label for="cusImage">사진</label>
				<div class="img_wrap" style="margin-bottom: 10px;">
					<img id="img" />
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="cusImage" name="cusImage" >
					<label class="custom-file-label" for="cusImage" id="cusImageLabel">사진을 선택하세요</label>
				</div>
			</div>
		</div>
		<!-- /.card-body -->

		<div class="card-footer" style="text-align: right;">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-default" onclick="javascript:location.href='/cus/list'">취소</button>
		</div>
	</form>
</div>