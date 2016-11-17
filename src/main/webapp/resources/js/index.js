
$(document).ready(function() {
	/*index.jsp : search page*/
	/*boxoffice carousel*/
	$('.single-item').slick({
		arrows: false,
		dots: true
	});
	
	/*search - anything*/
	$(".button-collapse").sideNav();
	$("#search_clear").click(function(){
		document.getElementById("search").value="";
		$("#search").focus();
	});
	
//	$("#search_keyword").click(function(){
//		var keyword = $("#search").val();
//		if(keyword != ""){
//			$('#form-action').submit();
//		}
//	});
	$("#search_keyword").click(function(){
	      var keyword = $("#search").val();
	      if(keyword != ""){
	          $('#slideshow').attr("src", "../movieList?keyword=" + keyword + "&pageNum=1");
	      }
	   });

    
    /*FullPage */    
	$('#fullpage').fullpage({
		anchors: ['section_main','section_search', 'section_Top100', 'section_Genre', 'section_QnA'],
		menu:'#mainmenu_container',
		autoScrolling:true,
		scrollOverflow: true
	}
	);
    
	/*Main Film*/	
    $('.autoplay').slick({
	  slidesToShow: 4,
	  slidesToScroll: -1, /* RTL:1, LTR:-1 */
	  autoplay: true,
	  autoplaySpeed: 1000
	});
    	
    
	/* Detail Menu show
	 * detail 메뉴 클릭 시 해당 영역 보여주기*/    
    $('#detail_table tr td, #detail_table tr th').click(function (){
    	var detailmenu = String($(this).text());
    	switch (detailmenu) {
	    	case "INFO":
				$('#INFO').show();
				$('#Actor').hide();
				$('#Photo').hide();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","white");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Actor":
				$('#INFO').hide();
				$('#Actor').show();
				$('#Photo').hide();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","white");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Photo":
				$('#INFO').hide();
				$('#Actor').hide();
				$('#Photo').show();
				$('#Trailer').hide();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","white");
				$('#detailmenu_Trailer').css("color","black");
				break;
			case "Trailer":
				$('#INFO').hide();
				$('#Actor').hide();
				$('#Photo').hide();
				$('#Trailer').show();
				$('#detailmenu_INFO').css("color","black");
				$('#detailmenu_Actor').css("color","black");
				$('#detailmenu_Photo').css("color","black");
				$('#detailmenu_Trailer').css("color","white");
				break;
			default:
				$('#detailmenu_INFO').css("color","white");
		}
    });
    
    /*Genre in ready*********************************************************/
    $('#pageA tr td, #pageB tr td').click(function() { //add1
        //alert($(this).text()); //ok
        var genre = String($(this).text());
        
        var url = "";
        switch(genre){
           case 'Action': url = '../movieList_genre?genre=28'; break;
           case 'Comedy': url = '../movieList_genre?genre=35'; break;
           case 'Drama': url = '../movieList_genre?genre=18'; break;
           case 'Fantasy': url = '../movieList_genre?genre=14'; break;
           case 'Horror': url = '../movieList_genre?genre=27'; break;
           case 'SF': url = '../movieList_genre?genre=878'; break;
           case 'Animation': url = '../movieList_genre?genre=16'; break;
           case 'Romance': url = '../movieList_genre?genre=10749'; break;
           case 'Thriller': url = '../movieList_genre?genre=53'; break;
           case 'Documentary': url = '../movieList_genre?genre=99'; break;
        }
        
        //alert($(this).parent().parent().attr('id'));
        var id = String($(this).parent().parent().attr('id'));
        if(id === "pageA"){
            $('#pageB tr td').css("background-color", "grey");
            $('#pageB tr .' + genre).css("background-color", "rgb(100, 100, 110)");
            
            $("#ifB").attr("src", url);
            location.href = '#section_Genre/1';
        }else {
            $('#pageA tr td').css("background-color", "grey");
            $('#pageA tr .' + genre).css("background-color", "rgb(100, 100, 110)");
            
            $("#ifA").attr("src", url);
            location.href = '#section_Genre/0';
        }
     });
     //set movie_genre table height 100%
     $('.fp-tableCell').css('height', '100%');
     //set movieList values
     //readCookie();
     
     /*QnA(Modal) in ready*********************************************************/
     /* slick , modal 충돌*/
     $('.modal').modal({
         dismissible: true, // Modal can be dismissed by clicking outside of the modal
         opacity: .5, // Opacity of modal background
       }
     );
     qnapage_load("list");
});

