<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
// 		confirm('${msg}')
		
// 		if(confirm('${msg}') == true){
			
// 		}else{
// 			location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}';
// 		}

	alert('${msg}')
	location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}';
	</script>
</body>
</html>