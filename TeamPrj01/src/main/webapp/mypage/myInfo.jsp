<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style4.css">
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
a:link{color: black; text-decoration: none;}
a:visited{color: black; text-decoration: none;}
a:hover{color: white; text-decoration: none;}
</style>
</head>
<body>
<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_menu">
			<a href="../mypage/reservation.do"><button id="btn1-menu" class="menu_btn">예매내역</button></a>
			<a href="../mypage/myreview.do"><button id="btn2-menu" class="menu_btn">내가 쓴 리뷰</button></a>
			<a href="../mypage/wish.do"><button id="btn3-menu" class="menu_btn">찜한 목록</button></a>
			<a href="../mypage/myinfo.do"><button id="btn4-menu" class="menu_btn" style="background:#573EF2; color:white">개인정보 수정</button></a>
		</div>
		
	<script type="text/javascript">
		$(function() {
			$('.menu_btn').mouseover(function(){
				$(this).css('background','#573EF2');
				$(this).css('color','white');			
			})
			$('.menu_btn').mouseout(function() {
				$(this).css('background','white');
				$(this).css('color', 'black');
				$('#btn4-menu').css('background','#573EF2')
				$('#btn4-menu').css('color','white')
			})			
		}) 
	</script>

	<div class="myInfo_section">
	
	<div class="myInfo_head">회원님의 개인정보를 위해 비밀번호를 재확인합니다</div>
	<form method="post" action="../mypage/myInfosubmit.do" class="loginwindow_form">
	<input type=password name=u_pw size=15 class="myInfo_password">
	<input type=submit value="다음" class="myInfo_ChangeButton">
	</form>
	</div>
	</div>
	
</body>
</html>