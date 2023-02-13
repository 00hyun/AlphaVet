<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<input type="button" value="약!!!" id="mediBtn" />
			<input type="button" value="전송!!!" id="mediInsertBtn" />
			<div id="res"></div>
		</div>
		<div class="container-fluid">
			<input type="button" value="동물병원" id="clinicBtn" />
			<input type="button" value="전송!!!" id="cliniciInsertBtn" />
			<div id="res"></div>
		</div>
	</div>

	<script>
$(function(){
	var data;
	
	// 약
	$("#mediBtn").on("click", function(){
// 		$.ajax({
// 			method : "get",
// 			url : "https://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01?serviceKey=fc20v%2BFtQqUzJ4JBR4J1Ln0Iq8mJcXnp5e4KHyEU4unQ%2BvZxf4UqPZNXga1HScqDpzWYD2wcrE%2Bx7XDYE%2BqOzA%3D%3D&numOfRows=100&pageNo=43&type=json",
// 			contentType : false,
// 			dataType : "json",
// 			success : function(rslt){
// 				data = rslt.body.items;
// 			}
// 		})
	})
	$("#mediInsertBtn").on("click", function(){
// 		$.ajax({
// 			method : "post",
// 			url : "/insertMedi",
// 			data : JSON.stringify(data),
// 			contentType : "application/json;charset=utf-8",
// 			dataType : "json",
// 			success : function(){}
// 		})
	})

	// 동물병원
	$("#clinicBtn").on("click", function(){
		$.ajax({
			method : "get",
			url : "https://apis.data.go.kr/3660000/AnimalHospitalListService/getAnimalHospitalList?serviceKey=fc20v%2BFtQqUzJ4JBR4J1Ln0Iq8mJcXnp5e4KHyEU4unQ%2BvZxf4UqPZNXga1HScqDpzWYD2wcrE%2Bx7XDYE%2BqOzA%3D%3D&numOfRows=100&pageNo=1&bplc_nm=",
			contentType : false,
			dataType : "json",
			success : function(rslt){
// 				console.log(rslt);
// 				console.log(rslt.resultlist);
				data = rslt.resultlist;
				$.each(rslt.resultlist, function(i,v){
					var keys = Object.keys(v);
					for(var i = 0; i < keys.length; i++){					
						var key = keys[i];
						console.log("key : " + key + ", value : " + v[key]);
					}
				})
					console.log(data);
			}
		})
	})
	$("#cliniciInsertBtn").on("click", function(){
		$.ajax({
			method : "post",
			url : "/insertClinic",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(){}
		})
	})
})
</script>
</body>
</html>