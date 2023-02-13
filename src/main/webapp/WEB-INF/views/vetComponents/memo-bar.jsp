<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="principal" var = "principal"/>

<div class="col-md-6 col-xl-2" style="height:700px;" id="memoBar" >
    <div class="row h-80">
    <div class="col-xl-12">
    	<div class="card">
        <div class="card-header bg-transparent border-bottom">
            <h5>환자기록<i class="fas fa-check"></i>　<span id="memoPatName"></span>
            <input type="hidden" id="memoPatId" value="">
			</h5>
        </div>
        <div class="card-body" id="memoBody" style="overflow: auto; height: 700px;" >
                <ul class="list-unstyled memoArray">
                <!-- 
                    -->
                </ul>
         </div>
		<div class="p-3 chat-input-section">
			<div class="row">
				<div class="col">
					<div class="position-relative">
						<input type="text" class="form-control chat-input" placeholder="Enter Message..." id="memoArea" style="width:225px;float: left;">
						<button class="btn btn-primary waves-effect waves-light" id="memoSend" style="width:auto; float: right;"><i style="font-weight: bolder;" class='bi bi-send'></i></button>
					</div>
				</div>
			</div>
		</div>

<!-- 		<div > -->
<!-- 			<input class="form-control" type="text" id="memoArea" > -->
<!-- 			<button class="btn btn-primary waves-effect waves-light" id="memoSend"><i class='bi bi-send'></i></button> -->
<!-- 		</div> -->
</div>
	</div>
	</div>
 </div>
 
 
 <script>

$(function() {

	$("#memoSend").on("click",function() {
		if($("#memoArea").val() == ""){
			alert("메시지를 입력해주세요.")
			return false;
		}
		
				memoPatId = $(this).parents("#memoBar").find("#memoPatId").val()
				patMemoCon = $("#memoArea").val()
				
				
				
				let formData = new FormData();
				formData.append("patId", memoPatId);
				formData.append("empId", `${principal.username }`);
				formData.append("patMemoCon", patMemoCon);

				$.ajax({
					url : "/insertMemo",
					data : formData,
					type : "post",
					contentType : false,
					processData : false,
					async : false,
					success : function(res) {
						console.log("res", res)
						showMemo(memoPatId)
					},
					error : function(request, status, error) {
						console.log("insertMemo:" + request.status
								+ "\n" + "message:"
								+ request.responseText + "\n"
								+ "error:" + error);
					}
				})
				
				$("#memoArea").val("")
				$('#memoBody').scrollTop($('#memoBody')[0].scrollHeight);
// 				$(".memoArray").find("last:li").addClass('animate__pulse')
				
			})

})



function showMemo(patIdNum){
	
	$.ajax({
		url : "/showMemo",
		data : {patId : patIdNum},
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		success : function(res) {
// 			console.log("showMemores", res)
			code=""
			
			if(res.length > 0){
				for(var i=0; i<res.length; i++){
					
					code+=`
	                    <li class="mb-2" style="zoom:0.9">
	                    <div class="d-flex flex-nowrap align-items-center mb-2">
	                    	<div class="avatar-xs align-self-center me-2">
	                        	<img src="\${res[i].empProfile}" class="rounded-circle avatar-xs" alt="">
	                        </div>
	                        <div class="flex-grow-1 overflow-hidden">
	                        	<input type="hidden" value="\${res[i].empJob}">
	                        	<h5 class="text-truncate font-size-14 mb-1">\${res[i].empName}</h5>
	                        </div>
	                        <div class="font-size-11">\${res[i].memoDate2}</div>
	                    </div>
	                    <div>
	                        <p class="chatStyle" class="form-control chat-input">\${res[i].patMemoCon}</p>
	                    </div>
	                </li>
				`
				}
			}else{
				code+=`
				<div style="text-align: center;">
				<i style="fon" class="fas fa-exclamation-circle"></i><br/>
				지난 환자 기록이 없습니다.</div>`
				
				
			}
			
			
			
			$(".memoArray").html(code)
// 			console.log(${res[i].patMemoCon})
			
			chatStyle = document.querySelectorAll(".chatStyle")
// 			console.log("chatStyle",chatStyle[0])
			
			//직책에 따라 말풍선 ㅊ색상
			for(var i=0; i<res.length; i++){
				if( res[i].empJob == "의사"){
					chatStyle[i].setAttribute( 'class', 'form-control chat-out' )
				}else{
					chatStyle[i].setAttribute( 'class', 'form-control chat-input' )
				}
			}
			
			$('#memoBody').scrollTop($('#memoBody')[0].scrollHeight);
			
			
		},
		error : function(request, status, error) {
			console.log("showMemo:" + request.status
					+ "\n" + "message:"
					+ request.responseText + "\n"
					+ "error:" + error);
		}
	})
	
}
	</script>

<style>
  .chat-out{
    border-radius: 30px;
    background-color: rgba(0, 140, 255, 0.767) !important;
    border-color:  rgba(0, 140, 255, 0.767) !important;
/*     padding-right: 120px; */
    color: white;
  }
  
  .chat-input{
     padding-right: 0px;
  }
  
  
  #memoBody::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
}

#memoBody::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background: #DCDCDC	; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

#memoBody::-webkit-scrollbar-track {
   
</style>

