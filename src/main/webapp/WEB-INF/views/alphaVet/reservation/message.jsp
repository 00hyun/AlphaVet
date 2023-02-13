<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<sec:authentication property="principal" var = "principal"/>

<style>
.smsTr{
	height : 50px;
}
.smsTd{

/* 	을 사용해 영역을 감출 것 */
	overflow: hidden;  		
/* 	 로 ... 을 만들기  */
	text-overflow: ellipsis;  
	white-space: nowrap;
	height : 50px;
}

#smsBtn{
	margin-left: 92%;

}

.col-sm-3{
	text-align: right;
}

#test_cnt{
	text-align: right;
}

.smsLabel{
	text-align: right;
	margin-right: -1.5px;
	width: 110%;	
}

.col-sm-4{
	text-align: right;
	margin-top: 2.5%;
	margin-right: -1%;
	font-size: 1.05em;
}
</style>

<script>
function sendSMS(pthis){
	   var data =  $('#smsForm').serialize();

	   console.log("등록 내용 : " + $('#smsForm').serialize());

	   var data = {
	      patId : $("[name=patId]").val(),
// 	      phoneNumber : $("[name=phoneNumber]").val(),
	      phoneNumber : document.smsForm.phoneNumber.value,
	      content : document.smsForm.content.value
	   }
	   
	   console.log("메시지 전송 : ",data);
	   
	   
	   Swal.fire({
		   title: 'SMS 전송',
		   icon: 'warning',
		   text: '해당 내용을 전송하시겠습니까?',
		   
		   showCancelButton: true, 
		   confirmButtonText: '전송', 
		   cancelButtonText: '취소', 
		   
			}).then(result =>{

			   if (result.isConfirmed) {
	   
	       $.ajax({
	          url : "${webPath}/reservation/sendSms" 
	        , type : "POST"
	        , data : JSON.stringify(data)
	        , contentType : "application/json"
	          , dataType: "text"
	        , success : function(rslt){    // 성공
	            console.log(rslt);
	           if(rslt = "OK"){         
	 				Swal.fire({
						  icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '예약 문자 전송이 완료되었습니다.',
						  text: 'SMS를 성공적으로 전송하였습니다.'
						});
	              console.log("sms 전송 : ",data);
	              sendMessage();
	              $('#smsForm').each(function(){
	            	    this.reset();
	            	  });

	            }else {
	                alert("전송 실패");
	 				Swal.fire({
						  icon: 'warning',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
						  title: '메세지 전송에 실패하였습니다.',
						  text: '다시 시도해주세요.'
						});
	             }
	           }
	        });
	      }else{
				Swal.fire({
					  icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
					  title: '메세지 전송을 취소하였습니다.'
					});
	      return false;
	   }
			})
	}
		
	    function sendMessage(){
			let data = {
				phoneNumber : document.smsForm.phoneNumber.value,
				content : document.smsForm.content.value
			}
			
			$.ajax({
				method : "post",
				url : "reservation/sendMSG",
				data : JSON.stringify(data),
				contentType:"application/json;charset=utf-8",
				dataType : "text",
				processData : false,
				success : function(){
					console.log("메세지 전송 성공");
				}
			});
		};

		$(document).ready(function() {
		    $('#smsContent').on('keyup', function() {
		        $('#test_cnt').html("<span class='font500'>("+$(this).val().length+" / 200)bytes</span>");
		 
		        if($(this).val().length > 200) {
		            $(this).val($(this).val().substring(0, 200));
		            $('#test_cnt').html("<span class='font500'>(200 / 200)bytes</span>");
		        }
		    });
		});
	
	
		
</script>

<div class="card overflow-hidden card-h-100">
						<div class="card-body">
							<h4 class="card-title">
								<a class='form-label h5'><i class='ri-message-2-fill'></i>
								<b>&nbsp;예약 문자 전송</b></a>
							</h4>
							<hr>

							<div class="card-body">
								<form name="smsForm" id="smsForm">
									<div class="mb-3">
										<div class="row">
											<div class="col-md-5">
												<div class="row mb-3" >
														<div class="col-sm-4">
					                                        <label style="text-align: right;"><h6 class="smsLabel">환자명</h6></label>
														</div>
			                                          <div class="col-sm-8" id="patInfoSms">
															<input type="text" class="form-control SmsValue" id="smsValueNm" value="" placeholder="환자명"/>
									                        <input type="hidden" class="form-control SmsValue" id="patId2" >
<!-- 									                        <input type="hidden" name="phoneNumber" value="01091432075"> -->
			                                            </div>

												</div>
												<div class="row mb-3" >
														<div class="col-sm-4">
					                                        <label style="text-align: right;"><h6 class="smsLabel">전화번호</h6></label>
														</div>
			                                          <div class="col-sm-8" id="smsValueNm">
															<input type="text" class="form-control SmsValue" name="phoneNumber" value="" placeholder="전화번호"/>
			                                            </div>

												</div>
							                        	<div class="row mb-3">
								                        	<div class="col-sm-4">
						                                        <label style="text-align: right;"><h6 class="smsLabel">서식선택</h6></label>
															</div>
															<div class="col-sm-8">
																<c:if test="${!empty smsList}">
																	<select id="smsTitle" class="form-control SmsValue" name="content" id ="smsValueCon">
																		<option value=""> 문자 서식 선택 </option>
																		<c:forEach items="${smsList }" var="sms">
																			<option value="${sms.smsContent }">${sms.smsTitle }</option>
																		</c:forEach>
																	</select>
																</c:if>
															</div>
							                        	</div>
											</div>
											<div class="col-md-7">
												<div class="row mb-3">
													<div class="col-sm-1">
														<label class="form-label h6" for="message"><h5><i class="ri-message-3-line"></i></h5></label>
													</div>
													<div class="col-sm-11">
														<textarea name="smsContent" id="smsContent" class="input-large smsInput form-control" rows="7" placeholder="문자 내용을 입력해주세요.  &#13;&#10;200bytes까지 입력 가능합니다."></textarea>
														<div id="test_cnt"><span class="font500">(0 / 200)bytes</span></div>
													</div>
												</div>
											</div>
										</div>
										<div>
											<input type="button" id="smsBtn"
												class="btn btn-primary waves-effect waves-light" value="전송" onclick="sendSMS(this)">
										</div>
									</div>
								</form>
								<hr>
							</div>
						</div>
					</div>





