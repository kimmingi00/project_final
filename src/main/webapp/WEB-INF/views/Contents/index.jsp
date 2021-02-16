<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Index/default-style.css">
	<link href="" media="screen and (min-width: 1080px) and (max-width: 1920px)" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/resources/JS/Index/index_js/jquery.HSlider.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Index/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Index/hsilder.css">
	<link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Index/popup.css">
	<link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Index/default-style.css">
	
	


	<style type="text/css" media="screen and (min-width: 1080px) and (max-width:1920px)">
	
	html, body{overflow: visible !important;}
	*{touch-action: none;}
	*{margin: 0; padding: 0;}
	li{list-style: none;}
	a{text-decoration: none;}

	.nav{width:1200px; margin: 0 auto;}
	.clearfix{content:''; display: block; clear:both;}

	header{height: 75px; background-color: #242424; border:1px solid #white;
					position:fixed; width:100%; z-index: 9999; top:0; left:0;}
	h1{color:white; line-height: 150px; float: left;}

	.logo {float:left;}
	.logo li{float:left;}
	.logo a{line-height: 75px; right:75px; color:white; padding:0 15px; display: block;}
	.login{float:right; position:fixed; top:15px; right:75px;  display: block;}

	.menu {float:right;}
	.menu li{float:left;}
	.menu a{line-height: 75px; right:75px; color:white; padding:0 15px; display: block;}

	.menubar{border:none; border:0px; margin:0px;	padding:0px;}
	.menubar ul{list-style:none; margin:0; padding:0;}
	.menubar li{float:left;	padding:0px;}
	.menubar li a{display:block; font-weight:normal; line-height:40px; margin:0px; padding:0px 25px; text-align:center; text-decoration:none;}
	.menubar li a:hover, .menubar ul li:hover a{color:#FFFFFF;text-decoration:none;}
	.menubar li ul{background: rgb(109,109,109); display:none; height:auto; padding:0px; margin:0px;	border:0px;	position:absolute; width:150px;	z-index:200;}
	/* 평상시에는 드랍메뉴가 안보이게 하기 */

	.menubar li:hover ul{display:block;} /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
	.menubar li li {background: rgb(109,109,109); display:block; float:none; margin:0px; padding:0px; width:150px;}
	.menubar li:hover li a{background:none;}
	.menubar li ul a{display:block;	height:40px; font-size:12px; font-style:normal; margin:0px; padding:0px 10px 0px 15px; text-align:left;}
	.menubar li ul a:hover, .menubar li ul li:hover a{background: rgb(71,71,71); border:0px; color:#ffffff; text-decoration:none;}
	.menubar p{clear:left;}

	#button{ position:relative; border-top-left-radius: 8px;	border-top-right-radius: 8px;	border-bottom-left-radius: 8px;	border-bottom-right-radius: 8px;	margin-right:-4px;}
	#btn_group button{border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: skyblue; padding:5px; z-index: 1; position: relative;}
  #btn_group button:hover{color:black; background-color: skyblue;}

	#button1{border-top-left-radius: 8px;	border-top-right-radius: 8px;	border-bottom-left-radius: 8px;	border-bottom-right-radius: 8px;	margin-right:-4px;}
	#btn_group1 button{border: 1px solid white; background-color: rgba(0,0,0,0); color: white; padding:5px;}
	#btn_group1 button:hover{color:black; background-color: white;}

	
</style>


</head>
<body>

	<header>
		<div class = "nav">
				<nav>
						<ul class ="logo">
							<li><font size="6"><a href="/index"> <img src="/resources/img/icon/여기관광.jpg" style="width: 112px; margin-top: 10px;"></font></a> </li>
						</ul>
					<ul class="menu">
						<li><a href="/Reservation/reserv_main?row=0&place=0&outplace=0"><font size="4">旅行商品 検索 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/Reservation/Product_upload_main"><font size="4">事業者 商品登録 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/Notice/notice?page=1"><font size="4">お知らせ </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/Q&A/board_qna?page=1"><font size="4">お問い合わせ </font>&nbsp; &nbsp; &nbsp;</a></li>
					</ul>
				</nav>
		</div>

		<div class = "login">
			<a href="###.jsp">
				<div class="menubar">
      		<li style="color:white; margin-top:11px;">
      			<c:if test="${!empty user }">${ user.name }様</c:if>
      			<c:if test="${!empty b_user }">${ b_user.b_name }様</c:if>
      		</li>
      		<li>
      			
      			<a href="#" id="current"><img src="/resources/img/index_img/login.png"></a>
      			
         		<ul>
         		<c:if test="${empty user&&empty b_user }">
           			<li><a href="/Member/login">ログイン</a></li>
		        	<li><a href="/Member/confirm">新規登録</a></li>
		        </c:if>
		        <c:if test="${!empty user||!empty b_user }">
           			<li><a href="/Member/logout">ログアウト</a></li>
		          	<li><a href="/Member/memberBM">アカウント情報</a></li>
		          	<c:if test="${user.admin==1 }">
		          		<li><a href="/Member/admin">管理者ページ</a></li>
		         	</c:if>
		         </c:if> 
         		</ul>

      		</li>
      			<c:if test="${!empty user }">
					<a href="/Message/MessageList?id=${ user.id }&user_num=1"><img src="/resources/img/index_img/message.png"></a>
				</c:if>
				<c:if test="${!empty b_user }">
					<a href="/Message/MessageList?id=${ b_user.b_id }&user_num=2"><img src="/resources/img/index_img/message.png"></a>
				</c:if>
				</div>
			</a>
		</div>
	</header>

	<div class="wrap">
		<div class="slider">
			<section>
				<article>
					<font size="6"><p>  &nbsp; 旅行の始まり</p></font>
					<br>
					<font size="5"><p>  &nbsp; すべての旅行の 始まりと 終わりは いろんな 輸送方法を 利用します。</p></font>
					<br>
					<font size="5"><p>  &nbsp; 代表的な輸送方法の一つは高速バス観光です。</p></font>
					<br>
					<font size="5"><p>  &nbsp; 皆さんに忘れられない旅行をプレゼントします。</p></font>
					<br><br>
					<div id = "btn_group">
						<a href="javascript:void(0)" class="btn">
					 &nbsp;  &nbsp; <button id = "button" ><font size="4"> &nbsp;
						 その他を表示 >
					 &nbsp; </font></button></label> &nbsp; &nbsp; &nbsp; &nbsp;
						 </a>
				 </div>

				 <div class="modal">
					 <p class="modal_content">
						 <a href="javascript:void(0)" class="btn_close">
						 <B><FONT size=5><br>  &nbsp; &nbsp; X</FONT></B>
					 	</a>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 만약 모두가 많은 것을 만들기에만 바쁘다면 <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 완벽하게 할 수 있을까요? <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 헷갈리기 시작합니다. <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 여행을 추억으로, 인연을 애뜻함으로  <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 무언가를 만들 때 필요한건 <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 집중 <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 우리가 첫번째로 묻는 건<br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 여행방식의 변화가 사람들에게 가져다 줄 느낌<br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 기쁨, 경험, 회상, 추억<br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 그리고 난 후 의도에 맞게 시작합니다. <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 시간이 좀 걸리지요. <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 수천 번의 NO끝에 얻는 단 하나의 YES <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 심플하게, 완벽하게 다시 시작하기도 합니다.<br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 우리의 손길이 닿은 모든 것이 사람들의 삶에 닿을 수 있을 때까지 <br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 그때 비로소 우리는 이름을 씁니다. <br></font></B>
							<B> <font size="5"><br> &nbsp; &nbsp; &nbsp; -여기관광-<br></font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 팀장 = 김민기 <br></font></B>
							<B> <font size="4"><br>&nbsp; &nbsp;  &nbsp; &nbsp;  팀원 = 장재희 이하균 안준혁 이예리 </font></B>
					 </p>
				 </div>

					</article>
				<img src="/resources/img/index_img/1.jpg" >
			</section>



			<section>
				<article class="left">
					<center>
					<div id = "btn_group">
						<a href="/ReservServlet?command=reserv_main&row=0&place=0&outplace=0"><button id = "button"><font size="4">&nbsp;  旅行商品 検索 >  &nbsp; </font></button></a>
					</div>
						<br><br><br><br><br><br>
					<font size="6"><p> 世界で一番輝く旅行の第一歩 </p></font>
					<br>
					<font size="5"><p> 今すぐいろんな観光商品が見られます。 </p></font>
					<br>
					<font size="5"><p> 手軽に予約してください。</p></font>
					<br>
					<font size="5"><p> アカウントがなくてもサービス利用ができます。</p></font>
					</center>
				</article>
				<img src="/resources/img/index_img/2.jpg" >
			</section>


			<section>
				<article class="right">
					<center>
						<br><br><br><br>
					<font size="6"><p> 輸送社業の 新しさ</p></font>
					<br>
					<font size="5"><p> 社業者の収益創出のためのサービスが用意されています。</p></font>
					<br>
					<font size="5"><p> 皆様の輝くサービスをここで見せてください。</p></font>
					<br>
					<font size="5"><p> 大切な観光商品はお客様がすぐ確認できます。</p></font>
					<br><br><br>
					<div id = "btn_group1">
						<a href="/ReservServlet?command=upload_main"><button id = "button1" ><font size="4">&nbsp; 観光商品 登録 >  &nbsp; </font></button></a>
					</div>
					</center>
				</article>
				<img src="/resources/img/index_img/3.jpg" >
			</section>


		</div>
	</div>
<script src="js/jquery-1.11.0.min.js"></script>
	<script>
	$(document).ready(function() {
  $(".btn").click(function() {
    $(".modal").fadeIn();
  });
  $(".btn_close").click(function() {
    $(".modal").fadeOut();
  });
});
	</script>

	<script type="text/javascript">
		$(".slider").HSlider({
			easing: 'ease',
			animationTime: '400',
			pagination: true
		});
	</script>
	
</body>
</html>
