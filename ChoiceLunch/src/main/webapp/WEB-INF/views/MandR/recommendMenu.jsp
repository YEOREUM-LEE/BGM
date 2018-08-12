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

    <title>추천 메뉴 리스트</title>

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
            <li class="nav-item">
              <a class="nav-link" href="RestaurantList">식당리스트조회
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Random">랜덤 추천!</a>
            </li>
            <li class="nav-item active">
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

          <h2 class="my-4">회원분들이 강력 추천하는 메뉴 리스트 입니다.</h2>
          

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          

          <div class="row">
  <c:if test="${not empty mlist}">
		<c:forEach var="m" items="${mlist}" varStatus="status">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="detailMenu?menu_id=${m.menu_id}"><img  class="card-img-top" height="200px;" src="imagedownload2?menu_id=${m.menu_id}" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title">
                    <a href="detailMenu?menu_id=${m.menu_id}">${m.menu_name}</a>
                  </h5>
                  <h6>카테고리 : ${m.mcategory}</h6>
                  <h5>${m.price} 원</h5>
                  <p class="card-text"></p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">추천: ${m.recommend}회                비추천: ${m.nonrecommend}회</small>
                </div>
              </div>
            </div>
            </c:forEach>
		</c:if>

            

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