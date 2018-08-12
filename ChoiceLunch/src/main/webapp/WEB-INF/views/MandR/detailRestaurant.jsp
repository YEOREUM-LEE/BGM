<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>[ 식당 세부 정보 ]</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <script src="resources/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$('#re').on('click', function() {
			var userid = "userid=${loginid}";
			$.ajax({
				method : 'get',
				url : 'Rchecklastrecommendday',
				data : userid,
				dataType : 'text',
				success : function(resp) {
					if (resp=='ok') {
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
				url : 'Rchecklastrecommendday',
				data : userid,
				dataType : 'text',
				success : function(resp) {
					
					if (resp=='ok') {

						recommend('n');
					} else {
						alert('이미 오늘의 추천을 하셨습니다.');
					}
					
				}

			})

		})

	})

	function recommend(check) {
		var recom = "userid=${loginid}&restaurant_id=${r.restaurant_id}&check="+check;
		$.ajax({
			method : 'get',
			url : 'updateCommend',
			data : recom,
			dataType : 'json',    //받는 타입에서도 중요!
			success : function(resp) {
              $('#re').val(resp.rec);
              $('#nonre').val(resp.nonrec);
			},error: function(){
				console.log('ajax 실패');
			}

		})

	}
	

	
	
</script>

  </head>

  <body>

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

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">${r.restaurant_name}</h1>
          <div class="list-group">
            <a href="menuList?restaurant_id=${r.restaurant_id}" class="list-group-item">메뉴리스트 조회</a>
            <a href="addMenu?restaurant_id=${r.restaurant_id}&restaurant_name=${r.restaurant_name}" class="list-group-item">메뉴 추가</a>
           
            
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
           <td rowspan="3"><div><img style="width: 250px; height: 250px;"
			src="imagedownload?restaurant_id=${r.restaurant_id}&type=main"></div></td>
           <td>카테고리: ${r.rcategory} </td>
           </tr>
           <tr>
           <td>${r.contact}</td>
           </tr>
           <tr>
           <td>${r.address}</td>
           </tr>
           <tr>
           <td colspan="2" width="600px;">${r.text}</td>
           </tr>
           <tr>
           <td colspan="2"><h4>매장 위치안내</h4></td>
           </tr>
            <tr>
           <td colspan="2"><img style="width: 600px;"
			src="imagedownload?restaurant_id=${r.restaurant_id}&type=map"></td>
           </tr>
           </table>
           
          
          </div>
          <!-- /.row -->
           추천! <input id="re" type="button" value="${r.recommend}" style="margin-right: 15px;">  비추! <input
			id="nonre" type="button" value="${r.nonrecommend}">
        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
      </div>

    </div>
    <!-- /.container -->

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
