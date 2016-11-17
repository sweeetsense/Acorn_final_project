<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type="text"][disabled] {
   border-bottom: 1px solid #9e9e9e;
   box-shadow: 0 1px 0 0 #000;
   color: #9e9e9e;
}
</style>
</head>

<body>
<div class="row">
  <div class="col s12 m6 l6" style="text-align: center; color: white; border: 3px solid #00bfa5; border-radius: 5px; height: 35rem;">
	<c:choose>
		<c:when test="${count ne 0}">
		 	<form name="msg" action="/controller/r_insert" method="post" onsubmit="return r_msgSubmit()" >
		 	<div class="input-field col s3 l3">
		            <input id="input_text" type="text" name="r_name" length="5">
		            <label for="input_text">닉네임</label>
		     </div>
		     <div class="input-field col s12 l5" id="test">
		            <input disabled placeholder="영화를 클릭하면 영화명이 삽입됩니다." type="text" id="r_movie_name2" name="r_movie_name2" class="validate">
		            <input type="hidden" name="r_movie_name">
		            <input type="hidden" name="r_movie_id">
		     </div>
		     <div class="input-field col s4 l4">
		        <input class="with-gap" name="r_like" type="radio" id="good" value="good" checked>
		        <label for="good">좋아요!</label>
		        <input class="with-gap" name="r_like" type="radio" id="bed" value="bed">
		        <label for="bed">싫어요!</label>
		     </div>
		     
		 	 <div class="input-field col s12">
		            <textarea id="textarea1" class="materialize-textarea col s10" name="r_msg" length="90"></textarea>
		            <label for="textarea1">덧글</label>
		            <button class="btn waves-effect waves-light col s2" type="submit" name="action">덧글작성</button>
		          </div>
		    </form>
			<table id="ex" class="uk-table uk-table-hover uk-table-striped" style="zoom: 0.9;">
					<thead>
					 <tr><th>Comment List</th></tr>
					</thead>
					<tbody>
				<c:forEach var="r" items="${list}">
					
					<tr>
						<td class="col s12 m12 l12" style="background-color: #121212;">
						<c:choose>
							<c:when test="${r.r_like == 'good'}">
								<img src="../resources/images/good.png" height="15px" width="15px">
							</c:when>
							<c:otherwise>
								<img src="../resources/images/bed.png"  height="15px" width="15px">
							</c:otherwise>
						</c:choose>
						<b>${r.r_name}</b> <c:if test="${admin != null}"><a href="/controller/r_delete?r_id=${r.r_id}"><img src="../resources/images/remove.png" height="15px" width="15px"></a></c:if>
						<span style="color: #c5c5c5;">[${r.r_movie_name}]</span>&nbsp;&nbsp;&nbsp;
						<span style="color: #97d5c6">${r.r_date}</span>
						</td>
					</tr>
					<tr>
						<td class="left-align col s12" colspan="2" style="background-color: #121212"> > ${r.r_msg}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:when>
	 	<c:otherwise>
	 		<form name="msg" action="/controller/r_insert" method="post" onsubmit="return r_msgSubmit()" >
		 	<div class="input-field col s3 l3">
		            <input id="input_text" type="text" name="r_name" length="5">
		            <label for="input_text">닉네임</label>
		     </div>
		     <div class="input-field col s12 l5" id="test">
		            <input disabled placeholder="영화를 클릭하면 영화명이 삽입됩니다." type="text" id="r_movie_name2" name="r_movie_name2" class="validate">
		            <input type="hidden" name="r_movie_name">
		            <input type="hidden" name="r_movie_id">
		     </div>
		     <div class="input-field col s4 l4">
		        <input class="with-gap" name="r_like" type="radio" id="good" value="good" checked>
		        <label for="good">좋아요!</label>
		        <input class="with-gap" name="r_like" type="radio" id="bed" value="bed">
		        <label for="bed">싫어요!</label>
		     </div>
		     <div class="input-field col s12">
		            <textarea id="textarea1" class="materialize-textarea col s10" name="r_msg" length="90"></textarea>
		            <label for="textarea1">덧글</label>
		            <button class="btn waves-effect waves-light col s2" type="submit" name="action">덧글작성</button>
		          </div>
		     </form>
		     
	    	<div class="col s12"><h3>덧글이 없습니다.</h3></div>
	    	
		</c:otherwise>
	</c:choose>
  </div>
</div>
</body>
</html>