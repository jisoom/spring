<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
// e : 이미지가 change된 이벤트
function handleImgFileSelect(e){
	// 파일 객체에 파일을 담음
	var files = e.target.files;
	// 멀티 파일이라면 배열로 처리
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		//파일을 sel_file변수에 넣음
		sel_file = f;
		console.log(f);
		//파일을 읽는 reader 객체 생성
		var reader = new FileReader(); //1)
		reader.onload = function(e){   //3)
			//e.target.result : 해당 파일의 명(경로 포함)
			//<img id='img' /> => <img id='img' src='경로+파일명' />
// 			$("#cusImg").attr("src", e.target.result);
			$("#attachLabel").text(sel_file.name);
// 			$("#attachLabel").text(e.target.result);
		}
		// f : filesArr파일 배열에 들어있는 파일 객체 자체
		reader.readAsDataURL(f); //2)f(이미지파일 객체를) 다 읽으면 => onload 했다라고 인식 -> 3)이동
	});
}

$(function(){
	CKEDITOR.replace("content");
	
	//파일 경로 보기
	$("#attach").on("change", handleImgFileSelect);
});

function fn_check(){
	//이름
	var cusNm = document.getElementById("cusNm");
	var cusPwd = document.getElementById("cusPwd");
	console.log(cusNm);
	console.log(cusPwd);
	if(cusNm.value.trim()==""){
		alert("이름 입력해주세요.");
		cusNm.focus();
		return false;
	}
	if(cusPwd.value.trim()==""){
		alert("비밀번호를 입력해주세요.");
		cusPwd.focus();
		return false;
	}
	
	
	//submit함
	return true;
}
</script>
<div class="card card-primary" style="margin-top: 5%;">
	<div class="card-header">
		<h3 class="card-title">자유게시글 등록</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<form method="post" action="/freeboard/insert" enctype="multipart/form-data" onsubmit="return fn_check()">
		<div class="card-body">
			<div class="form-group">
				<label for="writer">고객 이름</label> 
				<input type="text" class="form-control" id="writer" name="writer" placeholder="이름을 입력해주세요"
				 value="${sessionScope.nm}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="title">글제목</label> 
				<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="content">글내용</label>
				<textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요"
					cols="50" rows="10"></textarea>
			</div>
			<div class="form-group">
				<label for="cusImage">첨부파일</label>
				<div class="img_wrap">
					<img id="cusImg" alt="" src="" width="300px">
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="attach" name="attach">
					<label class="custom-file-label" for="attach" id="attachLabel">파일을 선택하세요</label>
				</div>
			</div>
		</div>
		<!-- /.card-body -->

		<div class="card-footer text-right">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-primary" onclick="javascript:location.href='/freeboard/list'">취소</button>
		</div>
	</form>
</div>
