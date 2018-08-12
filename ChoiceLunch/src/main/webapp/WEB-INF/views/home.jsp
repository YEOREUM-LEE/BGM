<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="ko">
  <head>
  <title>What Do You Want to Eat</title>
    <meta charset="utf-8">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #loginform > div {
        margin: 30px 0;
    }

</style>
<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	
	$('#join').on('click',function(){
		location.href='join';
		
	})
	
	
	
	$('#login').on('click', function() {
		var userid = $('#userid').val();
		var password = $('#password').val();
		var user = {
			'userid' : userid,
			'password' : password
		}
		
		$.ajax({
			method : 'post',
			url : 'AjaxLogin',
			data : JSON.stringify(user),
			dataType : 'json',    //리턴값이 단일 String 이라면 text 타입으로 해야한다.
			contentType : 'application/json; charset=utf-8',
			success : login,
			error : function(resp, code, error){
				//alert(resp+", "+code+", "+error)
				var message='<b style="color:red">아이디 또는 패스워드를 확인해주세요.</b>';
				$('#message').html(message);
			}

		})

	})

})
   function login(){
	   var form=document.getElementById('loginform');
	   form.submit();
	}
	
	
	
</script>
  </head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
     
                <div class="panel-title">What Do You Want to Eat??</div>
            </div>
            <div class="panel-body">
                <form action="login" method="post" id="loginform" >
                    <div>
                        <input type="text" class="form-control" id="userid" name="userid" placeholder="ID" autofocus>
                        <div id="message"></div>
                    </div>
                    <div>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <div>
                        <button type="button" id="login"  style="width: 250px;" class="form-control btn btn-primary">로그인</button>
                         <button type="button"id="join" style="width: 250px;"  class="form-control btn btn-primary">회원가입</button>
                        
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>

</body>
  
</html>