/*searchList*************************************************************************************************************************************/
/*Paging*/
function page_move(pageNum, keyword){
	var state = $('#main_searchlist').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
	var html= '';
	var show = $('#slideshow');
    if(state == 'none'){ // state가 none 상태일경우 
//        $('#main_searchlist').empty(); 
        $('#main_searchlist').show(); 
    }
    
    $.ajax({
    	type:"POST",
    	url:"../movieList",
    	data:"keyword="+keyword+"&pageNum="+pageNum,
    	dataType:"text", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
    	success : function(data) {
    		show.html("");
    		html += data;
    		show.html(html);
    	},
    	beforeSend:function(){
//          (이미지 보여주기 처리)
          $('.wrap-loading').removeClass('display-none');
    	},
    	complete:function(){
//          (이미지 감추기 처리)
          $('.wrap-loading').addClass('display-none');
    	},
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>검색 결과가 없습니다. 이전 페이지로 돌아갑니다.</span>');
    		Materialize.toast($toastContent, 3000);
    		history.back();
    	}
    });
    
    $("#sectionsearch").animate( { scrollTop : 0 }, 400 );
    
	location.href="/controller/resources/index.jsp#section_search/slide2";

};

/* searchlist Ajax  
 * 검색 할 때 searchlist로 갈 떄의 ajax처리*/
function mainsearch_silder(){
	var search = $('#search').val();
	var state = $('#main_searchlist').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
	var html= '';
	var show = $('#slideshow');
    if(state == 'none'){ // state가 none 상태일경우 
        $('#main_searchlist').show();
    }
    $.ajax({
    	type:"POST",
    	url:"../movieList",
    	data:"keyword="+search,
    	dataType:"text", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
    	success : function(data) {
    		if(data == ""){
    			var $toastContent = $('<span>검색 결과가 없습니다.</span>');
        		Materialize.toast($toastContent, 3000);
        		location.href="/controller/resources/index.jsp#section_search/slide1";
    		}
    		html += data;
    		show.html(html);
    	},
        beforeSend:function(){
//            (이미지 보여주기 처리)
            $('.wrap-loading').removeClass('display-none');
        },
        complete:function(){
//            (이미지 감추기 처리)
            $('.wrap-loading').addClass('display-none');
     
        },
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>검색 결과가 없습니다.</span>');
    		Materialize.toast($toastContent, 3000);
    		history.back();
    	}
    });
    location.href="/controller/resources/index.jsp#section_search/slide2";
}

/* movieDetail Ajax
 * 검색 후에 영화 제목을 클릭한 후 무비디테일로 갈 떄의 ajax처리*/
function movieDetail(id){
	$('#detailmenu_INFO').css("color","white");
	$('#detailmenu_Actor').css("color","black");
	$('#detailmenu_Photo').css("color","black");
	$('#detailmenu_Trailer').css("color","black");
	var state = $('#main_searchdetail').css('display'); 
	var html= '';
	var show = $('#slidedetailshow');
	if(state == 'none'){ // state가 none 상태일경우
        $('#main_searchdetail').show(); 
    }
	$.ajax({
    	type:"POST",
    	url:"../detail",
    	data:"id="+id,
    	dataType:"text", 
    	success : function(data) {
    		$('.wrap-loading').addClass('display-none');
    		html += data;
    		show.html(html);
    	},
    	beforeSend:function(){
//          (이미지 보여주기 처리)
          $('.wrap-loading').removeClass('display-none');
    	},
    	complete:function(){
//          (이미지 감추기 처리)
          $('.wrap-loading').addClass('display-none');
   
    	},
    	error : function(xhr, status, error) {
    		var $toastContent = $('<span>상세 결과가 없습니다. 이전 페이지로 돌아갑니다.</span>');
    		Materialize.toast($toastContent, 5000);
    		history.back();
    	}
    });
    location.href="/controller/resources/index.jsp#section_search/slide3";

}

/*Detail Photo Increasing
 * 디테일 포토 확대*/
function doImgPop(img){ 
	 img1= new Image(); 
	 img1.src=(img); 
	 imgControll(img); 
	} 
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}	
function viewImage(img){ 
 W=1024; 
 H=680; 
 O="width="+W+",height="+H+",scrollbars=yes"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer; width: 1024px; height: 680px;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}

