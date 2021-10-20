<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>근무 정보 입력</title>
<!-- css -->
<link href="/resources/style/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/style/jquery-ui.css">
<link rel="stylesheet" href="/resources/style/style.css">

<!-- js -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-1.12.4.js"></script>
<script src="/resources/js/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
		
		//사원의 특정 행을 클릭한다면..
		$(".trEmp").on("click", function(e) {
			var varEmpNum = $(this).find("td:eq(0)").text(); //사원번호1클릭하면 1출력됨
			
			//JSON 데이터로 만듦
			var data = {"empNum":varEmpNum};
			
			//사원 상세 정보 가져오기
			$.ajax({
				type:"post"
				,url:"/wk/selectEmpDetail"
				,data:JSON.stringify(data) //보낼 데이터
				,contentType:"application/json"
				,cache:false
				,success:function(data) {
					$("input[name='empNum']").val(data.empNum);
					$("input[name='empNm']").val(data.empNm);
					$("input[name='zipCode']").val(data.zipCode);
					$("input[name='addr1']").val(data.addr1);
					$("input[name='addr2']").val(data.addr2);
					$("input[name='phnNum']").val(data.phnNum);
					$("input[name='pos']").val(data.pos);
					$("input[name='deptNm']").val(data.deptNm);
				},error:function(xhr) {
					alert("관리자에게 문의하세요.");
				}
			});
		}); //end trEmp
		
		//사업장의 특정 행을 클릭한다면..
		$(".trSite").on("click", function(e) {
			//this : 클릭된 tr
			//find("td..") : td요소를 찾으면 3개의 요소가 찾아짐. 0,1,2
			//eq(0) : 인덱스 번호가 0번인 td를 찾음 (equal)
			//text() : <td>2021001</td> => 2021001
			
			//사업장 번호
			var varSiteNum = $(this).find("td:eq(0)").text();
			$("input[name='siteNum']").val(varSiteNum);
			
			//사업장 이름
			var varSiteNm = $(this).find("td:eq(1)").text();
			$("input[name='siteNm']").val(varSiteNm);
		}); //end trSite
		
		//datepicker 사용
		$("#wkStartDt").datepicker({
				dateFormat:'yy-mm-dd', //년-월-일 데이터 형식
				changeYear:true, //년도 바꿀수 있게
				changeMonth:true, //월 바꿀수 있게
				showMonthAfterYear:true, //월, 년도 셀렉트 박스 순서를 년도, 월로 바꿈
				dayNamesMin:['일','월','화','수','목','금','토'], //표시되는 요일
				monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //표시되는 월		
		});//end datepicker
		
		$("#btn").on("click", function() {
			//var f = $("form[name='frm']"); //name 속성의 값이 frm인 form 태그 안의 모든 요소를 f에 담음
			var f = $("#frm"); //id가 frm인 form 태그 안의 모든 요소를 f에 담음
			
			if($("input[name='empNum']").val() == "") {
				alert("사원을 선택해주세요");
			}else if($("input[name='empNm']").val() == "") {
				alert("사원을 선택해주세요");
			}else if($("input[name='siteNum']").val() == "") {
				alert("사업장을 선택해주세요");
			}else if($("input[name='siteNm']").val() == "") {
				alert("사업장을 선택해주세요");
			}else{
				f.attr("method", "post");
				f.attr("action","/wk/insert");
				f.submit();
			}
		}); //end btn 빈값 확인 후 전송
		
		$(".delEmp").on("click", function() {
			//선택한 이미지의 value값을 가져옴
			console.log("empNum : " + $(this).attr("value")); //1선택하면 1출력
			var varEmpNum = $(this).attr("value");
			
			var data = {"empNum":varEmpNum};
			
			$.ajax({
				type:"post"
				,url:"/wk/deleteEmp"
				,data:JSON.stringify(data) //보내는 값
				,contentType:"application/json"
				,cache:false
				,success:function(data){
					console.log("empNum(returned) : " + data.empNum);
					
					if(data.empNum>0){//삭제성공
						//페이지 새로고침
						parent.location.reload();
					}else{//삭제실패(data.empNum이 0일때 실패한 것임)
						alert("삭제할 수 없는 데이터입니다.");
					}
				}
			});
		}); //end delEmp
		
		$(".delSite").on("click", function() {
			//선택한 이미지의 value값을 가져옴
			console.log("siteNum : " + $(this).attr("value")); //1선택하면 1출력
			var varSiteNum = $(this).attr("value");
			
			var data = {"siteNum":varSiteNum};
			
			$.ajax({
				type:"post"
				,url:"/wk/deleteSite"
				,data:JSON.stringify(data) //보내는 값
				,contentType:"application/json"
				,cache:false
				,success:function(data){
					console.log("siteNum(returned) : " + data.siteNum);
					
					if(data.siteNum>0){//삭제성공
						//페이지 새로고침
						parent.location.reload();
					}else{//삭제실패(data.siteNum이 0일때 실패한 것임)
						alert("삭제할 수 없는 데이터입니다.");
					}
				}
			});
		}); //end delEmp
		
	});
	
	//사원 등록
	function fn_regEmp() {
		window.open("/emp/insert", "owin", "width=700, height=700");
	}
	
	//사업장 등록
	function fn_regSite() {
		window.open("/site/popUp/insert", "owin", "width=700, height=700");
	}
	
