<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!-- <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Old+Standard+TT:400italic|Raleway:400,300,700,500"> -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.8.8/jquery.fullPage.css" />

<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>	

<link rel="stylesheet" href="css/index.css">

<title>Movie Camp</title>
</head>
<body>
	<!-- MainMenu-->
	<div class="mainmenu_container" id="mainmenu_container">

		<!-- 		
		<embed width="320" height="25"
			src="http://www.youtube.com/v/mLtSzudHz-U?list=RDEMvSWR6x0oOZr3rUvv_2v5Eg?version=2&autoplay=1&loop=1"
			type="application/x-shockwave-flash" wmode="opaque">
		</embed>
-->
		<ul id="menu" class="mainmenu">
			<li data-menuanchor="section_search" class="col s3"><a
				class="waves-effect waves-light btn-large black"
				href="#section_search/slide1">Search</a></li>
			<li data-menuanchor="section_Top100" class="col s3"><a
				class="waves-effect waves-light btn-large black"
				href="#section_Top100">Top100</a></li>
			<li data-menuanchor="section_Genre" class="col s3"><a
				class="waves-effect waves-light btn-large black"
				href="#section_Genre">Genre</a></li>
			<li data-menuanchor="section_QnA" class="col s2"><a
				class="btn-large black" href="#section_QnA">QnA</a></li>
			<li><a id="mainmenu_record" href="javascript:open_log()" title="봤던 영화 목록 보기"><i class="medium material-icons" id="img_icon">update</i></a></li>
		</ul>
	</div>
	<div id="fullpage">
		<div class="section active" data-anchor="section_main"
			style="background-image: url('images/mainbackground.gif'); background-size: 100% 100%;">
		
			<div class="autoplay">
				<div>
					<div class="image">
						<img src="images/pic1.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic2.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic3.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic4.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic5.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic6.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic7.png" />
					</div>
				</div>
				<div>
					<div class="image">
						<img src="images/pic8.png" />
					</div>
				</div>
			</div>
		</div>
		<div class="section" data-anchor="section_search" style="background-color: #242424; text-align: center; margin: 0;">
			<div class="slide" data-anchor="slide1" style="margin-top: 15px">
					<!-- search section -->
					<div class="row">
						<div class="row main_title">
							<div class="col s4 m5 l6 main_title_icon">
								<a href="index.jsp"><i class="large material-icons shadow"
									id="search_title_icon">movie</i></a>
							</div>
							<div class="col s8 m7 l6 main_title_text">
								Before <span class="main_title_large">&nbsp;Movie</span> , 
							</div>
						</div>
						<div class="row">
							<div class="col s12 m1 l2"></div>
							<div class="col s12 m10 l8">
								<nav class="searchBar">
									<div class="nav-wrapper">
										<form id="form-action" name="main_search_form" method="post" action="../movieList" onsubmit="mainsearch_silder();return false">
											<!-- method="post" -->
											<div class="input-field">
												<input type="search" name="keyword" id="search"
													class="autocomplete"
													placeholder="Input Movie Name" required>
												<label for="search"><i class="material-icons" id="search_keyword">search</i></label> 
												<i class="material-icons" id="search_clear">close</i>
											</div>
										</form>
									</div>
								</nav>
							</div>
							<div class="col s12 m1 l2"></div>
						</div>

						<!-- BoxOffice -->
						<div class="row" style="color: #ffffff;">
							<div class="col m1 l2"></div>
							<div class="col s12 m10 l8" id="dailyBoxOffice"
								style="background-color: #141414; border: 5px solid #00bfa5; border-radius: 10px;">
									<div class="slider single-item">
										<div id="search_carousel_daily">
											<p class="lead" id="lead"
												style="font-size: 1.9em; color: #00bfa5;">Daily Box Office</p>
											<div id="boxoffice_container">
												<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
													<c:forEach var="boxoffice"
														items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }">
														<table>
															<tr>
																<td id="boxoffice_rank">
																	<c:out value="${boxoffice.rank }" />
																</td>
																<td id="boxoffice_rankInten">
																	<c:if test="${boxoffice.rankInten > 0}">
																	<b style="color: blue;"><i class="tiny material-icons">arrow_upward</i>
																		<c:out value="${boxoffice.rankInten }" /></b>
																	</c:if>
																	<c:if test="${boxoffice.rankInten == 0}">
																		<b><c:out value="-" /></b>
																	</c:if>
																	<c:if test="${boxoffice.rankInten < 0}">
																		<b style="color: red;"><i class="tiny material-icons">arrow_downward</i>
																			<c:out value="${fn:substring(boxoffice.rankInten,1,2) }" /></b>
																	</c:if>
																</td>
																<td id="boxoffice_movieNm">
																	<b><c:out value="${boxoffice.movieNm }" /></b>
																</td>
																<td id="boxoffice_audiAcc">
																	<fmt:formatNumber value="${boxoffice.audiAcc }" pattern="#,###" /> 명
																</td>
															</tr>
														</table>
													</c:forEach>
												</c:if>
											</div>
										</div>
										<div id="search_carousel_weekly">
											<p class="lead" id="lead"
											style="font-size: 1.9em; color: #00bfa5;">Weekly Box Office</p>
											<div id="boxoffice_container">
												<c:if test="${not empty weeklyResult.boxOfficeResult.weeklyBoxOfficeList }">
													<c:forEach var="boxoffice"
														items="${weeklyResult.boxOfficeResult.weeklyBoxOfficeList }">
														<table>
															<tr>
																<td id="boxoffice_rank">
																	<c:out value="${boxoffice.rank }" />
																</td>
																<td id="boxoffice_rankInten">
																	<c:if test="${boxoffice.rankInten > 0}">
																	<b style="color: blue;"><i class="tiny material-icons">arrow_upward</i>
																		<c:out value="${boxoffice.rankInten }" /></b>
																	</c:if>
																	<c:if test="${boxoffice.rankInten == 0}">
																		<b><c:out value="-" /></b>
																	</c:if>
																	<c:if test="${boxoffice.rankInten < 0}">
																		<b style="color: red;"><i class="tiny material-icons">arrow_downward</i>
																			<c:out value="${fn:substring(boxoffice.rankInten,1,2) }" /></b>
																	</c:if>
																</td>
																<td id="boxoffice_movieNm">
																	<b><c:out value="${boxoffice.movieNm }" /></b>
																</td>
																<td id="boxoffice_audiAcc">
																	<fmt:formatNumber value="${boxoffice.audiAcc }" pattern="#,###" /> 명
																</td>
															</tr>
														</table>
													</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							<div class="col s12 m1 l2"></div>
						</div>
				</div>
			</div>
			<div class="slide" data-anchor="slide2" id="main_searchlist" style="display: none;">
				<%-- <div id="slideshow">
				<%@include file="movieList.jsp" %>
				</div> --%>
				<iframe id="slideshow" style="width: 100%; height: 100%;"></iframe>
			</div>
			
			<div class="slide" data-anchor="slide3" id="main_searchdetail" style="display: none;">
				<div class="row" style="height: 100%;">
					<div id="detail_menu" class="row col s2 m2 l2">
						<table>
		                     <tr>
		                        <td>
		                            <table class="highlight centered" id="detail_table" style="border-radius: 5px;">
		                             <tbody>
		                                <tr><td id="detailmenu_INFO">INFO</th></tr>
		                                <tr><td id="detailmenu_Actor">Actor</td></tr>
		                                <tr><td id="detailmenu_Photo">Photo</td></tr>
		                                <tr><td id="detailmenu_Trailer">Trailer</td></tr>
		                             </tbody>
		                           </table>
		                        </td>
		                     </tr>
		                </table>
	                </div>
					<div class="row col s10 m10 l10">
						<div class="intro">
							<!-- <div id="slidedetailshow"></div> -->
							<iframe id="slideshow" style="width: 100%; height: 100%;"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section" data-anchor="section_Top100" style="background-color: #121212;">
			<div class="slide">
				<div class="row" style="color: #ffffff;">
					<div class="col s12 m5 l5" id="movieTop100"
						style="background-color: #141414; border: 3px solid #00bfa5; border-radius: 10px;">
						<p class="lead" id="lead"
							style="font-size: 1.9em; color: #00bfa5;">Movie Top 100</p>
						<iframe height="60%" width="100%" frameborder="0" class="col s12"
							src="../top100?pageNum=1" name="top100" style="height: 70%"></iframe>
						<div class="col offset-s1 l2"></div>
						<ul class="pagination col s11 l10 offset-l2" style="color: white;">
							<li class="waves-effect"><a href="../top100?pageNum=1"
								target="top100"><i class="material-icons">chevron_left</i></a></li>
							<li class="waves-effect"><a href="../top100?pageNum=1"
								target="top100">1</a></li>
							<li class="waves-effect"><a href="../top100?pageNum=2"
								target="top100">2</a></li>
							<li class="waves-effect"><a href="../top100?pageNum=3"
								target="top100">3</a></li>
							<li class="waves-effect"><a href="../top100?pageNum=4"
								target="top100">4</a></li>
							<li class="waves-effect"><a href="../top100?pageNum=5"
								target="top100">5</a></li>
							<li class="waves-effect"><a href="../top100?pageNum=5"
								target="top100"><i class="material-icons">chevron_right</i></a></li>
						</ul>

					</div>

					<div class="col l1"></div>
					<jsp:include page="/r_msg" flush="false" />

				</div>
			</div>
			<div class="slide">
				<iframe height="100%" width="100%" frameborder="0" class="col s12" style="text-align: center;" src="../r_msgChart"></iframe>
			
			</div>
		
		</div>
		<div class="section" data-anchor="section_Genre" style="background-color: #242424;">
	         <div class="slide active">
	               <div class="intro">
	                  <table style="height: 100%;">
	                     <tr>
	                        <td style="width:10%;">
	                            <table class="highlight centered" id="genre_table" style="border-radius: 5px;">
	                             <thead>
	                                <tr><th data-field="id">Genre</th></tr>
	                             </thead>
	                             
	                             <tbody id="pageA">
	                                <tr><td class="Action">Action</td></tr>
	                                <tr><td class="Comedy">Comedy</td></tr>
	                                <tr><td class="Drama">Drama</td></tr>
	                                <tr><td class="Fantasy">Fantasy</td></tr>
	                                <tr><td class="Horror">Horror</td></tr>
	                                <tr><td class="SF">SF</td></tr>
	                                <tr><td class="Animation">Animation</td></tr>
	                                <tr><td class="Romance">Romance</td></tr>
	                                <tr><td class="Thriller">Thriller</td></tr>
	                                <tr><td class="Documentary">Documentary</td></tr>
	                             </tbody>
	                           </table>
	                        </td>
	                        <td><iframe id="ifA" src="../movieList_genre?genre=28"></iframe></td>
	                     </tr>
	                  </table>
	               </div>
	           </div>
	           
	           <div class="slide">
	               <div class="intro">
	                  <table style="height: 100%;">
	                     <tr>
	                        <td style="width:10%">
	                            <table class="highlight centered" id="genre_table" style="border-radius: 3px;">
	                             <thead>
	                                <tr><th data-field="id">Genre</th></tr>
	                             </thead>
	                             
	                             <tbody id="pageB">
	                                <tr><td class="Action">Action</td></tr>
	                                <tr><td class="Comedy">Comedy</td></tr>
	                                <tr><td class="Drama">Drama</td></tr>
	                                <tr><td class="Fantasy">Fantasy</td></tr>
	                                <tr><td class="Horror">Horror</td></tr>
	                                <tr><td class="SF">SF</td></tr>
	                                <tr><td class="Animation">Animation</td></tr>
	                                <tr><td class="Romance">Romance</td></tr>
	                                <tr><td class="Thriller">Thriller</td></tr>
	                                <tr><td class="Documentary">Documentary</td></tr>
	                             </tbody>
	                           </table>
	                        </td>
	                        <td><iframe id="ifB"></iframe></td>
	                     </tr>
	                  </table>
	               </div>
	           </div>
		</div>
		<div class="section" data-anchor="section_QnA" style="background-color: #121212;">
			<!-- <a href="../boardList">QnA</a> <a href="../adminLogin">admin</a> -->
			<div class="qna_load"></div>
			<%@include file="/WEB-INF/views/footer.jsp"%>
		</div>
	</div>
	
	<!-- board List Modal -->
		<!-- 비밀번호 폼 -->
		<!-- Modal Structure -->
		<div id="modalPass" class="modal center" style="background-color: #121212">
			<div class="modal-content">
				<div>
				<form name="f" id="f" method="get">
					<input type="hidden" name="b_no" id="b_no"/>
					<br>
					<h4 style="color: white;">비밀번호</h4>
					<label>해당 게시글의 비밀번호를 입력해주세요.</label>
			        <input type="password" maxlength="20" name="b_pass" id="b_pass" style="color: white;">
			       	<button type="button" onclick="javascript:closePwd();" class="btn btn-default">Close</button>
			        <button type="button" onclick="javascript:checkPwd();" class="btn btn-default">OK</button>
				</form>
				</div>
			</div>
		</div> 
		<!-- //비밀번호 폼 -->
		
		<!-- 확인 폼 -->
		<!-- Modal Structure -->
		<div id="modalOk" class="modal center" style="background-color: #121212">
			<div class="modal-content">
				<div>
					<h4 style="color: white;">정말 삭제하시겠습니까?</h4>
					<br><br><br><br>
			       	<button type="button" onclick="javascript:closeOk();" class="btn btn-default">Close</button>
			        <button type="button" onclick="javascript:checkOk();" class="btn btn-default">OK</button>
				</div>
			</div>
		</div> 
		<!-- //확인 폼 -->	
	<!-- Loading... -->
		<div class="wrap-loading display-none">
			<div>
	    	<img src="images/loading9.gif"/>
	    	</div>
		</div>
</body>
</html>




