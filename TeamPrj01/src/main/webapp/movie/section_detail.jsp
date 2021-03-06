<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.updbtn{
	text-decoration:none;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15pt;
	font-weight: 420;
	position:absolute;
	bottom:25px;
	right:150px;
	background-color: rgba(0,0,0,0);
	border:none;
	color: #573EF2;
}
.updbtn:hover{
	text-decoration:none;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15pt;
	font-weight: 600;
	position:absolute;
	bottom:25px;
	right:150px;
	background-color: rgba(0,0,0,0);
	border:none;
	color: #573EF2;
}
.delbtn{
	text-decoration:none;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 420;
	font-size: 15pt;
	position:absolute;
	bottom:25px;
	right:37px;
	background-color: rgba(0,0,0,0);
	border:none;
	color: #573EF2;
}
.delbtn:hover{
	text-decoration:none;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	font-size: 15pt;
	position:absolute;
	bottom:25px;
	right:37px;
	background-color: rgba(0,0,0,0);
	border:none;
	color: #573EF2;
}
.pageRemote{
	position:absolute;
	left:470px;
	bottom:30px;
	text-align:center;
	width:450px;
	height:100px;
}
.prev-btn{
	position:absolute;
	left:30px;
}
.next-btn{
	position:absolute;
	right:30px;
}

.pager{
	position:absolute;
	margin:0px auto;
	top:6px;
	left:85px;
}
.reviews {
	z-index: 5;
	position: absolute;
	width: 1386px;
	height: 1700px;
	left: 267px;
	top: 2030px;
	background: #FFFFFF;
	box-shadow: 0px 0px 100px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}
