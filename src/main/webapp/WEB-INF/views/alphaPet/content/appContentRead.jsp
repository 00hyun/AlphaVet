<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300&display=swap" rel="stylesheet">
<!-- 폰트 끝-->

<%-- <p>${contentRead}</p> --%>
<style>
img{
   width:100%;
}

body{
   zoom : 2.0;
   font-family: 'IBM Plex Sans KR', sans-serif;
}

/*로딩*/
#load {
   width: 100%;
   height: 100%;
   top: 0;
   left: 0;
   position: fixed;
   display: block;
   opacity: 0.8;
   background: white;
   z-index: 99999;
   text-align: center;
}

#load > img {
   position: absolute;
   top: 35%;
   left: 37%;
   z-index: 100;
   width: 150px;
}

/*스크롤바 없애는 기능 // 이동할 때 틀어져서 해놓음*/
body{
 -ms-overflow-style: none;
 }
::-webkit-scrollbar {
  display: none;
}

#acConTextarea
{
outline:none;
}
</style>

<div class="card" id="menuBar">
   <div class="card-body">

   <h1><b>${contentRead.abTitle }</b></h1>
   <span class="table mb-0" style="margin-left:75%; font-size:18px; font-weight:bold;">조회수</span>&nbsp;
   <span id="appHitCnt" class="table mb-0" style="font-size:18px; font-weight:bold;">${contentRead.abHitCnt }</span>
   
   <!-- 홈으로 가기 -->
<!-- <button type="button" class="btn btn-light btn-sm waves-effect waves-light"  id="homeBtn" onclick="location.href='/appHome'"><i class="mdi mdi-home-heart"></i></button> -->
   

   <div class="table-responsive">
      <span class="table mb-0">${contentRead.abCon }</span>&nbsp;
   </div>
   
   <div class="table-responsive">
       <table class="table mb-0">
           <tbody>
               <tr>
               <td>
                  <!-- 가져온 좋아요 상태가 눌렸다면(ri-heart-fill text-danger 채워진 하트) 안 눌렸다면 (안채워진 하트)-->
                  <c:set value="${stayLike}"  var="stayLike" />
                      <h2>
                         <i class='<c:if test="${stayLike == 1}"><c:out value="ri-heart-fill text-danger" /></c:if><c:if test="${stayLike != 1}"><c:out value="ri-heart-line"/></c:if>'
                                     onclick="clickHeartBtn(this, '${contentRead.abNm }')"></i>
                      </h2>
                      <div class="table-responsive">
                  <span class="table mb-0" style="font-size:18px; font-weight:bold;">댓글수</span>&nbsp;
                  <span id="abComCnt" class="table mb-0" style="font-size:18px; font-weight:bold;">${contentRead.abCommentCnt }</span>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="table mb-0" style="font-size:18px; font-weight:bold;">좋아요수</span>&nbsp;
                  <span id="appLikeCnt" class="table mb-0" style="font-size:18px; font-weight:bold;">${contentRead.abLikeCnt }</span>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </div>
                   </td>
               </tr>
           </tbody>
       </table>
   </div>


<!-- foreach문으로 화면에 뿌려주기 -->

   <div class="table-responsive">
       <table class="table mb-0">
          <thead class="table-light">
         <tr>
            <td style="display:none">댓글번호</td>
            <td style="font-size:18px; font-weight:bold;">작성자</td>
            <td style="font-size:18px; font-weight:bold;" colspan="3">댓글내용</td>
         </tr>
         </thead>
   
   <c:forEach items="${commentList}" var="comment">
   <tr>
      <td style="display:none">${comment.acNm }</td>
      <td style="font-size:18px; font-weight:bold;">${comment.userId }</td>
      <td><textarea style="font-size:18px; font-weight:bold;" class="p-1 border border-0 rounded" id="acConTextarea" cols="28" rows="1"  readonly>${comment.acCon }</textarea></td>
      <td style="padding-left:0; padding-right:1px;">
      		<c:if test="${userId eq comment.userId}">
		      <!-- 댓글수정 -->
		      <button class="btn btn-info btn-sm waves-effect waves-light"  id="Comment_modify" onclick="modifyComment(this, '${contentRead.abNm }', '${comment.userId }')"><i class="ri-edit-fill"></i></button>
		      </td>
		      <td style="padding-left:1px; padding-right:0;">
		      <!-- 댓글삭제 -->
		      <button class="btn btn-info btn-sm waves-effect waves-light"  id="Comment_delete" onclick="deleteComment(this, '${comment.acNm }', '${contentRead.abNm }','${comment.userId }')"><i class="ri-delete-bin-5-fill"></i></button>
		      </td>
      		</c:if>
   </tr>
   </c:forEach>
   </table>
         <div>
         <form action="/registerComment" method="post">
            <textarea style="font-size:18px; font-weight:bold;" class="p-1 border border-2 rounded" cols="42" rows="1" name="acCon" ></textarea>
            <input type="hidden" name="abNm" value="${contentRead.abNm }">
            <!-- 댓글등록 -->
            <button style="font-size:18px; font-weight:bold; display: inline-block; vertical-align:top;" class="btn btn-info btn-sm waves-effect waves-light"  id="Comment_regist">등록</i></button>
         </form>
         </div>
      </div>
