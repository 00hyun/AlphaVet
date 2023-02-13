<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.appImg3{
		width: 155px;
		border-radius: 5px;
	}
	
	.appImg4{
    width: 90%;
    margin-left: 5%;
    text-align: center;
    border-radius: 3px;
	}
	
</style>


<div class="card row">
<!--    <div class="card-body"> -->
      <!--펫과사전 부분 -->
<!--       <div class="card overflow-hidden card appContent2"> -->
<!--       //////// -->


<!-- Nav tabs -->
<hr>
<ul class="nav nav-tabs nav-tabs-custom nav-justified tabList2" role="tablist">
   <li class="nav-item "><a class="nav-link active" data-bs-toggle="tab" href="#petBoard" role="tab"> 
      <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
         <span class="d-none d-sm-block"><h4>펫과사전</h4></span>
   </a></li>
   <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab"> 
      <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
         <span class="d-none d-sm-block"><h4>입양홍보</h4></span>
   </a></li>
   <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#profile2" role="tab"> 
      <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
         <span class="d-none d-sm-block"><h4>애니멀바</h4></span>
   </a></li>


</ul>

<!-- 내원내역 -->
<div class="tab-content p-3 text-muted tabContent">
   <div class="tab-pane active tabContent2" id="petBoard" role="tabpanel">
         <div class="tabList3">
            <h4><b>&nbsp;&nbsp;&nbsp;&nbsp;반려생활!</b><br/> &nbsp;&nbsp;&nbsp;&nbsp;알아두면 좋은 상식</h4>
         </div>
         <div class="col-12" style="box-sizing:border-box;">
            <div id="boardList" class="col-xl-12 d-flex flex-wrap" style = "overflow:auto;" align='center'>
            </div>
         </div>
   </div>

   <!--   유기동물-->
         <div class="tab-pane tabContent2" id="profile" role="tabpanel">
            <h4>
               <b>&nbsp;&nbsp;&nbsp;&nbsp;입양홍보!</b><br/> &nbsp;&nbsp;&nbsp;&nbsp;가족이 되어주세요
            </h4>
            <hr>
            <div class="col-12" style="box-sizing:border-box;">
            <div id="" class="col-xl-11 d-flex flex-wrap" style="overflow: auto" align='center'>
               <c:forEach items="${cont1 }" var="i">
<!--                   <div class="col-md-6"> -->
<!--                      <hr> -->
<!--                      <div align="center"> -->
<%--                         <a href="${i.href }"> <img class="appImg" src="${i.image}"> --%>
<!--                         </a> <br> -->
<!--                         <div align="left" class="contDetail"> -->
<!--                            <h5> -->
<%--                               <b>${i.title}</b> --%>
<!--                            </h5> -->
<!--                         </div> -->
<!--                      </div> -->
<!--                   </div> -->
						<div class="card col-md-5" style="margin: 20px; border:1px solid #e3e1e1; box-shadow: 0 0 20px #dfdfe170;
						">
							<div class="card-body">
								<h1 class="card-text"><i class="ri-hearts-fill" style="color: pink;"></i></h1>
								<h4 class="card-title">${i.conTitle}</h4>
							</div>
							<hr>
							<a href="${i.conHref }" class="card-img-bottom"> <img class="appImg" src="${i.conImg}"></a>
							<br>
						</div>
               </c:forEach>

            </div>
         </div>
         </div>
         
<!--          애니멀봐 -->
         <div class="tab-pane tabContent2" id="profile2" role="tabpanel">
            <h4>
               <b>&nbsp;&nbsp;&nbsp;&nbsp;애니멀봐</b><br/>&nbsp;&nbsp;&nbsp;&nbsp;애니멀봐 <b>X</b> 동물농장<i class="ri-tv-fill"></i>
            </h4>
            <div class="col-12" style="box-sizing:border-box;">
               <c:forEach items="${cont2 }" var="i">
                  <hr>
                  <table class="table table-hover">
                  	<tr>
	                  	<td>
	                        <a href="${i.con2Href }"> <img class="appImg4" src="${i.con2Img}">
	                        </a> <br>
	                  	</td>
	                </tr>
	                <tr>  	
	                  	<td>
	                        <h5 style="margin-left: 10px;">
	                              <b>${i.con2Title}</b>
	                        </h5>
	                  	</td>
                  	</tr>
                  </table>
               </c:forEach>
         </div>
         </div>
         
         
         
         
         
         
         
      </div>
<!--       //////// -->
      
      
      
      
      
<strong class = "col-md-4"><i class="dripicons-chevron-left" id="boardDetailBack"> </i></strong>
      <div id = "boardDetailDiv"  style = "display:none"> </div>
</div>

<script>

$(window).on('load', function() {
    setTimeout(function(){
        $("#load").fadeOut();
    }, 1000);
});
</script>