/*Cookkie Record*/
//cookies************************************************************************************************************************************
//////////////////////////////////////////////////////////////////////////////////////////add2
function createCookie(id){
 var movieList = Cookies.getJSON("movieList");
 console.log(typeof movieList);
 
 if(typeof movieList == "undefined"){
    movieList = {"movies" : [id]};
 }else {
    
    b = false;
    for(i = 0; i < movieList["movies"].length; i++){
       if(id === movieList["movies"][i]){
          b = true;
       }
    }
    if(b === false){
       movieList["movies"].push(id);
    }else {
       //alert("이미 선택된 영화입니다.");
    }
    console.log(movieList["movies"]/* + " " + movieList["movies"].length*/);
 }
 //readCookie();
 Cookies.set('movieList', movieList, {expires : 365}); //365일 동안 남아있음
}

function readCookie(){
 var movieList = Cookies.get("movieList", {path:'/'});
 console.log(movieList);
 $("#cookieList").val(movieList);
 alert($("#cookieList").val());
}

function removeMovieFromCookie(id){ //특정 영화를 쿠키에서 제거
 var movieList = Cookies.getJSON("movieList");
 
 if(typeof movieList == "undefined"){
    return
 }else {
    b = false;
    for(i = 0; i < movieList["movies"].length; i++){
       if(id === movieList["movies"][i]){
          delete movieList["movies"][i];
          movieList["movies"].splice(i, 1);
           i--;
       }
    }
    console.log(movieList["movies"]/* + " " + movieList["movies"].length*/);
 }
 
 Cookies.set('movieList', movieList);
}

function deleteCookie() {
 Cookies.remove('movieList', {path:'/'});
 console.log("cookie deleted");
}

function open_log() { //11-15 12 37
 if(Cookies.get("movieList", {path:'/'}) === undefined || Cookies.get("movieList", {path:'/'}).length < 14) {
    alert("선택된 영화가 없습니다.");
 }else {
    var url = "../cookies?movieList=" + Cookies.get("movieList", {path:'/'})
    window.open(url, '_blank', 'scrollbars=no,menubar=no,height=600,width=500,resizable=no,toolbar=no,status=no');   
 }
}
//for cookie 11 15 02 26
function page_move_genre(s_page, s_genre){
   var f = document.frm_page;
   f.genre.value = s_genre; 
   f.pageNum.value = s_page; 
   f.submit();
};
/////////////////////////////////////////////////////////////////////////////////////////////////

//Top100************************************************************************************************************************************
//r_msg msg
function r_msgSubmit(){
	var inp = input_text.value.length;
	var area = textarea1.value.length;
	var moviename = r_movie_name2.value;
	if(moviename == ''){
		Materialize.toast('영화를 선택해주세요!', 3000, 'rounded');
		return false;
	}
	
	if(inp == 0 || inp > 5){
		Materialize.toast('내용을 제대로 작성해주세요!', 3000, 'rounded');
		input_text.value = "";
		input_text.focus();
		return false;
	}else if(area == 0 || area > 90){
		Materialize.toast('내용을 제대로 작성해주세요!', 3000, 'rounded');
		textarea1.value = "";
		textarea1.focus();
		return false;
	}
	return true;
	
}



