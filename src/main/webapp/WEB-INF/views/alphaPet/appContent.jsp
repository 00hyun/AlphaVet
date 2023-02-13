<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.appImg {
   width: 180px;
   height: 180px;
   border-radius: 8px;
}

h5{
margin: 4%;
text-align: center;
}

.btn-warning{
   margin-left: 42.5%;
}

.btn-light{
   margin-left: 90%;

}

#menuBar{
   background-color: white;

}

.conCard{
/*    background-color: #fff9bb; */
   border-radius: 5px;
   margin-bottom: 8px;
/*    opacity: 0.6; */
   

}
</style>

<script>
$(function(){

$(".appContent").slice(0, 4).show();
$(".moreBtn").click(function(e){ 
   e.preventDefault();
   $(".appContent:hidden").slice(0, 4).show();
   if($(".appContent:hidden").length == 0){
     $('.moreBtn').hide();
     }
   });
   
})
</script>

	<div class="card-body">
			<div class='card-body' align='center'>
    		<img class='logo logoLogin' src='${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png' width='200px' />
    		<h4>펫과사전</h4></div>

<!-- <h3><i class="ri-book-open-fill"></i> <b>펫과사전</b></h3> -->
      <!-- 여기에 테이블을 만들고 게시판 리스트를 불러와주세요! -->
      <div class="table-responsive">
<!--                                             <table class="table mb-0"> -->
        
<!--                                                 <thead> -->
<!--                                                     <tr> -->
<!--                                                            <th>번호</th> -->
<!--                                              <th>제목</th> -->
<!--                                              <th>작성자</th> -->
<!--                                              <th>댓글수</th> -->
<!--                                              <th>좋아요수</th> -->
<!--                                                     </tr> -->
<!--                                                 </thead> -->
<!--                                                 <tbody> -->
<%--                                                     <c:forEach items="${appContentList}" var="appContentList"> --%>
<!--                                        <tr> -->
<%--                                           <td><a href="/contentRead?abNm=${appContentList.abNm }"/>${appContentList.abNm }</td> --%>
<%--                                           <td>${appContentList.abTitle }</td> --%>
<%--                                           <td>${appContentList.abWriter }</td> --%>
<%--                                           <td>${appContentList.abCommentCnt }</td> --%>
<%--                                           <td>${appContentList.abLikeCnt }</td> --%>
<!--                                        </tr> -->
<%--                                     </c:forEach> --%>
<!--                                                 </tbody> -->
<!--                                             </table> -->
                                            <button type="button" id="homeBtn" class="btn btn-light btn-sm waves-effect waves-light "  onclick="location.href='/appHome'"><b><i class="mdi mdi-home-heart"></i></b></button>
                                        </div>


		<div class="row appContent ">
			<c:forEach items="${appContentList}" var="appContentList" >
				<div class="col-sm-6">
					<div class="card-body conCard">
						<a href="/contentRead?abNm=${appContentList.abNm }"> 
						<img class="appImg" src='${pageContext.request.contextPath }/resources/images/petBoard/${appContentList.abImg}'>
							<div>
								<h5><b><i class="mdi mdi-paw"></i> ${appContentList.abTitle }</b></h5>
							</div>
						</a>
					</div>


            </div>
         </c:forEach>
      </div>


   </div>


