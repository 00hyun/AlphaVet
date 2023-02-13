//html2canvas
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
//jspdf
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
</nav>

<div class="container-fluid">
<h1 class="h3 mb-4 text-gray-800">BOARD</h1>
<div class="row">
<div class="col-xl-12 col-md-12 mb-12">
<div class="card border-left-primary shadow h-100 py-2">
	<div class="card-header" id="capture">
		<h3>${reviewVO.reviewTitle }</h3>
		<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
			<h6>작성자: ${reviewVO.reviewWriter }&nbsp;&nbsp;&nbsp;작성일: ${reviewVO.reviewDate }&nbsp;&nbsp;&nbsp;조회수: ${reviewVO.reviewHit }</h6>
		</div>
	</div>
    <div class="card-body">
        	${reviewVO.reviewContent }
    </div>
	<div class="row">
		<div class="col-md-10"></div>
		<div class="col-md-2">
			<button type="button" class="btn btn-info" id="updateBtn">수정</button>
			<button type="button" class="btn btn-danger">삭제</button>
			<button type="button" class="btn btn-primary" id="listBtn">목록</button>
			<button type="button" class="btn btn-primary" id="button_pdf">PDF생성</button>
		</div>
	</div>
</div>
</div>
<form action="/review/update.do" method="get" id="updateForm">
	<input type="hidden" name="reviewNo" value="${reviewVO.reviewNo }">
</form>

<form id="pdf" action="/review/makepdf" method="post">
		<input type="hidden" id="pdf_value" name="pdf_value">
</form>
</div>
</div>

<script type="text/javascript">
$(function(){
	var listBtn = $("#listBtn");
	var updateBtn = $("#updateBtn");
	
	listBtn.on("click", function(){
		location.href = "/review/list.do";
	});
	
	updateBtn.on("click", function(){
		updateForm.submit();
	});
	
	
	  $("#button_pdf").on("click", function() {
		  
		  	window.scrollTo(0,0); 

		    //capture하고자 하는 영역 아이디 값 넣어주기
		    html2canvas($('#capture')[0]).then(function(canvas) {

		      	
		      
		      var myImg = canvas.toDataURL("image/jpg");
		      console.log(myImg);
		      
		      var pagewidth = 210;
		      var pageheight = 290;
		      var imgWidth = pagewidth;
		      var imgHeight = canvas.height * imgWidth / canvas.width; 
		      var heightLeft = imgHeight;
		      
		      var doc = new jsPDF("p", "mm", "a4");
		      
		      // 한 페이지 이상일 경우 루프 돌면서 출력
		      while (heightLeft >= 0) {
		        position = heightLeft - imgHeight;
		        doc.addImage(myImg, "jpg", 0, position, imgWidth, imgHeight);
		        heightLeft -= pageheight;
				if(heightLeft > 0){
			        doc.addPage();
				}
		      }
		      
		      doc.save("result.pdf");

		    });

		  });
});	    

</script>