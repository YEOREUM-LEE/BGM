<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>결정장애가 있는 당신을 위한 기능</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
	var start;

	function startRoulette() {
		$.ajax({
			method : 'get',
			url : 'getRandomList',
			dataType : 'json',
			success : function(resp) {
				mixing(resp);
			}

		})
	}

	function startSelectRoulette() {
		var mcategory = document.getElementById('mcategory').value;
		var price = document.getElementById('price').value;
		var report = "mcategory=" + mcategory + "&price=" + price;
		//alert(report);
		$.ajax({
			method : 'get',
			url : 'getRandomList',
			data : report,
			dataType : 'json',
			success : function(resp) {
				mixing(resp);
			}

		})
	}

	function mixing(mlist) {
		

		clearInterval(start);
		document.getElementById('menu_id').value='';
		document.getElementById('MN').value='';
		document.getElementById('submitbutton').type='hidden';
		var i = 0;
		if (mlist.length != 0) {
			document.getElementById('submitbutton').type = 'submit';
			start = setInterval(function() {
				document.getElementById('menu_id').value = mlist[i].menu_id;
				document.getElementById('MN').value = mlist[i].menu_name;

				i++;
				if (i == mlist.length) {
					i = 0;
				}
			}, 25);
		}

	}
</script>
</head>
<body>
	<!-- Page Content -->
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="goMain">메인으로</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="RestaurantList">식당리스트조회
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link" href="Random">랜덤
							추천!</a></li>
					<li class="nav-item"><a class="nav-link" href="recommendMenu">강추
							메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h2 class="my-4">오늘 너의 식사는?</h2>



			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="width: 1000px">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="resources/img/1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="resources/img/2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="resources/img/3.jpg"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="resources/img/4.jpg"
								alt="Fhird slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>


				<div class="row" align="center">
					<form action="detailMenu" method="get">
						<table border="1">
							<tr>
								<th>그냥 바로추천</th>
								<td><input type="button" onclick="startRoulette()"
									value="추첨ㄱㄱ"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><select id="mcategory">
										<option value="">ALL</option>
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
								<th>희망 가격대</th>
								<td><select id="price">
										<option value="">맘대로!</option>
										<option value="3000">3천원 이하</option>
										<option value="5000">5천원 이하</option>
										<option value="7000">7천원 이하</option>
										<option value="10000">만원 이하</option>

								</select></td>
							</tr>
							<tr>
								<th>조건대로 추천?</th>
								<td><input type="button" value="조건대로 ㄱㄱ"
									onclick="startSelectRoulette()"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="hidden" value="" id="menu_id"
									name="menu_id"> <input style="width: 350px" type="text"
									value="" id="MN"></td>
							</tr>
						</table>
						<input type="hidden" value="오늘의 점심 추천!" id="submitbutton">
					</form>

					<!-- /.row -->

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