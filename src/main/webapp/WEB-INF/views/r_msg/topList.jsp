<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
   ::-webkit-scrollbar {
    width: 6px;
}
 
/* Track */
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    -webkit-border-radius: 10px;
    border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    -webkit-border-radius: 10px;
    border-radius: 10px;
    background: rgba(255,255,255,0.8); 
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}
::-webkit-scrollbar-thumb:window-inactive {
   background: rgba(255,255,255,0.4); 
}
</style>
</head>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script> -->
<script type="text/javascript" src="../controller/resources/js/r_msg.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<body>
<div class="row" style="color: white;">

<table class="col s12">
	<c:set var="a" value="${(movie_info.pageNum * 20)-19}" />
	<c:forEach var="m" items="${movie_info.results}">
		
		<tr>
			<td>${a}위</td><td><a href="javascript:movieid('${m.id}','${m.title}')">${m.title}</td><td>${m.vote_average}/10</td><td>${fn:substring(m.popularity,0,4)}점</td>
			<c:set var="a" value="${a+1}" />
		</tr>
	</c:forEach>
</table> 


</div>
<div class="row result_none">
</div>
</body>
</html>