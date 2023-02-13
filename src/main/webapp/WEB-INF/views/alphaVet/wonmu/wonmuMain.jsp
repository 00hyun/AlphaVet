<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<%-- <div class="page-content mx-3 mb-4">
	<div class="d-flex justify-content-between w-100">
	        <div class="position-relative w-100 h-100 mx-3">
	</div>
			<jsp:include page="/WEB-INF/views/vetComponents/patientList.jsp" />
			<jsp:include page="/WEB-INF/views/alphaVet/wonmu/patDetail.jsp" />
			<jsp:include page="/WEB-INF/views/vetComponents/memo-bar.jsp" />
	</div>
</div> --%>
<%-- 
///요거사용
 
<div class="page-content mx-3 mb-4">
	<div class="d-flex justify-content-between w-100">
		<jsp:include page="/WEB-INF/views/vetComponents/patientList.jsp" />
			<jsp:include page="/WEB-INF/views/alphaVet/wonmu/patDetail.jsp" />
		<jsp:include page="/WEB-INF/views/vetComponents/memo-bar.jsp" />
	</div>
</div> 
 --%>
 <%-- <jsp:include page="/WEB-INF/views/alphaVet/medic/medicOrder.jsp" />
<jsp:include page="/WEB-INF/views/alphaVet/medic/medicModal.jsp" />
<div class="page-content mx-3 mb-4">
    <div class="d-flex justify-content-between w-100">
        <jsp:include page="/WEB-INF/views/vetComponents/patientList.jsp" />
<!--         <div class="position-relative w-100 h-100 mx-5"> -->
<!--         //////////////////// -->
            <jsp:include page="/WEB-INF/views/alphaVet/medic/medicConductBox.jsp" />
            <jsp:include page="/WEB-INF/views/alphaVet/medic/medicHeader.jsp" />
				<jsp:include page="/WEB-INF/views/alphaVet/wonmu/patDetail.jsp" />
<!--         </div> -->
        <jsp:include page="/WEB-INF/views/vetComponents/memo-bar.jsp" />
    </div>
</div> --%>



<div class="page-content ">
	<div class="container-fluid">
		<div class="row">
	
	
			<jsp:include page="/WEB-INF/views/vetComponents/patientList.jsp" />
			<jsp:include page="/WEB-INF/views/alphaVet/wonmu/patDetail.jsp" />
			<jsp:include page="/WEB-INF/views/vetComponents/memo-bar.jsp" />
			
	
	
		</div>
	
	
	</div>
	
	
</div>




<%-- 
<div class="page-content mx-3 mb-4">
    <div class="d-flex justify-content-between w-100">
        <jsp:include page="/WEB-INF/views/vetComponents/patientList.jsp" />
        <div class="position-relative w-100 h-100 mx-5">
            <jsp:include page="/WEB-INF/views/alphaVet/wonmu/patDetail.jsp" />
        </div>
        <jsp:include page="/WEB-INF/views/vetComponents/memo-bar.jsp" />
    </div>
</div> --%>










<script>
	$(function() {
		//자동완성 
		var searchId = "";
		$("#search").autocomplete({
			source : function(request, response) { //source: 입력시 보일 목록
				$.ajax({
					url : "/ajax/autocomplete.do",
					type : "POST",
					dataType : "JSON",
					data : {
						value : request.term
					} // 검색 키워드
					,
					success : function(data) { // 성공
						response($.map(data.resultList, function(item) {
							tel = item.MEM_TEL
							// 			                	 searchId = item.PAT_NAME + "/" +tel
							return {
								label : item.PAT_NAME + "(" + tel + ")" // 목록에 표시되는 값
								,
								value : item.PAT_NAME + "(" + tel + ")" // 선택 시 input창에 표시되는 값
								,
								idx : item.PAT_ID
							// index
							};
						})); //response
					},
					error : function() { //실패
						alert("오류가 발생했습니다.");
					}
				});
			},
			focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength : 1// 최소 글자수
			,
			autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			,
			delay : 100 //autocomplete 딜레이 시간(ms)
			,
			select : function(event, ui) {
				getPatientData(ui.item.value);
			}
		}).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경 부
	        return $('<li>') //기본 tag가 li
	        .append('<div style="height:35px;" class="textSize">' + item.value + '</div>') // 원하는 모양의 HTML 만들면 됨
	        .appendTo(ul);
	    };;
		//자동완성끝
		//$function
	})
	
	let search = document.getElementById("search");
	
	document.getElementById("search").addEventListener("keyup", function(){
		if(search.value != ""){
			search.style.borderRadius = "10px 10px 0px 0px";
		}else{
			search.style.borderRadius = "30px";
		}
	})
</script>