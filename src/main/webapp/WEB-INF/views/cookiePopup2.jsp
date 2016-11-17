<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Popular Movies — The Movie Database (TMDb)</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="cleartype" content="on">
	<meta charset="utf-8">
	<meta name="msapplication-TileColor" content="#00d573">
	<meta name="msapplication-TileImage" content="https://www.themoviedb.org/assets/bbbc36f5620f0c7d852a8d51495fdecd/images/icons/v4/mstile-144x144.png">
	<meta name="keywords" content="Movies, TV Shows, Reviews, API, Actors, Actresses, Photos, User Ratings, Synopsis, Trailers, Teasers, Credits, Cast">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	
	<meta name="theme-color" content="#00d573">
	<link rel="apple-touch-icon" sizes="180x180" href="https://www.themoviedb.org/apple-touch-icon.png">
	<link rel="shortcut icon" type="image/icon" href="https://www.themoviedb.org/favicon.ico"/>
	<link rel="icon" type="image/png" href="https://www.themoviedb.org/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="https://www.themoviedb.org/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="https://www.themoviedb.org/manifest.json">
	<link rel="mask-icon" href="https://www.themoviedb.org/safari-pinned-tab.svg" color="#00d474">
	<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
	<link rel="preconnect" href="https://image.tmdb.org/" crossorigin>
	<link rel="canonical" href="https://www.themoviedb.org/movie">
	<link rel="search" type="application/opensearchdescription+xml" title="TMDb Search" href="/opensearch.xml">
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600,700&subset=latin' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://www.themoviedb.org/multi_assets/61814e6d20a6af195d077b4064c25bd5/stylesheets/normalize.css,v4/header.css,v2/index.css,v2/screen.css,v2/media_list.css,v2/form.css,v2/table.css,v2/content.css,v2/search.css,v4/mobile/header.css,v2/mobile/index.css,v2/mobile/screen.css,v2/mobile/media_list.css,v2/mobile/form.css,v2/mobile/table.css,v2/mobile/content.css,v2/mobile/search.css">
  
    <link rel="stylesheet" href="https://www.themoviedb.org/assets/630894dc60dde45a218b4a37b3cbfc10/stylesheets/v2/glyphicons.css">
  
    <link rel="stylesheet" href="https://www.themoviedb.org/assets/1d371dddedf8845c3f6d230c773041b9/stylesheets/v2/glyphicons-social.css">
  
    <link rel="stylesheet" href="https://www.themoviedb.org/assets/4911f0beae65b134fb15e0cef8ea09d2/stylesheets/kendo-2016-3.914/kendo.common-material.min.css">
  
    <link rel="stylesheet" href="https://www.themoviedb.org/assets/d40f3476e23070c18c6a62fd0843a236/stylesheets/kendo-2016-3.914/kendo.material.min.css">
  
    <link rel="stylesheet" href="https://www.themoviedb.org/assets/5bc448bba959cc20eaf2912a943d8cfa/stylesheets/v2/kendo.material.override.css">
  
	<link rel="alternate" hreflang="x-default" href="https://www.themoviedb.org/movie">
  
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css"> -->
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://www.themoviedb.org/assets/08bc2b82385dfd23a787f85d2b706d93/javascripts/lazysizes.min.js" async></script>
	<script src="https://www.themoviedb.org/multi_assets/34a48e50e2a62370061cdd52f3fa68c8/javascripts/modernizr-2.7.1.min.js,jquery-1.11.3.min.js,jquery.autosize.min.js,jquery.starRating.min.js,jquery.waypoints.min.js,jquery.history.min.js,jquery.scrollTo.min.js,jquery.dotdotdot.min.js,kendo-2016-3.914/kendo.core.min.js,kendo-2016-3.914/kendo.data.min.js,kendo-2016-3.914/kendo.popup.min.js,kendo-2016-3.914/kendo.list.min.js,kendo-2016-3.914/kendo.fx.min.js,kendo-2016-3.914/kendo.notification.min.js,kendo-2016-3.914/kendo.tooltip.min.js,kendo-2016-3.914/kendo.userevents.min.js,kendo-2016-3.914/kendo.draganddrop.min.js,kendo-2016-3.914/kendo.window.min.js,kendo-2016-3.914/kendo.mobile.scroller.min.js,kendo-2016-3.914/kendo.virtuallist.min.js,kendo-2016-3.914/kendo.multiselect.min.js,kendo-2016-3.914/kendo.dropdownlist.min.js,kendo-2016-3.914/kendo.autocomplete.min.js,Chart.min.js,index_v2.js,v2/site.js"></script>
  
  <style type="text/css">
  	main{
  		padding-top: 50px;
  	}
	div.page_wrap:after {
	    content: "";
	    display: block;
	    height: 0px;
	}
	div.media {
	    width: 1000px;
	    margin: 0 auto;
	    margin-top: 50px;
	    margin-bottom: 10px;
	}
	.btn-floating {
    display: inline-block;
    color: #fff;
    position: relative;
    overflow: hidden;
    z-index: 1;
    width: 37px;
    height: 37px;
    line-height: 37px;
    padding: 0;
    background-color: #26a69a;
    border-radius: 50%;
    transition: .3s;
    cursor: pointer;
    vertical-align: middle;
}	
  </style>

</head>
<body class="en v4">

<div class="page_wrap">