</div>
<script>
$(function(){
   document.getElementById("headerDiv").style.display = "none";
   $("#foot").css("display", "none");
})

// 좋아요수 증가
function clickHeartBtn(cthis, boardNumber){
   console.log(boardNumber);
   if(cthis.className == "ri-heart-line" ){ 
      cthis.className="ri-heart-fill text-danger";
      let data = {
            abNm : boardNumber,
            userId : '${userId}'
      }
      $.ajax({
         method:"post",
         url:"/appCountLikeUp",
         data:JSON.stringify(data),
          contentType : "application/json; charset=UTF-8",
         dataType:"text",
         success: function(p_LikeUpSuccess){
            console.log(p_LikeUpSuccess);
            let likeCnt = document.querySelector("#appLikeCnt");
             likeCnt.innerHTML=parseInt(likeCnt.innerHTML)+1;
         }
      })
   }else{ // 좋아요수 감소
      cthis.className = "ri-heart-line";
      let edata = {
         abNm : boardNumber,
         userId : '${userId}'
      }
      $.ajax({
         method : "post",
         url :"/appCountLikeDown",
         data:JSON.stringify(edata),
         contentType:"application/json; charset=UTF-8",
         dataType:"text",
         success: function(p_LikeDownSuccess){
            console.log(p_LikeDownSuccess);
            let likeDownCnt = document.querySelector("#appLikeCnt");
            console.log(likeDownCnt);
            likeDownCnt.innerHTML=parseInt(likeDownCnt.innerHTML)-1;

         }
      })
   }
}

function modifyComment(mthis, abNumber, comWriter){
   console.log("comWriter", comWriter);
   console.log("abNumber",abNumber);
   if(comWriter != '${userId}'){
      Swal.fire({
         title: "작성자만 수정가능합니다.",
         icon: "success",
           confirmButtonColor: '#3085d6',
           confirmButtonText: '확인',
             backdrop: true,
           })
      return;
   }
   let mtext = mthis.parentElement.parentElement.children[2].children[0];
   // "${userId}" 세션에 데이터 저장(jsp)
   //댓글수정, 수정완료 버튼
   if(mthis.children[0].className == "ri-edit-fill"){
      mtext.readOnly=false;
      mtext.focus();
      mthis.children[0].className = "ri-save-3-fill";
   }else {
      console.log("mtext값:",mtext.value);    
      let comment = {
            acNm:mthis.parentElement.parentElement.children[0].innerHTML,
            abNm:abNumber,
            acCon:mtext.value
      }
   
      
      $.ajax({
         method: "POST",
         url : "/modifyComment",
         data : JSON.stringify(comment), // ac_nm, ab_nm, ac_con
         contentType : "application/json; charset=UTF-8",
         dataType : "text",
         success : function(p_com){
            console.log(p_com);
            mthis.children[0].className = "ri-edit-fill";
            mtext.readOnly=true;
         }
      })
   }

}

function deleteComment(dthis, commentNum, boardNum, comWriter){
   if(comWriter != '${userId}'){
      Swal.fire({
         title: "작성자만 삭제가능합니다.",
         icon: "success",
           confirmButtonColor: '#3085d6',
           confirmButtonText: '확인',
             backdrop: true,
           })
      return;
   }

   
   
   let p_tr = dthis.parentElement.parentElement
//    console.log(dthis.parentElement.parentElement);
//     let p_yes= confirm("정말 삭제하시겠습니까?");
              let data = {
                 acNm : commentNum,
                 abNm : boardNum,
                 userId : '${userId}'  // 같은 사용자면 삭제가능하고, 아니면 삭제불가능하게 짤 것.
           }
      Swal.fire({
            title: "정말 삭제하시겠습니까? ",
         icon: "success",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.isConfirmed) {
               $.ajax({
                  method:"post",
                  url:"/removeComment",
                  data:JSON.stringify(data),
                  contentType : "application/json; charset:UTF-8",
                  dataType:"text",
                  success: function(p_delSuccess){
                    console.log(p_delSuccess);
                    p_tr.parentElement.removeChild(p_tr);
                    let spanCnt = document.querySelector("#abComCnt");
                     spanCnt.innerHTML=spanCnt.innerHTML-1;  // 댓글 삭제 시 댓글수 -1
                  }
               })
            }else if (result.isDismissed) {

            }
        })

    

}
</script>