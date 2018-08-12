<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>[ 코엑스 주변 맛집?! 리스트 입니다. ]</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

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
            <li class="nav-item active">
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

          <h1 class="my-4">Restaurant List</h1>
          <div class="list-group">
            <a href="RestaurantList" class="list-group-item">All</a>
            <a href="RestaurantList?rtype=한식" class="list-group-item">한식</a>
            <a href="RestaurantList?rtype=중식" class="list-group-item">중식</a>
            <a href="RestaurantList?rtype=일식" class="list-group-item">일식</a>
            <a href="RestaurantList?rtype=패스트푸드" class="list-group-item">패스트푸드</a>
            <a href="RestaurantList?rtype=양식" class="list-group-item">양식</a>
            <a href="RestaurantList?rtype=퓨전" class="list-group-item">퓨전</a>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="resources/img/1.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="resources/img/2.jpg"alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="resources/img/3.jpg" alt="Third slide">
              </div>
               <div class="carousel-item">
                <img class="d-block img-fluid" src="resources/img/4.jpg" alt="Fhird slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="row">
  <c:if test="${not empty rlist}">
		<c:forEach var="r" items="${rlist}" varStatus="status">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="detailRestaurant?restaurant_id=${r.restaurant_id}"><img  class="card-img-top" height="200px;" src="imagedownload?restaurant_id=${r.restaurant_id}&type=main" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="detailRestaurant?restaurant_id=${r.restaurant_id}">${r.restaurant_name}</a>
                  </h5>
                  <h5>${r.rcategory}</h5>
                  <p class="card-text"></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">추천: ${r.recommend}회                비추천: ${r.nonrecommend}회</small>
                </div>
              </div>
            </div>
            </c:forEach>
		</c:if>
<div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="addRestaurant"><img  class="card-img-top" height="200px;" src="resources/img/plus.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="addRestaurant">식당 정보 추가</a>
                  </h5>
                  <h5>당신의 추천 식당을 추가해주세요.</h5>
                  <p class="card-text"></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">등록인: ${loginid}</small>
                </div>
              </div>
            </div>
            

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

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
