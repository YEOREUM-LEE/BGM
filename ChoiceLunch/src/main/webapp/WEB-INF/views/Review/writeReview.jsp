<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>현재 미사용 페이지 입니다.</title>
<script type="text/javascript">
function goback(){
	var back=document.getElementById('goback');
	back.submit();
}
</script>
</head>
<body>
<form action="writeReview" method="post" enctype="multipart/form-data">
<table border="1">
<tr>
<th>등록자</th>
<td><input type="text" readonly="readonly" value="${loginid}" name="userid"></td>
</tr>
<tr>
<th>메뉴이름</th>
<td><input type="text" readonly="readonly" value="${menu_name}"></td>
</tr>
<tr>
<th>당신의 평가!</th>
<td><textarea rows="10" cols="50" name="text"></textarea></td>
</tr>
<tr>
<th>사진</th>
<td><input type="file" name="uplaod_image"></td>
</tr>

<tr>
<th>추천여부!</th>
<td><input type="radio" class="reornon" name="reornon" value=1> 추천! 
    <input type="radio" class="reornon" name="reornon" value=0> 비추! </td>
</tr>
</table>
<input type="submit" value="제출하기">
<input type="hidden" name="menu_id" value="${menu_id}">
</form>

<input type="button" onclick="goback()" value="메인으로">
<form action="goMain" id="goback">
	</form>

</body>
</html>
<!-- 
추후 리플을 사진을 포함한 후기식으로 작성하는 방식으로 다시 복구할 경우 사용 or 활용할 페이지
 -->