//QnA************************************************************************************************************************************
function qnapage_load(url_type){
	//===============boardList
	if(url_type == "list"){
		$(".qna_load").load("/controller/boardList");
	}
	//===============boardSearch
	else if(url_type == "search"){
		var stype = $("select[name=stype]").val();
		var sword = $("input:text[name=sword]").val();
		$.ajax({
			type : "GET",
			url : "/controller/boardSearch",
			data : {'stype' : stype, 'sword' : sword},
			dataType:"text",
			success:function(result) {
				$(".qna_load").html(result);
			}
		});
	}
	//===============boardDetail
	else if(url_type == "detail"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_pass = $("input[name=b_pass]").val();
		$.ajax({
			type : "POST",
			url : "/controller/boardDetail",
			data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				/*$('#modalPass').closeModal();*/
				$('#modalPass').modal('close');
				if(result.indexOf("password_not_matched") == -1){
					$(".qna_load").html(result);
		    	 }else{
		    		 Materialize.toast("비밀번호가 틀렸습니다.", 4000);
		    	 }
			}
		});
	}
	//===============boardWrite Get
	else if(url_type == "write_get"){
		$(".qna_load").load("/controller/boardWrite");
	}	
	//===============boardWrite Post
	else if(url_type == "write_post"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_title = $("input:text[name=b_title]").val();
		var b_name = $("input:text[name=b_name]").val();
		var b_email = $("input[name=b_email]").val();	
		var b_tel = $("input[name=b_tel]").val();
		var b_content = $("textarea[name=b_content]").val();
		var b_pass = $("input:text[name=b_pass]").val();

		$.ajax({
			type : "POST",
			url : "/controller/boardWrite",
			data : JSON.stringify({'b_no' : b_no, 'b_title' : b_title, 'b_name' : b_name, 
					'b_email' : b_email, 'b_tel' : b_tel, 'b_content' : b_content, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				var strArray = result.split(':');
				$(".qna_load").load('/controller/' + strArray[1]);
			}
		});
	}
	//===============boardDelete Post
	else if(url_type == "delete"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_pass = $("input[name=b_pass]").val();
		
		$.ajax({
			type : "POST",
			url : "/controller/boardDelete",
			data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
			contentType: 'application/json',
			dataType:"text",
			success:function(result) {
				/*$('#modalPass').closeModal();*/
				$('#modalPass').modal('close');
				if(result.indexOf(":") == -1){
					if(result.indexOf("board/checkFalse") == -1){
						$(".qna_load").load(result);
			    	 }else{
			    		 Materialize.toast("비밀번호가 틀렸습니다.", 4000);
			    	 }						
				}else{
					var strArray = result.split(':');
					$(".qna_load").load('/controller/' + strArray[1]);
				}
			}
		});
	}	
	//===============boardUpdate GET
	else if(url_type == "update_get"){
		   var b_no = $("input:hidden[name=b_no]").val();
		   var b_pass = $("input[name=b_pass]").val();
		   $.ajax({
		     type : "POST",
		     url : "/controller/boardUpdate_get",
		     data : JSON.stringify({'b_no' : b_no, 'b_pass' : b_pass}),
		     dataType:"text",
		     contentType : "application/json; charset=UTF-8",
		     success:function(result) {
		    	 if(result.indexOf("password_not_matched") == -1){
		    		 $(".qna_load").html(result);
		    	 }else{
		    		 Materialize.toast("비밀번호가 틀렸습니다.", 4000);
		    	 }
		     }
		   });
		}  
	//===============boardUpdate POST
	else if(url_type == "update_post"){
		var b_no = $("input:hidden[name=b_no]").val();
		var b_title = $("input:text[name=b_title]").val();
		var b_name = $("input:text[name=b_name]").val();
		var b_email = $("input[name=b_email]").val();	
		var b_tel = $("input[name=b_tel]").val();
		var b_content = $("textarea[name=b_content]").val();
		var b_pass = $("input:text[name=b_pass]").val();
		
		$.ajax({
			type : "POST",
			url : "/controller/boardUpdate_post",
			data : JSON.stringify({'b_no' : b_no, 'b_title' : b_title, 'b_name' : b_name, 
				'b_email' : b_email, 'b_tel' : b_tel, 'b_content' : b_content, 'b_pass' : b_pass}),
			dataType:"text",
			contentType : "application/json; charset=UTF-8",
			success:function(result) {
				/*$('#modalPass').closeModal();*/
				$('#modalPass').modal('close');
				if(result.indexOf(":") == -1){
					$(".qna_load").load(result);
				}else{
					var strArray = result.split(':');
					$(".qna_load").load('/controller/' + strArray[1]);
				}
			}
		});
	}	
}

function qnapage_page(page, list, stype, sword){
	$.ajax({
		type : "GET",
		url : "/controller/boardSearch",
		data : {'page' : page, 'list' : list, 'stype' : stype, 'sword' : sword},
		dataType:"text",
		success:function(result) {
			$(".qna_load").html(result);
		}
	});
}

function qnapage_list(page, list){
	$.ajax({
		type : "GET",
		url : "/controller/boardList",
		data : {'page' : page, 'list' : list},
		dataType:"text",
		success:function(result) {
			$(".qna_load").html(result);
		}
	});
}

function closePwd() {
	/*$('#modalPass').closeModal();*/
	$('#modalPass').modal('close');
	$('#b_pass').val("");
/*	$('#fullpage').fullpage.silentMoveTo('section_QnA', 1); */
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
}

function closeOk() {
	$('#modalOk').modal('close');
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();
	$('#fullpage').fullpage.moveSectionDown();	
}
