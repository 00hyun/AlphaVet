<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<style>
.date-time{
	font-size: 1.05em;
	font-weight: 600;
}

</style>
<!-- 예약 -->
      <div class="card row">
         <div class = "card-body">
            <div class="row col-md-12">
<!--             		<div class='card-body' align='center'> -->
<%--     		<img class='logo logoLogin' src='${pageContext.request.contextPath }/resources/images/appImg/alphaPet.png' width='200px' /> --%>
<!--     		</div> -->
                   <div class="col-md-4">
                      <select class="form-select" aria-label="Default select example" id = "selectPet3">
                      </select>
                   </div>
<!--                    예약현황
                  <div class = "col-md-8">
                  <button class="btn btn-primary col-md-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">예약현황</button>
                     <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                         <div class="offcanvas-header">
                           <h5 id="offcanvasBottomLabel">예약현황</h5>
                           <button id = "closeBtn" type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                         </div>
                         <div class="offcanvas-body">
                        <div class = "card-body">
                           <p>예약현황</p>
                           <div id = "myReservation"></div>
                        </div>
                         </div>
                     </div>
                  </div> -->
                </div>
         </div>
<!--          <hr class = "my-4">          -->
		 
		 <!-- 예약진행 -->
		 <div id = "resDiv2"></div>
		 <div id = "resDiv">
	         <div class="accordion card-body" id="accordionExample">
	            <!-- 진료 과, 담당 의사 선택 -->
	            <div align="right">
                	<img src='${pageContext.request.contextPath }/resources/images/appImg/hosImg.png' width='100px' style='margin-bottom:2px; z-index: 5; position: relative;' />
	            </div>
<!-- 	            <hr> -->
	            <div class="accordion-item">
	               <h2 class="accordion-header" id="headingOne">
	                  <button id = "accordion-emp" class="accordion-button" type="button"
	                     data-bs-toggle="collapse" data-bs-target="#collapseThree"
	                     aria-expanded="true" aria-controls="collapseThree">
	                     <h4><i class='ri-user-2-line'></i><span id = "empSelect"><b> 예약 세부</b></span></h4>   
	                  </button>
	               </h2>
	               <div id="collapseThree" class="accordion-collapse collapse show"
	                  aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                     <div class = "row col-md-12">
	                        	<label class="col-md-2 col-form-label" style="text-align: right;font-weight: 500;"><h5> <b>진료과</b></h5></label>
	                        <div class="col-md-10">
	                           <select id = "animalSelect" class="form-select" aria-label="Default select example">
	                              <option selected=""><b>진료과를 선택해주세요</b></option>
	                              <option value="dog"><b>강아지</b></option>
	                              <option value="cat"><b>고양이</b></option>
	                           </select>
	                        </div>
	                        <div id = "empListDiv" style = "margin-top: 10px; margin-left: 30px;"></div>
	                     </div>
	                  </div>
	               </div>
	            </div>
	            <!-- 날짜 선택 -->
	            <div class="accordion-item">
	               <h2 class="accordion-header" id="headingTwo">
	                  <button id = "accordion-date" class="accordion-button collapsed" type="button"
	                     data-bs-toggle="collapse" data-bs-target="#collapseOne"
	                     aria-expanded="false" aria-controls="collapseOne">
	                     <h4><i class='ri-calendar-check-fill'></i><span id = "dateSelect"><b> 날짜 선택</b></span></h4>
	                  </button>
	               </h2>
	               <div id="collapseOne" class="accordion-collapse collapse"
	                  aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                     <%@ include file = "appCalendar.jsp" %>
	                  </div>
	               </div>
	            </div>
	            <!-- 시간 선택 -->
	            <div class="accordion-item">
	               <h2 class="accordion-header" id="headingThree">
	                  <button id = "accordion-clock" class="accordion-button collapsed" type="button"
	                     data-bs-toggle="collapse" data-bs-target="#collapseTwo"
	                     aria-expanded="false" aria-controls="collapseTwo">
	                     <h4><i class='mdi mdi-clock-outline'></i><span id = "timeSelect"><b> 시간 선택</b></span></h4>
	                  </button>
	               </h2>
	               <div id="collapseTwo" class="accordion-collapse collapse"
	                  aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	                     <table id = "time" border="1">
	                        <tr>
	                           <td colspan="4" id = "am">오전</td>
	                        </tr>
	                        <tr>
	                           <td class = "date-time">09:00</td>
	                           <td class = "date-time">09:30</td>
	                           <td class = "date-time">10:00</td>
	                           <td class = "date-time">10:30</td>
	                        </tr>
	                        <tr>
	                           <td class = "date-time">11:00</td>
	                           <td class = "date-time">11:30</td>
	                        </tr>   
	                        <tr>
	                           <td colspan="4" id = "pm">오후</td>
	                        </tr>
	                        <c:forEach var="i" begin="12" end="19">
	                           <c:choose>
	                              <c:when test="${i%2 == 0}">
	                                 <tr>
	                                    <td class = "date-time"><c:out value="${i}" />:00</td>
	                                    <td class = "date-time"><c:out value="${i}" />:30</td>                                    
	                              </c:when>
	                              <c:otherwise>
	                                    <td class = "date-time"><c:out value="${i}" />:00</td>
	                                    <td class = "date-time"><c:out value="${i}" />:30</td>
	                                 </tr>
	                              </c:otherwise>
	                           </c:choose>
	                        </c:forEach>
	                     </table>
	                     <div align="right">
		                     <input style="width: 20%;" class = "col-md-12 btn btn-info btn-lg waves-effect waves-light" type = "button" value = "예약하기" id = "submitBtn">   
	                     </div>
	                  </div>
	               </div>
	            </div>
	         </div>
         </div>
      </div>
