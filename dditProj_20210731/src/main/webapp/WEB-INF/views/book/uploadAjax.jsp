<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Upload with Ajax</title>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
//특정한 확장자를 제외한 파일들의 업로드를 제한. 첨부파일을 이용한 웹 공격을 막기위함.
//exe, sh, zip 등의 업로드는 제한. 특정 크기 이상의 파일은 업로드 제한.
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

	//파일 명과 파일의 크기를 파라미터로 받음
	function checkextension(fileName, fileSize) {
	
		//5MB를 초과하지 못하게 함
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		//파일명의 정규식 테스트
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	

	$(function(){
		//input
		function readURL(input) {
			//input 파라미터에 파일이 있다면..
			if(input.files && input.files[0]) {
				//파일을 읽기 위한 FileReader객체를 생성
				var reader = new FileReader();
				reader.onload=function(e) {
					//파일 읽기 성공 시 처리
					//<img id="blah" src="/resources/images/dog1.jpg" alt="이미지 미리보기" />
					//이미지 요소의 src속성 <- 읽어들인 File 내용을 지정함
					console.log(e.target.result);
					$("#blah").attr("src", e.target.result);
				}
				//File 내용을 읽어 dataURL형식의 문자열로 저장
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		$("#imgInp").change(function() {
			//선택한 이미지의 경로 표시
			console.log(this.value);
			//imgInp 즉, 파일  요소를 readURL함수의 파라미터로 던짐
			readURL(this);
		});
		
		$("#uploadBtn").on("click", function (e) {
			//파일 업로드 시 jQuery를 이용하는 경우 FormData 객체를 이용함
			//FormData는 가상의 <form>태그와 같음
			//Ajax를 이용한 파일 업로드는 FormData에 File파라미터(name과 value)를 담아 전송
			//File파라미터(String, File 객체)
			var formData = new FormData();
			
			//input 태그들 중에서 name 속성의 값이 uploadFile인 요소(태그)를 찾음
			var inputFile = $("input[name='uploadFile']");
			//.files : 
			console.log(inputFile[0].files);
			var files = inputFile[0].files;
			//inputFile 객체에 들어있는 File들의 개수만큼 반복
			for(var i=0; i<files.length; i++) {
				
				//파일의 크기와 확장자 테스트(함수에 파일명과 파일 사이즈를 파라미터로 던짐)
				//!true => false라면..
				if(!checkextension(files[i].name, files[i].size)) {
					return false;
				}
				//가상의 form 태그 하위로 File 파라미터를 넣어줌
				formData.append("uploadFile",files[i]);
				
			}//end for
			
			//첨부파일 데이터를 formData에 추가한 후 Ajax를 통해 formData 자체를 전송
			//processData와 contentType은 반드시 false로 지정해야만 전송이 됨
			//컨트롤러에서는 MultipartFile 타입을 이용하여 첨부파일 데이터를 처리함
			//dataType : 컨트롤러에서 오는 자료형
			$.ajax({
				url:'/uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				dataType:'json',
				success:function(result) {
					for(var i=0 in result) {
						console.log(result[i]);
						//id가 fileView인 div 요소 하위로 img 태그가 들어감
						//$("#fileView").append("<img src='/resources/images/"+ result[i] +"'/>");
					}
					alert("업로드가 완료되었습니다.");
				}
				
				
			});//end ajax
		});
		
	});
</script>
</head>
<body>
	<!-- 가상의 form 태그 만들기 -->
	<!-- 가상의 form 안에 파일 넣기 -->
<!-- 	<form>
	File객체
	File객체
	File객체
	</form> -->

	<h1>Ajax를 이용하여 업로드 하기</h1>
	<div id="fileView">
		<img id="blah" src="/resources/images/dog1.jpg" alt="이미지 미리보기" />
	</div>
	
	<div class="uploadDiv">
		<input type="file" id="imgInp" name="uploadFile" multiple />
	</div>
	<button id="uploadBtn">Upload</button>
</body>
</html>