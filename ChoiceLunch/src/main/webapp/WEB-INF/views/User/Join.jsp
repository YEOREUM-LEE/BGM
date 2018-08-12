<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="ko">
  <head>
  <title>가입을 환영합니다.</title>
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
function check() {
	
	var userid = document.getElementById('userid').value;
	var password = document.getElementById('password').value;
	var passwordcheck = document.getElementById('passwordcheck').value;
	var age = document.getElementById('age').value;

	if (userid.trim() == 0) {
		alert('아이디를 입력하세요!!');
		return null;
	}
	if(userid.trim().length<3||userid.trim().length>10){
		alert('아이디는 3~10자 입니다.');
		return null;
	}
	
	if (password.trim() == 0) {
		alert('패스워드를 설정하세요!!');
		return null;
	}
	if (password != passwordcheck) {
		alert('패스워드를 정확히 입력해주세요!!');
		return null;
	}
	if(password.trim().length<5||password.trim().length>10){
		alert('패스워드는 5~10자입니다.');
		return null;
	}
	idcheck();
	var joinUser = document.getElementById('joinUser');
	joinUser.submit();

}

$(function() {
	$('#join').on('click',function(){
		check();
	})
	$('#idcheck').on('click',idcheck)
	$('#goMain').on('click',function(){
		location.href="goMain";
	})

})
function idcheck() {
	//
	var userid = document.getElementById('userid').value;
	var sub = "userid=" + userid;
	$.ajax({
		method : 'get',
		url : 'idCheck',
		async: false,
		data: sub,
		dataType: 'text',  //리턴값이 text면 null 리턴을 ''처리해준다.
		success: function(resp) {
			if(resp!=''){
				document.getElementById('userid').value = ''; //리턴값이 null이면 resp엔 공백 ''이 들어온다.
				alert('중복된 아이디 입니다. 다른 아이디를 사용해주세요!');
			}else{
				alert('사용해도 좋은 아이디 입니다.');
			}
		}

	})
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
                <form id="joinUser" action="joinUser" method="post" >
                    <div>
                        <input type="text" class="form-control" id="userid" name="userid" placeholder="id는 3~10자로" autofocus>
                        <button type="button" style="width: 150px;" id="idcheck" class="form-control btn btn-primary">중복 Check</button>
                        
                    </div>
                    <div>
                        <input type="password" class="form-control" id="password" name="password" placeholder="암호는 5~10자로">
                    </div>
                    <div>
                    <input type="password" class="form-control" id="passwordcheck" placeholder="암호는 5~10자로">
                    </div>
                    <div>
                    <input type="number" class="form-control" id="age" name="age" placeholder="나이를 입력하세요." >
                    </div>
                    <div>
                    <input class="gender" type="radio" name="gender" value="m"
					checked /> 남자 <input class="gender" type="radio" name="gender"
					value="f" /> 여자
                    </div>
                    <div style="margin-top: 50px">
                        <button type="button" id="join"  style="width: 250px;" class="form-control btn btn-primary">작성완료</button>
                         <button type="button"id="goMain" style="width: 250px;"  class="form-control btn btn-primary">메인으로</button>
                        
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>

</body>
  
</html>