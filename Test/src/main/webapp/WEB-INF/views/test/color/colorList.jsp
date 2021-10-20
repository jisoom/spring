<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
var beforeColor; //이전에 선택된 컬러 저장 할 변수

//HTML 로딩이 끝난 후
window.onload = function(){
init();
}

function init(){
//2차원 배열 파레트 데이터
var pallet = [["#FF0000", "#FF5E00", "#FFBB00", "#FFE400", "#ABF200", "#1DDB16", "#00D8FF", "#0054FF", "#0100FF", "#5F00FF", "#FF00DD", "#FF007F", "#000000", "#FFFFFF"],
              ["#FFD8D8", "#FAE0D4", "#FAECC5", "#FAF4C0", "#E4F7BA", "#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF", "#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6", "#EAEAEA"],
              ["#FFA7A7", "#FFC19E", "#FFE08C", "#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5", "#BDBDBD"],
              ["#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"],
              ["#CC3D3D", "#CC723D", "#CCA63D", "#C4B73B", "#9FC93C", "#47C83E", "#3DB7CC", "#4374D9", "#4641D9", "#8041D9", "#D941C5", "#D9418C", "#747474", "#5D5D5D"],
              ["#980000", "#993800", "#997000", "#998A00", "#6B9900", "#2F9D27", "#008299", "#003399", "#050099", "#3F0099", "#990085", "#99004C", "#4C4C4C", "#353535"],
              ["#670000", "#662500", "#664B00", "#665C00", "#476600", "#22741C", "#005766", "#002266", "#030066", "#2A0066", "#660058", "#660033", "#212121", "#191919"]];
var tag = "";
for(i=0; i<pallet.length; i++){
  for(j=0; j<pallet[i].length; j++){
    tag += "<div id="+pallet[i][j]+" class='colorBox' onclick='colorSet(this)'></div>";
  }
}
//파레트 파싱
document.getElementById("palletBox").innerHTML = tag;

//색상 입히기
var colorBox = document.getElementsByClassName("colorBox");
for(i=0; i<colorBox.length; i++){
  colorBox[i].style.background = colorBox[i].id;
}
}
//onclick event
function colorSet(target){
	opener.document.getElementById("list1").style.background = target.id;

if(beforeColor != undefined && beforeColor != null){
  document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" active", "");
}
document.getElementById(target.id).className += " active";
beforeColor = target.id;
self.close();
}

</script>
<style type="text/css">
*{
  margin: 0px;
  padding: 0px;
}
body{
  height: 100vh;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}
.color-box{
  width: 295px;
  height: 148px;
}
.pallet{
  width: 295px;
  height: 250px;
}
.active{
  outline: 2px solid black;
}
.colorBox{
  width: 20px;
  height: 20px;
  float: left;
  margin: 1px 1px 0px 0px;
  cursor: pointer;
}
</style>
</head>
<body>
	<div id="box" class="color-box">
		색상 변경
		<div id="palletBox" class="pallet"></div>
	</div>
</body>
</html>