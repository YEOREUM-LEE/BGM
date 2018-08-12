<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>[ 레스토랑 추가 ]</title>

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

          <h1 class="my-4">식당정보를 추가해주세요.</h1>
          <div class="list-group">
            
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          
          

          <div class="row">
          <form action="addRestaurant" method="post" enctype="multipart/form-data">
<table border="1">
<tr>
<th>식당 이름</th>
<td><input id="restaurant_name" name="restaurant_name" type="text" placeholder="식당 이름"></td>
</tr>
<tr>
<th>식당 주소</th>
<td><input id="address" name="address"type="text" placeholder="식당 주소"></td>
</tr>
<tr>
<th>식당 연락처</th>
<td><input id="contact" name="contact" type="text" placeholder="식당 연락처"></td>
</tr>
<tr>
<th>카테 고리</th>
<td><select id="rcategory" name="rcategory">
<option value="한식">한식</option>
<option value="중식">중식</option>
<option value="일식">일식</option>
<option value="패스트푸드">패스트푸드</option>
<option value="양식">양식</option>
<option value="퓨전">퓨전</option>
<option value="기타">기타</option>
</select></td>
</tr>
<tr>
<th>식당 설명</th>
<td><textarea id="text" name="text" rows="10" cols="50" placeholder="간단한 소개를 해주세요."></textarea></td>
</tr>
<tr>
<th>식당 이미지</th>
<td><input type="file" name="image_upload"/></td>
</tr>
<tr>
<th>식당 지도</th>
<td><input type="file" name="mapimage_upload"/></td>
</tr>
<tr>
<th>등록자</th>
<td><input id="userid" name="userid" type="text" value="${loginid}"></td>
</tr>
<tr>
<td><input type="submit" value="작성완료"></td>
</tr>

</table>
</form>
         

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
