<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title>청구서</title>
<style>
th{
	border : 1px solid white;
	text-align: left;
}
td{
	border : 1px solid white;
	text-align: left;
}
table{
	border : 1px solid white;
	border-width: 3px 0px;
	border-collapse : collapse;
	width : 100%;
	height : 100%;
	empty-cells: show;
	margin-bottom: 10px;
}
.a4Page{
	width: 8cm;
	min-height: 13.7cm;
	padding: 1.5cm 1.5cm 2cm 1.5cm; 
}
h1{
	text-align: center;
	font-weight: 1000;
}
body{
	background-color : white;
	padding: 15px;
}
table th:first-child,
table td:first-child {
	border-left: 0;
}
table th:last-child,
table td:last-child {
	border-right: 0;
}
.lineNone, .lineNone th, .lineNone td{
	border : black;
}

body{
justify-content: center;
}
</style>
</head>
<body>
<div align="right">
<input type="button" onclick="print_btn('docDiv');" value="프린트"  
class="btn btn-primary waves-light waves-effect" id="page_print"/>
</div>
<br/><br/>
<!-- <input type="button" onclick="print_btn('docDiv');" value="프린트"  class="btn btn-primary waves-light waves-effect" id="page_print"/> -->
<h1>청&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;서</h1>
<p>&nbsp;&nbsp;====================================</p>
<br/>

<table border="1" style="text-align: left; font-size: 0.9em;">
	<tr>
		<td>사업자등록번호</td>
		<td>306-82-05291</td>
	</tr>
	<tr>
		<td>병&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
		<td>대덕인재동물병원</td>
	</tr>
	<tr>
		<td>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장</td>
		<td>김원장</td>
	</tr>
	<tr>
		<td>사업장&nbsp;&nbsp;&nbsp;소재지</td>
		<td>대전광역시 중구 계룡로 846, 3-4층</td>
	</tr>
	<tr>
		<td colspan="2">---------------------------------------------------------------------------</td>
	</tr>
	<tr>
		<td>고&nbsp;&nbsp;객&nbsp;&nbsp;번&nbsp;&nbsp;호</td>
		<td id="docPatId"></td>
	</tr>
	<tr>
		<td>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜</td>
		<td  id="docPraDate"></td>
	</tr>
		<tr>
		<td colspan="2">--------------------------------------------------------------------------</td>
	</tr>
	<tr>
		<td>동&nbsp;&nbsp;&nbsp;&nbsp;물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
		<td id="docPatName"></td>
	</tr>
	<tr>
		<td colspan="2">--------------------------------------------------------------------------</td>
	</tr>
</table>
<table border="1" style="width: 90%;" >
	<tr style="font-size: 1.2em;">
		<th>항목</th>
		<th style="text-align: right;">단가</th>
		<th style="text-align: right;">수량</th>
		<th style="text-align: right;">금액</th>
	</tr>
	<tr>
		<td colspan="4">------------------------------------------------------------------</td>
	</tr>
<tbody id="praCdPra">
<!-- 진료비 -->
</tbody> 

<tbody  id="praCdDrug">
<!-- 원내처방 약 -->
</tbody>
	
<tbody id="praCdVaccine">
<!-- 접종 -->
</tbody>	
	
<tbody id="praCdTest">
<!-- 검사 -->
</tbody>	

<tbody id="onlyStay">
<!-- 진료일수 -->
</tbody>	

<tbody id="praStayFood">
<!-- 입원 중 먹는 식사 -->
</tbody>	

	<tr>
		<td colspan="4">========================================</td>
	</tr>
	<tr>
		<th style="font-size: 1.3em;">청구금액</th> 
		<th  colspan="3" style="font-size: 1.3em; text-align: center; text-align: right;" id="finalSum"></th>
	</tr>
</table>




<br/><br/>


</div>
<!-- <input type="button" id="page_print" onclick="window.print();" value="전체프린트" /> -->
<script>
function print_btn(target_id){
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function(){
		document.body.innerHTML = document.getElementById(target_id).innerHTML;
	}
	window.onafterprint = function(){
		document.body.innerHTML = initBody;
	}
window.print();   
}






</script>
</body>
</html>









