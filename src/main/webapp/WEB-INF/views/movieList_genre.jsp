<%@page import="java.net.URL"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>[영화검색]goodbye acorn - :)</title>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" href="/controller/resources/css/index.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
   iframe{
       overflow:hidden;
   }
    .viewport {
    overflow: auto;

    /* Make sure the inner div is not larger than the container
     * so that we have room to scroll.
     */
    max-height: 100%;

    /* Pick an arbitrary margin/padding that should be bigger
     * than the max width of all the scroll bars across
     * the devices you are targeting.
     * padding = -margin
     */
    margin-right: -100px;
    padding-right: 100px;
}/* 
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; -webkit-border-radius: 10px; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background-color: #242424;}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
   */  
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
<div class="row">
<body>
<!-- 
<div class="preloader-wrapper big active">
   <div class="spinner-layer spinner-blue-only">
      <div class="circle-clipper left">
         <div class="circle"></div>
      </div><div class="gap-patch">
         <div class="circle"></div>
      </div><div class="circle-clipper right">
         <div class="circle"></div>
      </div>
   </div>
</div>
 -->
    
<!-- 영화 리스트 -->
<div class="row"></div>
<!-- loading screen -->
<!-- <div class="row" id="loading"><img src="resources/images/fire_loading.gif" style="width: 100%; height: 30%"></div> -->
<c:set var="SQUOT" value="'" />
<c:set var="c" value="0"/>
<c:if test="${not empty movie_info.results }">
   <c:forEach var="l" items="${movie_info.results }"> 
      <c:set var="c" value="${c+1 }"/>
      <c:if test="${c == 1 }">
               <div class="row">
            </c:if>
      <div class="col s12 m3 l3" id="GenreList">
           <div class="card" onclick="javascript:createCookie('${l.id}')">
             <div class="card-image waves-effect waves-block waves-light">
                <c:set var="poster" value="https://image.tmdb.org/t/p/w500${l.poster_path}" />
               <c:choose>
                  <c:when test="${poster == null or poster == ''}">
                     <img class="activator" src="http://bja.or.kr/core/images/etc/noimg_main.gif">
                  </c:when>
                  <c:otherwise>
                     <img class="activator" src="${poster}">
                  </c:otherwise>
               </c:choose>
             </div>
             <div class="card-content" id="GenrelistCard">
                 <c:set var="title" value="${l.title}" />
                  <c:set var="titlecut" value="${fn:substring(title, 0, 20) }" />
                     <!-- Modal Trigger -->
                     <a href='javascript:createCookie("${l.id}")'>
                        ${titlecut }
                        <c:if test="${fn:length(title) > 20 }">...</c:if>
                     </a>
                     <!-- <i class="card-title activator material-icons right">more_vert</i> -->
             </div>
             <div class="card-reveal">
               <span class="card-title grey-text text-darken-4">${title }<i class="material-icons right">close</i></span>
               <p>
               
                  <c:forEach var="genre" items="${genre_ids }">
                  </c:forEach>
                  <i class="tiny material-icons">date_range</i> ${l.release_date }<br/>
                  <i class="tiny material-icons">star</i>${l.vote_average}<br/>
                  ${l.overview }
               </p>
             </div>
         </div>
        </div>
        
      <c:if test="${c == 4 }">
         </div>
         <c:set var="c" value="0"/>
      </c:if>    
   </c:forEach>               
</c:if>    
<!-- 리스트 페이징 -->
   <div class="row paging">
      <div class="col s12 m12 l12">
         <form name="frm_page" method="post" action="../controller/movieList_genre">
            <input type="hidden" name="genre"/>
            <input type="hidden" name="pageNum"/>
            <ul class="pagination">
               
               <c:set var="pageNum" value="${movie_info.pageNum }"/>
               <c:set var="currentPageLimitNum" value="${movie_info.currentPageLimitNum }"/>
               
               <!-- Paging limit per 10 -->
               <!-- Total page > 10 -->
               <c:if test="${movie_info.total_pages > 10}">
                  <!-- Page / 10 -->
                  <c:if test="${movie_info.total_pages % 10 == 0}">
                     <c:set var="totalPageNum" value="${movie_info.total_pages / 10 }"/>
                  </c:if>
                  <c:if test="${movie_info.total_pages % 10 != 0}">
                     <fmt:parseNumber var="totalPageNum" value="${(movie_info.total_pages/10)+1}" integerOnly="true" />                  
                  </c:if>
                  
                  <!-- left arrow -->
                  <c:if test="${currentPageLimitNum == 1 }">
                     <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>                  
                  </c:if>
                  <c:if test="${currentPageLimitNum > 1 }">
                     <a href="javascript:page_move_genre(${((currentPageLimitNum-1)*10)-9},'${movie_info.genre}');"><i class="material-icons">chevron_left</i></a></li>                  
                  </c:if>
                  
                  <!-- paging -->
                  <span class="searchList_paging">
                  <c:set var="endPage" value="${currentPageLimitNum*10}"/>
                  <c:if test="${endPage > movie_info.total_pages}">
                     <c:set var="endPage" value="${movie_info.total_pages}"/>
                  </c:if>
                  <c:forEach var="page" begin="${(currentPageLimitNum*10)-9 }" end="${endPage}">
                     <c:choose>
                        <c:when test="${page == pageNum }">
                           <a id="searchlist_paging_selected" href="#!">${page}</a>
                        </c:when>
                        <c:otherwise>
                           <a class="waves-effect" href="javascript:page_move_genre(${page},'${movie_info.genre}');">${page}</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  </span>   
                  <!-- right arrow -->
                  <c:if test="${currentPageLimitNum == totalPageNum }">
                     <li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a>                  
                  </c:if>
                  <c:if test="${currentPageLimitNum < totalPageNum }">
                     <a href="javascript:page_move_genre(${(currentPageLimitNum*10)+1 },'${movie_info.genre}');"><i class="material-icons">chevron_right</i></a>   
                  </c:if>                     
                  
               </c:if>
               
               <!-- Total page <= 10 -->
               <c:if test="${movie_info.total_pages <= 10}">
               
                  <span class="searchList_paging less10">
                     <c:forEach var="page" begin="1" end="${movie_info.total_pages}">
                        <c:choose>
                           <c:when test="${page == pageNum }">
                              <a id="searchlist_paging_selected" href="#!">${page}</a>
                           </c:when>
                           <c:otherwise>
                              <a class="waves-effect" href="javascript:page_move_genre(${page},'${movie_info.genre}');">${page}</a>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </span>
                  <c:choose>
                     <c:when test="${movie_info.pageCnt > 10}">
                        <li class="waves-effect">
                           <a href="javascript:page_move_genre(${((currentPageLimitNum-1)*10)-9},'${movie_info.genre}');"><i class="material-icons">chevron_right</i></a>
                        </li>
                     </c:when>
                     <c:otherwise>
                        <li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                     </c:otherwise>
                  </c:choose>
               </c:if>
            </ul>
         </form>
      </div>
   </div>
 
</body>
</div>
<!-- <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
fullpage
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.8/jquery.fullPage.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script> -->   
<!-- <script type="text/javascript" src="../controller/resources/js/jscookie.js"></script>
<script type="text/javascript" src="../controller/resources/js/index.js"></script> --> -->
</html>