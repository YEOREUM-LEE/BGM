<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${m.menu_name}</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	init();

	$('#re').on('click', function() {
		var userid = "userid=${loginid}";
		$.ajax({
			method : 'get',
			url : 'Mchecklastrecommendday',
			data : userid,
			dataType : 'text',
			success : function(resp) {
				if (resp == 'ok') {

					recommend('r');
				} else {
					
					alert('이미 오늘의 추천을 하셨습니다.');
				}
			}

		})

	})
	$('#nonre').on('click', function() {
		var userid = "userid=${loginid}";
		$.ajax({
			method : 'get',
			url : 'Mchecklastrecommendday',
			data : userid,
			dataType : 'text',
			success : function(resp) {
				if (resp == 'ok') {

					recommend('n');
				} else {
					alert('이미 오늘의 추천을 하셨습니다.');
				}
			}

		})

	})

})

function recommend(check) {
	var recom = "userid=${loginid}&menu_id=${m.menu_id}&check=" + check;
	$.ajax({
		method : 'get',
		url : 'updateCommendMenu',
		data : recom,
		dataType : 'json', //받는 타입에서도 중요!
		success : function(resp) {

			$('#re').val(resp.rec);
			$('#nonre').val(resp.nonrec);
		}

	})

}
function init() {
	$('#reply').val('');
	var menu_id='menu_id='+${m.menu_id};
	console.log(menu_id);
	$.ajax({
		method : 'get',
		data : menu_id,
		dataType: 'json',  //여기서 이걸 json이 아닌 text로하면 한 문장으로 날라오고 글자수만큼 객채가 된다 ㅡㅡ;
		url : 'getReviewList',
		success : function(resp){
			output(resp);
		}
	})
}
function output(resp) {
	var loginid = '${loginid}';

	var result = '<tr><td style="width: 150px">작성자</td><td style="width: 650px">내용</td><td style="width: 200px">등록일</td><td></td></tr>';
	for ( var i in resp) {
	
		result += '<tr>';
		result += '<td>' + resp[i].userid + '</td>';
		result += '<td>' + resp[i].text + '</td>';
		result += '<td>' + resp[i].regdate + '</td>';
		if(loginid==resp[i].userid){
			result+='<td><input class="replyDelete" data-rno="'+resp[i].reply_id+'" type="button" value="삭제"></td>';
		}
		result+='<tr>';

	}

	$('#reviewform').html(result);
	$('input:button.replyDelete').click(replyDelete);
}
function replyDelete() {
	var reply_id =$(this).attr('data-rno'); // 여기서 this는 event를 발생시킨 값을 지칭
	
	
	$.ajax({
		method : 'get',
		url : 'deleteReview',
		data : 'reply_id='+reply_id,
		success: init
		
		
	})

}
function insertreply(){
	var text=document.getElementById('reply').value;
	var submitdata="userid=${loginid}&menu_id=${m.menu_id}&text="+text;
	
	$.ajax({
		method : 'post',
		url : 'writeReview',
		data : submitdata,
		success: init
		
	})
}
</script>
</head>
<body>
 <!-- Page Content -->
 <!-- Navigation -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="goMain">메인으로</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="RestaurantList">식당리스트조회
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Random">랜덤 추천!</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="recommendMenu">강추 메뉴</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout">로그아웃</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">${m.menu_name}</h1>
             <div class="list-group">
             <c:if test="${loginid==m.userid}">
            <a href="UpdateMenu?menu_id=${m.menu_id}" class="list-group-item">메뉴정보 수정</a>
            <a href="DeleteMenu?menu_id=${m.menu_id}" class="list-group-item">메뉴 삭제</a>
           </c:if>
            
          </div>
          

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9" style="width: 1000px">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
           

          <div class="row">

           <table border="1">
           <tr>
           <td rowspan="2"><img style="width: 400px;" src="imagedownload2?menu_id=${m.menu_id}"></td>
           <td>카테고리: ${m.mcategory}</td>
           </tr>
           <tr>
           <td>가격: ${m.price}원</td>
           </tr>
           <tr>
           <td colspan="2"><a href="detailRestaurant?restaurant_id=${m.restaurant_id}">식당명: ${m.restaurant_name}</a></td>
           </tr>
           </table>
          
          
          </div>
          <!-- /.row -->
           추천! <input id="re" type="button" value="${m.recommend}" style="margin-right: 15px;">  비추! <input
			id="nonre" type="button" value="${m.nonrecommend}">
        </div>
        
         <input type="text" style="width: 600px" id="reply" placeholder="댓글작성">
		<input type="button" value="제출" onclick="insertreply()">
		<div >
	<table id="reviewform" >
	
	</table>
	</div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
  </div>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; LEE 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>