</script>
</head>
<body style="margin: 0px">
	<div id="box">
	<h1 style="text-align: center;">근무 정보 입력</h1>
	
	
		<!-- 사원 정보 상세 -->
		<div id="top">
			<h2>사원 정보 상세</h2>	
			<table border="1" style="width: 100%;" cellspacing="0" cellpadding="0">
				<tr style="text-align: left;">
					<th style="width: 5%;">사원 <br/>번호</th>
					<td style="width: 25%;"><input type='text' name='empNum' /></td>
					<th style="width: 5%;">사원 명</th>
					<td style="width: 25%;"><input type='text' name='empNm' /></td>
					<th style="width: 5%; border-right: none; background-color: #EAEAEA;"></th>
					<td style="width: 25%; border-left: none; background-color: #EAEAEA;"></td>
				</tr>
				<tr style="text-align: left;">
					<th>우편 <br/>번호</th>
					<td><input type='text' name='zipCode' /></td>
					<th>주소1</th>
					<td><input type='text' name='addr1' /></td>
					<th>주소2</th>
					<td><input type='text' name='addr2' /></td>
				</tr>
				<tr style="text-align: left;">
					<th>전화 <br/>번호</th>
					<td><input type='text' name='phnNum' /></td>
					<th>직급</th>
					<td><input type='text' name='pos' /></td>
					<th>부서 명</th>
					<td><input type='text' name='deptNm' /></td>
				</tr>
			</table>
		</div>
		
		
		<hr />
		
		
		<div class="wrap" style="display: flex;">
		
			<!-- 사원 정보 목록 -->
			<div id="left" class="container1" style="width: 50%;">
			<h2>사원 목록&nbsp;&nbsp;<input type="button" value="사원 등록" onclick="fn_regEmp()"></h2>
				<table border="1" style="width: 100%;" cellspacing="0" cellpadding="0">
					<tr>
						<th>사원 번호</th>
						<th>사원 명</th>
					</tr>
					<c:forEach var="empVo" items="${empVoList}">
						<tr class="trEmp" style="cursor: pointer;">
							<td>${empVo.empNum}</td>
							<td>
								${empVo.empNm}&nbsp; 
								<img alt="삭제" src="/resources/images/del.jpg" 
								style="width:30px;height:30px;z-index: 1;"
								title="삭제" class="delEmp" value="${empVo.empNum}" />
							</td>
						</tr>
					</c:forEach>
					<tr>
						<!-- pagination -->
						<td colspan="2">
							<span>${pagingStr}</span>
						</td>
					</tr>
				</table><br/>
				
			</div>
			<div id="right" class="container1" style="width: 50%;">
				<h2>사업장 정보&nbsp;&nbsp;<input type="button" value="사업장 등록" onclick="fn_regSite()"></h2>
				<table border="1" style="width: 100%;" cellspacing="0" cellpadding="0">
					<tr>
						<th>사업장 번호</th>
						<th>사업장 명</th>
						<th>전화 번호</th>
					</tr>
					<c:forEach var="siteVo" items="${siteVoList}">
						<tr class="trSite" style="cursor: pointer;">
							<td>${siteVo.siteNum}</td>
							<td>${siteVo.siteNm}&nbsp;
								<img alt="삭제" src="/resources/images/del.jpg" 
								style="width:30px;height:30px;z-index: 1;"
								title="삭제" class="delSite" value="${siteVo.siteNum}" />
							</td>
							<td>${siteVo.phnNum}</td>
						</tr>
					</c:forEach>
					<tr>
						<!-- pagination -->
						<td colspan="3">
							<span>${sitePagingStr}</span>
						</td>
					</tr>
				</table>
			</div>
			
		</div>
		
		<hr/>
		
		<div id="bottom">
			<!-- 근무 정보 매핑 -->
			<h2>근무 정보 매핑</h2>
			<form id="frm" name="frm" method="post" action="/wk/insert">
				사원 : <input type="hidden" name="empNum" />
				<input type="text" name="empNm" style="width: 200px;" readonly />&nbsp;&nbsp;
				
				사업장 : <input type="hidden" name="siteNum" /> 
				<input type="text" name="siteNm" style="width: 200px;" readonly />
				근무 시작일 : <input type="text" name="wkStartDt" id="wkStartDt" style="width: 200px;" readonly />&nbsp;&nbsp;
				<input type="button" value="등록" id="btn" />
			</form>
		</div>
		<br/><br/>
	</div>	
</body>
</html>