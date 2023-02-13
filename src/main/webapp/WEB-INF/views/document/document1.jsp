<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<title>처방전</title>
<style>
tr {
	height: 30px;
}

th {
	border: 1px solid #aaaaaa;
	text-align: center;
}

td {
	border: 1px solid #aaaaaa;
	text-align: center;
}

table {
	border: 1px solid #aaaaaa;
	border-width: 3px 0px;
	border-collapse: collapse;
	width: 100%;
	height: 100%;
	empty-cells: show;
	margin-bottom: 10px;
}

.a4Page {
	width: 21cm;
	min-height: 15.7cm;
	padding: 1.5cm 1.5cm 0.5cm 1.5cm;
}

h1 {
	text-align: center;
	font-weight: 1000;
}

.gray {
	background-color: lightgray;
}

table th:first-child, table td:first-child {
	border-left: 0;
}

table th:last-child, table td:last-child {
	border-right: 0;
}

#page_print {
	margin-top: 20px;
	margin-left: 660px;
}
</style>
</head>
<body>
	<input type="button" onclick="print_btn('docDiv');" value="프린트"
		class="btn btn-primary waves-light waves-effect printBtnClass" id="page_print" />
	<div class="page-content a4Page" id="docDiv">
		<h1>처&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;&nbsp;전</h1>
		<table>
			<tr class="gray">
				<th width="100">발급 연월일</th>
				<th width="300"><span id="receiptYear"></span>년
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					id="receiptMonth"></span>월
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					id="receiptDay"></span>일</th>
				<th width="100">발급 번호</th>
				<td id="receipPracd"></td>
			</tr>
		</table>

		<table border="1">
			<tr style="text-align: left;">
				<th>처방전 유효기간 : &nbsp;&nbsp;&nbsp; 발급일로부터
					(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					)일간 <br /> 처방전 유효기간 내에 구매해야 합니다.
				</th>
			</tr>
		</table>

		<table border="1">
			<tr>
				<th rowspan="3" width="50">개별 <br /> 처방<br /> [&nbsp;√&nbsp;]
				</th>
				<th width="120">동물의 이름</th>
				<td width="240" id="receiptPatName"></td>
				<th rowspan="3" width="80">동물의<br /> [&nbsp;√&nbsp;]소유자 <br />
					[&nbsp;&nbsp;&nbsp;]관리인
				</th>
				<th width="70">성명</th>
				<td width="100" id="receiptMemName"></td>
			</tr>
			<tr>
				<th>동물의 종류</th>
				<td id="receiptPatKind"></td>
				<th>전화번호</th>
				<td id="receipMemTel"></td>
			</tr>
			<tr>
				<th>성별/연령/체중 등</th>
				<th><span id="receiptGender">암수</span>/ <span id="receiptAge"></span>개월/
					<span id="receiptWeight"></span>kg</th>
				<th>생년월일</th>
				<td id="receiptBirth"></td>
			</tr>
			<tr class="gray">
				<th colspan="2">처방 수의사</th>
				<th style="text-align: center;"><span id="receiptEmpName"></span>
					<span style="position: absolute;">&nbsp;&nbsp;
					(서명 또는 날인)</span>
					 <img style="width: 50px; height: 50px; position: relative; left: 70px;"
					alt="도장" src="${pageContext.request.contextPath }/resources/images/document/대덕인재.png">
				</th>
				<th>수의사<br /> 면허번호
				</th>
				<th colspan="2" style="text-align: center">제&nbsp;&nbsp;
					<span id="receiptEmpId"></span>호</th>
			</tr>
		</table>

		<table>
			<tr>
				<th width="300">처방의약품의 명칭</th>
				<th width="60">1회<br /> 투여량
				</th>
				<th width="60">1일<br /> 투여횟수
				</th>
				<th width="60">총<br /> 투약일수
				</th>
				<th width="150">용법</th>
			</tr>
			<tbody id="receiptTable">

			</tbody>
		</table>
		<table>
			<tr class="gray">
				<th>의약품 판매 내용</th>
			</tr>
		</table>

		<table>
			<tr>
				<th width="80">판매기관</th>
				<th width="50">명칭</th>
				<td width="300"></td>
				<th width="80">대표자 성명</th>
				<td width="200"></td>
			</tr>
			<tr>
				<th>판매약사</th>
				<th>성명</th>
				<th style="text-align: right;">(서명 또는 날인)</th>
				<th>면허번호</th>
				<td></td>
			</tr>
			<tr>
				<th>판매 연월일</th>
				<td colspan="2"></td>
				<th>비고</th>
				<td></td>
			</tr>
		</table>
		<table>
			<tr>
				<th width="40">필/선</th>
				<th>판매 제품명(제조사)</th>
				<th>규격(포장 단위)</th>
				<th>판매량</th>
				<th>유통기간</th>
				<th>휴약기간</th>
				<th width="70">비고</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td rowspan="7"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<!-- <input type="button" id="page_print" onclick="window.print();" value="전체프린트" /> -->
	<script>
		function print_btn(target_id) {
			var initBody = document.body.innerHTML;
			window.onbeforeprint = function() {
				document.body.innerHTML = document.getElementById(target_id).innerHTML;
			}
			window.onafterprint = function() {
				document.body.innerHTML = initBody;
			}
			window.print();
		}
	</script>
</body>
</html>