.like{
border:none;
position:absolute;
bottom:27.4px;
}
.likeCount{
position:absolute;
left:110px;
}
.review123{
	text-decoration:none;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20pt;
	margin-top: 20px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 let i=0;
$(function(){
	$('#updbtn').click(function(){
		if(i==0){
			$('#update').show();
			$('#r_score').hide();
			$('#crossline3').hide();
			$('#updbtn').hide();
			$('#delbtn').hide();
			let comend = $('#content').text();
			$('#r_comend2').text(comend);
		}
	})
	
	$('#like').click(function(){
		location.reload();
	})
})

$(document).ready(function(){
		$('#reviewWrite').click(function(){
			var offset = $('#reviewInsert').offset(); //????????? ????????? ????????? ??????

        //animate()???????????? ???????????? ????????? ????????? ????????? ????????? ???????????? 0.4??? ?????? ???????????? ?????? ????????? ????????? 

	    $('html').animate({scrollTop : offset.top}, 200);

	});
});


</script>
</head>
<body>
	<c:set var="vo" value="${vo }"/>
	<img class="poster_detail" alt="" src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?'))}">
	<div class="backDetail">
	</div>
	<div class="graybox"></div>
 	<div class="posterDisc">
		<p class="titleDisc">${vo.getM_title() }</p>
		<p class="subDisc">${vo.getM_rdate() } | ${vo.getM_genre() }</p>
		<p class="subDisc">?????? ${vo.getM_cnt() } ??????</p>
	</div>
	
	<span class="detailDisc">
		<h3>?????? ??????</h3>
		<div class="dDfirst">
			<p>${vo.getM_title() }</p>
			<p>${vo.getM_rdate() }    |    ${vo.getM_genre() }</p>
			<p>${vo.getM_time() }    |    ????????? ${vo.getM_rate() }%</p>
		</div>
		<div class="dDsecond">
			<p>${vo.getM_content() }</p>
		</div>
		<div class="dDthird">
			<p>?????? : ${vo.getM_director() }</p>
			<p>?????? : ${vo.getM_cast() }</p>
		</div>
		<div class="crossline1"></div>
	</span> 
	<span class="buttons">
		<img alt="" src="../image/??????.png">
		 <c:if test="${sessionScope.u_id!=null }">
		 <button id="reviewWrite" class="reviewWrite" href="#">
            ?????? ????????????
         </button>
		  <c:if test="${count==0 }">
        	 <a href="../jjim/jjim_insert.do?no=${vo.m_no }"><button class="JJim">?????????</button></a>
         </c:if>
         <c:if test="${count!=0 }">
        	<a href="../jjim/jjim_delete.do?no=${vo.m_no }&wno=${wno}"><button class="JJim">?????????</button></a>
         </c:if>
         <a href="../reservation/movie_reservation.do?no=${vo.m_no }">
			 <button class="reserve">
	            ????????????
	         </button>
         </a>
         </c:if>
	</span>
	<div class="medias">
		<h3 class="gallery">?????????</h3>
		<div class="G_makeOverflow">
			<c:forTokens var="photo" items="${vo.getM_photo() }" delims="|">
				<a href="${photo }"><img class="photos" src="${photo }" ></a>
			</c:forTokens>
		</div>
		<h3 class="video">?????????</h3>
		<div class="V_position">
		<a href="${vo.getM_preview() }">
			<video autoplay controls loop style="height: 200px;width:300px;">
                  <img src="${vo.getM_preview() }">
            </video>
        </a>
		</div>
	</div>
	<div class="reviews">
	<c:set var="msg" value="${msg }"/>
	<h3>??????${msg }</h3>
	<div id="reviewInsert" class="reviewInsert">
	<c:if test="${sessionScope.u_id!=null }">
	<form method="post" action="../movie/insertReview.do" enctype="multi">
		<select name="r_score">
			<option>????????? ????????? ??????????????????!  </option>
			<option value="1.0">??????</option>
			<option value="2.0">?????????</option>
			<option value="3.0">????????????</option>
			<option value="4.0">???????????????</option>
			<option value="5.0">??????????????????</option>		
		</select>
		<div class="com_area">
		<textarea id="r_comend" rows="5" cols="100" name="r_comend"></textarea>
		</div>
		<input type="hidden" name="no" value="${vo.getM_no() }">
		<button class="submitbtn" type="submit"onclick="javascript:history.go(0)">????????????</button>
	</form>
	</c:if>
		<div class="crossline4"></div>
	<c:if test="${sessionScope.u_id==null }">
		<p class="review123">&nbsp;&nbsp;??????????????? ??????????????? ??????????????????</p>
	</c:if>
	</div>
	<div class="reviewContainer">
	<c:forEach var="list" items="${list }" varStatus="s">
	<c:if test="${s.index<=3 }">
		<div class="reviewRead">
	 	<p class="r_user">${list.getU_id() }</p>
	 	<p id="r_score"class="r_score">??? ${list.getR_score() }</p>
	 	<div class="crossline2"></div>
	 	<div class="r_comend">
	 		<p id="content">${list.getR_comend()}</p>
	 	</div>
	 	<div id="crossline3" class="crossline3"></div>
 	 	
	 	<c:if test="${sessionScope.u_id!=null }">
			<a href="../movie/like_select.do?rno=${list.r_no }&mno=${vo.m_no }"><button class="like">?????????</button></a>
			<span class="likeCount">${list.r_gno }???</span>
		</c:if>
		
	 	<c:if test="${sessionScope.u_id==list.getU_id() }">
 	 	<a id="updbtn" class="updbtn">????????????</a>
 	 	<a id="delbtn" class="delbtn" href="../movie/deleteReivew.do?no=${vo.m_no }&r_no=${list.getR_no()}">????????????</a>
 	 	</c:if>
	 
	 <!-- ???????????? ????????? ????????? ??????????????? -->
	 	<div style="display:none" id="update" class="reviewReInsert">
	<form method="post" action="../movie/updateReview.do" enctype="multi">
		<select name="r_score">
			<option>????????? ????????? ??????????????????!  </option>
			<option value="1.0">??????</option>
			<option value="2.0">?????????</option>
			<option value="3.0">????????????</option>
			<option value="4.0">???????????????</option>
			<option value="5.0">??????????????????</option>		
		</select>
		<div class="com_area">
		<textarea id="r_comend2" rows="5" cols="100" name="r_comend"></textarea>
		</div>
		<div class="crossline4"></div>
		<!-- <input type="text" name="u_id" size=10 class="imsi"> -->
		<input type="hidden" name="no" value="${vo.getM_no() }">
		<input type="hidden" name="r_no" value="${list.getR_no() }">
		<button class="resubmit" type="submit" onclick="javascript:history.go(0)">????????????</button>
	</form>
	</div>
	 
	 
		</div>
	</c:if>
	</c:forEach>
	</div>
	
	
	<div class="pageRemote">
	<c:set var="page" value="${(empty param.p)?1:param.p}"/>
	<c:set var="count" value="${rcount}"/>
	<c:set var="startNum" value="${page-(page-1)%3}"/>
	<c:set var="lastNum" value="${Math.ceil(count/3)}"/>
	<c:if test="${startNum <= 1}">
	<div>
	 	<a href="">
		<img class="prev-btn" src="../image/?????????.png" onclick="alert('?????????????????? ????????????.')">
		</a>
	</div>
	</c:if>
	<c:if test="${startNum > 1}">
	<div>
		<a href="?p=${startNum-1}">
		<img class="prev-btn" src="../image/?????????.png">
		</a>
	</div>
	</c:if>

	<div class="pager">
		<ul class="-list- center">
		<c:forEach var="i" begin="0" end="4">
		<c:if test="${startNum+i <= lastNum}">
		
			<li><a href="../movie/movie_detail.do?no=${vo.getM_no() }&p=${startNum+i}">${startNum+i}</a></li>
		</c:if>
		</c:forEach>
		</ul>
	</div>
	<c:if test="${lastNum < startNum+5 }">
	<div>
		<a href="">
		<img class="next-btn" src="../image/?????????2.png" onclick="alert('?????????????????? ????????????.')">
		</a>
	</div>
	</c:if>
	<c:if test="${lastNum >= startNum+5}">
	<div>
	<a href="?p=${startNum+5}">
		<img class="next-btn" src="../image/?????????2.png">
	</a>
	</div>
	</c:if>
	</div>
	
	
</div>
</body>
</html>