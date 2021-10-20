<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.form-control2 {
  /* display:block; */
  width: 40%;
  height: calc(2.25rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  box-shadow: inset 0 0 0 rgba(0, 0, 0, 0);
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

input {
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
	
	function fn_owin() {
		window.open("/car/popup/cusList", "owin", "width=800,height=500");
	}

	$(function() {
		
		//1. 등록 버튼 클릭시 name값, id값 보정 후 submit
		$("#btnSubmit").on("click", function() {
			//고객 번호 체킹
			if($("#cusNum").val()=="") {
				alert("고객을 검색해주세요");
				return;
			}
			
			//자동차 등록 여부 체크
			var carCheck = 0;
			$("#divAdd div").each(function(index) {
				carCheck++;
			});
			
			if(carCheck<1) {
				alert("자동차를 등록해주세요");
				return;
			}
			
			var cnt = 0;
			var error = 0;
			//1. name값 보정
			$("#divAdd div").each(function(index) {
				console.log(cnt);
				if($(this).find("input[name='carNum']").val()==""){alert("자동차번호를 입력해주세요");error=1;return;}
				$(this).find("input[name='carNum']").attr("name", "carVo[" + cnt + "].carNum");
				$(this).find("input[id='carNum']").attr("id", "carVo[" + cnt + "].carNum");
				
				if($(this).find("input[name='mk']").val()==""){alert("제조사를 입력해주세요");error=1;return;}
				$(this).find("input[name='mk']").attr("name", "carVo[" + cnt + "].mk");
				$(this).find("input[id='mk']").attr("id", "carVo[" + cnt + "].mk");
				
				if($(this).find("input[name='py']").val()==""){alert("연식을 입력해주세요");error=1;return;}
				$(this).find("input[name='py']").attr("name", "carVo[" + cnt + "].py");
				$(this).find("input[id='py']").attr("id", "carVo[" + cnt + "].py");
				
				if($(this).find("input[name='driDist']").val()==""){alert("주행거리를 입력해주세요");error=1;return;}
				$(this).find("input[name='driDist']").attr("name", "carVo[" + cnt + "].driDist");
				$(this).find("input[id='driDist']").attr("id", "carVo[" + cnt + "].driDist");
				
				cnt = cnt + 1;
			});
			
			//2. form을 submit
			if(error<1) {
				$("#carFrm").submit();
			}
		});
		
		//자동차 추가 클릭
		var cnt = 0;
		$("#adding").on("click", function() {
			
			var str = "<div style='float:left; clear: both; width: 100%;margin-bottom:10px;'>"
			+ "자동차 번호<input type='text' name='carNum' class='form-control2' id='carNum' placeholder='자동차 번호 입력'>"
			+ "제조사<input type='text' name='mk' class='form-control2' id='mk' placeholder='제조사 입력'><br/>"
			+ "연식<input type='text' name='py' class='form-control2' id='py' placeholder='연식 입력'>"
			+ "주행거리<input type='text' name='driDist' class='form-control2' id='driDist' placeholder='주행거리 입력'>"
			+ "</div>";
						
			$("#divAdd").append(str);
		});
		
		//자동차 정보 삭제
		$("#deleting").on("click", function() {
			/* 아이디가 divAdd인 div안의 div의 마지막꺼 삭제 */
			$("#divAdd > div:last").remove();
		});
	});

</script>
<div class="card card-primary" style="margin-top: 5%;">
	<div class="card-header">
		<h3 class="card-title">다수리 자동차 등록</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<form method="post" action="/car/insert" id="carFrm">
		<div class="card-body">
				고객번호
				<div style="display: flex;height: calc(2.25rem + 2px);width: 50%;">
					<input type="text" name="cusNum" class="form-control" id="cusNum" placeholder="고객번호 입력" readonly>
					<button type="button" class="btn btn-lg btn-secondary" onclick="fn_owin()" style="line-height: 10px;margin-left: 10px;">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div style="float: right;">
					<span style="cursor: pointer;" id="adding">[추가]</span>&nbsp;
					<span style="cursor: pointer;" id="deleting">[삭제]</span><br/>
				</div>
				<br/><br/>
				<div id="divAdd">
				<!-- jquery로 추가해줌 -->
				</div> 
		</div>
		<!-- /.card-body -->

		<div class="card-footer" style="text-align: right;">
			<button type="button" class="btn btn-primary" id="btnSubmit">등록</button>
			<button type="button" class="btn btn-default" onclick="javascript:location.href='/cus/list'">취소</button>
		</div>
	</form>
</div>