<header class="normal smaller">
  <div class="content">
    <div class="sub_media">

      <div class="left">
        <ul class="primary">
          
            <li></li>
            <li class="logo">
              <img width="45" height="40" src="https://www.themoviedb.org/assets/e992aa61ffde502e534e0f4fb8e78b68/images/v4/logos/46x41.png" srcset="https://www.themoviedb.org/assets/e992aa61ffde502e534e0f4fb8e78b68/images/v4/logos/46x41.png 1x, https://www.themoviedb.org/assets/41bdcf10bbf6f84c0fc73f27b2180b95/images/v4/logos/91x81.png 2x, https://www.themoviedb.org/assets/8ce4f6ee3ea26190a7f21d1f9e7e9be2/images/v4/logos/182x162.png 3x">
            </li>
            <li></li>
          
        </ul>
      </div>

    </div>
  </div>
  
</header>

<main id="main">

  <div class="media">
    <h2><span class="title">Movie Log</span></h2>

	<div class="results">
    <c:forEach var="a" items="${movieList.movies}">
    	<c:set var="m_id" value="${a.code}" />
    	<c:set var="m_poster" value="${a.backdrop_path}" />
    	<c:set var="m_title" value="${a.title}" />
    	
	  <div class="item backdrop card ${a.code}">
	  
	  	<div class="image_content">
	      <img class=" backdrop lazyload" data-sizes="auto" data-srcset="https://image.tmdb.org/t/p/w960_and_h540_bestv2${a.backdrop_path}" alt="${a.title}">
	    </div>
	    
	    <div class="content">
	      <p style="width:100%;">
	        <a id="${a.code}" class="title result" href="/movie/${a.code}" title="${a.title}" alt="${a.original_title}">${a.title}</a>
	      	<img src="resources/images/X_2.png" value="${a.code}" name="deleteCookie" style="width: 5%; height: auto; left: 93%; position: absolute;">
	      </p>
	      <p class="meta">
	        <span class="genres">
				<c:forEach var="b" items="${a.genres}">
					${b.name} 
				</c:forEach>
			</span>
	      </p>
	    </div>
	  </div>
	</c:forEach>
  	<div><a id="deleteAll">전체 삭제</a></div>
	</div>
  </div>

<div class="fixed-action-btn horizontal click-to-toggle">
  <a class="btn-floating btn-large N/A transparent">
    <img src="https://cdn4.iconfinder.com/data/icons/flat-circle-content/800/circle-content-share-social-128.png" style="width: 3.9rem;">
  </a>
  <ul>
    <li>
       <a class="btn-floating N/A transparent" id="send-to-btn" href="#" onclick="send_kakao();">
          <img src="//mud-kage.kakao.com/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg" style="width: 3.6rem; padding-right:13px;">
       </a>
    </li>
    <li>
       <a class="btn-floating N/A transparent" onclick="send_twitter();">
          <img src="https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-twitter-circle-128.png" style="width: 3.3rem; padding-right:10px;">
       </a>
    </li>
    <li>
       <a class="btn-floating N/A transparent" onclick="send_facebook('https://www.google.com');">
          <img src="https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-128.png" style="width: 3.7rem; padding-right:10px;">
       </a>
    </li>
  </ul>
</div>

<script type='text/javascript'>
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('0db815a9ddd371c9b00c21ff1765e2cb');
// 카카오 로그인 버튼을 생성합니다.
function send_kakao(){
    Kakao.Auth.login({
        //// 메모챗을 발송하기 위해서는 로그인할때 추가적인 scope 을 얻어야 한다.
        scope: "PROFILE,TALK_MESSAGE",
        success: function(res) {
            Kakao.API.request({
                url: '/v1/api/talk/memo/send',
                data: {
                   template_id: '1955',
                    args: '{"\${movie_name}": "${m_title }", "\${movie_image}": "https://image.tmdb.org/t/p/w500${m_poster}", "\${movie_id}": "${m_id }"}'
                },
                success: function(res) {
                   Materialize.toast('전송 성공!', 3000);
                    console.log(res);
                },
                fail: function(error) {
                   Materialize.toast('Error!! 관리자에게 문의하세요.', 3000);
                   alert('Error! \n' + JSON.stringify(error));
                    console.log(error);
                }
            })
        },
        fail: function(error) {
            console.log(error);
        }
    });
}
//]]>

function send_facebook(url){
   /* Materialize.toast('facebook\n서비스 준비 중입니다.', 3000); */
   window.open('http://www.facebook.com/sharer/sharer.php?u=' + url);
   Materialize.toast('전송 성공!', 3000);
   /* console.log(encodeURIComponent(url + "/") + "&amp"); */
}

function send_twitter(){
   Materialize.toast('twitter\n서비스 준비 중입니다.', 3000);
}
</script>

</main> <!-- opened in header -->
</div> <!-- page_wrap opened in html_head -->

<script>
  function appendStyle(styles) { //show date, vote
    var css = document.createElement('style');
    css.type = 'text/css';

    if (css.styleSheet) {
      css.styleSheet.cssText = styles;
    } else {
      css.appendChild(document.createTextNode(styles));
    }

    document.getElementsByTagName("head")[0].appendChild(css);
  }
  var styles = ''
</script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script type="text/javascript" src="resources/js/jscookie.js"></script>
	<script type="text/javascript" src="resources/js/cookiePage.js"></script>

	<script type="text/javascript">
		$("img[name='deleteCookie']").click(function() {
			//alert("정말로 삭제하시겠습니까?");
			var code = $(this).attr("value");
			removeMovieFromCookie(code);
			console.log("delete success");
			$(".item.backdrop.card." + code).css("display", "none");
		});
		/* 
		if(screen.width > 500 || screen.width < 500) {
			screen.width = 500;
		}
		if(screen.height > 600 || screen.height < 600) {
			screen.height = 600;
		} */
		$("#deleteAll").click(function() {
			deleteCookie();
			window.close();
		});
	</script>
  </body>
</html>