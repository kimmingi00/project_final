<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <link href="/resources/CSS/CSS_Reservation/product_css/menustyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/CSS/CSS_Reservation/product_css/slide.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/Index/product_js/slide.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/resources/Index/video_js/jquery.vide.js"></script>


    <style>
    body{background-color: #f2f2f2}
 <!--   div{display:none;} -->

    .block{position: fixed; z-index: 1000; }
    .video_text{position:absolute; color: #ffffff; top:150px; left:500px; font-size: 72px; z-index: 1001;}

    h3 {display: block; font-size: 1.2em; margin-block-start: 0.33em; margin-block-end: 0.33em; margin-inline-start: 0px; margin-inline-end: 0px; font-weight: bold;}

    .hoverEffect { float:left; position:relative; width: 270px; height:260px; margin:10px; overflow:hidden; }
    .hoverEffect .image { display:block; opacity:1; position:relative; transform:scale(1.2); transition:0.5s ease; }
    .hoverEffect:hover>.image { transform:scale(1); filter: blur(5px); opacity:0.3; }
    .hoverEffect .txt {color:black; font-size:20px; top:50%; left:50%; text-align:center; line-height:20px; position:absolute; top:0; left:0; height:100%; width: 100%; background:rgba(195,193,149,0); opacity:0; overflow:hidden; transform:scale(2); transition:0.3s ease; }
    .hoverEffect:hover .txt { background:rgba(255,255,255,0.8); transform:scale(1); opacity:1; }
    .hoverEffect .txt h3 { font-size:30px; margin:120px 0 10px 0; }

    .hoverEffect_good { float:left; position:relative; width: 950px; height:370px; margin:10px; overflow:hidden; }
    .hoverEffect_good .image { display:block; opacity:1; position:relative; transform:scale(1.2); transition:0.5s ease; }
    .hoverEffect_good:hover>.image { transform:scale(1); filter: blur(5px); opacity:0.3; }
    .hoverEffect_good .txt {color:black; font-size:20px; top:50%; left:50%; text-align:center; line-height:20px; position:absolute; top:0; left:0; height:100%; width: 100%; background:rgba(195,193,149,0); opacity:0; overflow:hidden; transform:scale(2); transition:0.3s ease; }
    .hoverEffect_good:hover .txt { background:rgba(255,255,255,0.8); transform:scale(1); opacity:1; }
    .hoverEffect_good .txt h3 { font-size:30px; margin:120px 0 10px 0; }

    .nav{position:fixed; left:30px; top:120px; z-index: 999;}

    .scroll_up{position:fixed; right:60px; top:350px;  line-height: 1.17648; min-width: 38px; background: #000000;
    padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; z-index: 999;}

	.btn_scroll_up{position:fixed; right:60px; top:350px;  line-height: 1.17648; min-width: 38px; background: black;
    padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; border-radius: 18px;}
	

    .infomation{position:relative; left:730px; font-size: 28px; line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";}

    .goodproduct{ position:relative; left:390px; width:900px; background-color: #ffffff;
    padding-top: 40px; padding-bottom: 40px;  height: 60%; width:1000px;  margin: 0 2.08333% 2.08333%;}

    .product_table{background-color:#ffffff; width:60%; margin:auto; }
    .product_table {background-color:#ffffff; border-collapse: collapse; }
    .product_table td {background-color:#ffffff; color: #000000; text-align: center; font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif"; font-weight: 600; }

    .content_add{position:relative; left:870px; line-height: 1.17648; min-width: 38px; background: #0071e3;
    padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; border-radius: 18px;}
   .slide_btn {display:none;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
   $(function(){

  var vi = 630;
  $(window).scroll(function(){
     var num = $(window).scrollTop();
             if( num > vi ){
                  $(".nav").show(300);
             }else{
                  $(".nav").hide(300);
            }
   });

  });
   </script>

   <script type="text/javascript">
   $(function(){

  var vi = 630;
  $(window).scroll(function(){
     var num = $(window).scrollTop();
             if( num > vi ){
                  $(".scroll_up").fadeIn(300);
                  $(".btn_scroll_up").fadeIn(300);
             }else{
                  $(".scroll_up").fadeOut(300);
                  $(".btn_scroll_up").fadeOut(300);
            }
   });

  });
   
   
   
   
   </script>
	 <c:set var="cnt" value="0"></c:set>
 	<c:set var="w_cnt" value="0"></c:set>	
 	 <c:set var="index" value="0"></c:set>
  <div id="block" style="width: 100%; height: 600px;" data-vide-bg="/resources/Index/video/ocean" data-vide-options="position: 0% 50%"></div>

          <div class="video_text">
              <h3>あなたの思い出,</h2>
              <h3>ヨギ観光で</h2>
              <h3>作る</h2>
          </div>

          <header role="banner">
          	<form name="fm" method="get">
            <nav class="nav" role="navigation">
              <ul class="nav__list">
                <li>
                  <input id="group-1" type="checkbox" hidden />
                  <label for="group-1"><span class="fa fa-angle-right"></span> 搭乗地 </label>
                  <ul class="group-list">
                    <li><a href="/Reservation/reserv_main?row=1&place=1&outplace=${outplace}">ソウル/京畿/仁川</a></li>
                    <li><a href="/Reservation/reserv_main?row=1&place=2&outplace=${outplace}">江原道</a></li>
                    <li><a href="/Reservation/reserv_main?row=1&place=3&outplace=${outplace}">大田/忠清南道/忠淸北道</a></li>
                    <li><a href="/Reservation/reserv_main?row=1&place=4&outplace=${outplace}">光州/全羅南道/全羅北道</a></li>
                    <li><a href="/Reservation/reserv_main?row=1&place=5&outplace=${outplace}">釜山/大邱/慶尙南道/慶尙北道</a></li>
                    </li>
                    <input type="hidden" name="place" value="${ place }">
                  </ul>
                </li>

                <li>
                <input id="group-2" type="checkbox" hidden />
                <label for="group-2"><span class="fa fa-angle-right"></span> 到着地</label>
                <ul class="group-list">
                  <li>
                    <li><a href="/Reservation/reserv_main?row=-1&outplace=1&place=${place}">ソウル/京畿/仁川</a></li>
                    <li><a href="/Reservation/reserv_main?row=-1&outplace=2&place=${place}">江原道</a></li>
                    <li><a href="/Reservation/reserv_main?row=-1&outplace=3&place=${place}">大田/忠清南道/忠淸北道</a></li>
                    <li><a href="/Reservation/reserv_main?row=-1&outplace=4&place=${place}">光州/全羅南道/全羅北道</a></li>
                    <li><a href="/Reservation/reserv_main?row=-1&outplace=5&place=${place}">釜山/大邱/慶尙南道/慶尙北道</a></li>
                  </li>
                  <input type="hidden" name="outplace" value="${ outplace }">
                </ul>
				   	
                </li>
                
              </ul>
            </nav>
            </form>
          </header>

<a style="display:scroll;" href="#">
        <div class="scroll_up">
          <font color="white">TOP ▲</font>
        </div>
       
</a>
	
		<c:if test="${ place!=0 }">  
			<div class="btn_scroll_up" style="top: 410px;left: 1100px;">
			  <a href="/Reservation/reserv_main?row=-1&outplace=${ outplace }&place=0">
			  	<font color="white">X&nbsp;&nbsp;搭乗地 : ${ p_button }</font>
			  </a>
			</div>
		</c:if>  
		<c:if test="${ outplace!=0 }">  
			<div class="btn_scroll_up" style="top: 550px;left: 1100px;">
			  <a href="/Reservation/reserv_main?row=1&outplace=0&place=${place}">
			  	<font color="white">X&nbsp;&nbsp;搭乗地 : ${ op_button }</font>
			  </a>
			</div>  
		</c:if>  
	




<section>
<c:set var="mlistcnt" value="${fn:length(mlist) }"></c:set>
<c:forEach var="plist" begin="0" end="${ (mlistcnt/8) }" varStatus="w_stat">
   <div class = "product_table" >
      
        <table align="center">
           <tr>
               <td colspan="4"><br></td>
            </tr>
      <c:if test="${empty mlist}">
         <p style="font-size:40px;">登録された商品がありません</p>
      </c:if>
      <c:if test="${!empty mlist}">
     
      <c:set var="mlist" value="${ mlist }"></c:set>
      
  	  
      <tr>
     
      
      <c:forEach var="mlist" items="${ mlist }" begin="${ w_cnt*8 }" end="${ (w_cnt*8)+7 }" varStatus="stat">
        <c:set var="index" value="${ index+1 }"></c:set>    
          <c:set var="file_split" value="${fn:split(mlist.p_filename,',') }"></c:set>
           	<c:forEach var="filename" items="${file_split }" begin="0" end="0">
            <td>
              <section class="hoverEffect">
                 <img style="border: 6px solid #000000; width:249px;"
                src="${ savePath }/${filename }" width="350" height="240"/>
                <a href = "product_view?p_idx=${ mlist.p_idx }&id=${ user.id }">
                 <div class="txt"><h3>${ mlist.p_title }</h3>予約人数 ${ mlist.p_reservpeople }/${ mlist.p_maxpeople }<br>価格 ${ mlist.p_price }円<br>出発日 : ${ mlist.p_indate.substring(0,10) }</div>
                </a>
              </section>
            </td>
            </c:forEach>
             
            
            
  
            
	            <c:if test="${ stat.count%4==0 || index==mlistcnt}">
	   
	               </tr>
	               <tr>
	               
	               <c:forEach var="mlist2" items="${ mlist2 }" begin="${ cnt*4}" end="${ (cnt*4)+3 }" varStatus="stat2">
	                
	                  <td><font size = "4">
						  <p><center>出発地: ${ mlist2.p_in }  </p>                  
	                      <p><center>到着地: ${ mlist2.p_out }  </p>
	                      <p> 予約人数 : ${ mlist2.p_reservpeople }/${ mlist2.p_maxpeople } </center></font></p>
	                  </td>
	               </c:forEach>
	               
	               <c:set var="cnt" value="${ cnt+1 }"></c:set>
	               </tr>
	               <tr>
	                  <td colspan="4"><br></td>
	               </tr>
	               <tr>
	            </c:if>
         
            
       </c:forEach>
       </tr>

       </c:if>   
          </table>
		  	
   </div>
   <br><br>
 <c:set var="w_cnt" value="${ w_cnt+1 }"></c:set>  
 </c:forEach>  
</section>

<br><br>











<br><br>

<a href="#" id="load">
<span class="content_add">
  <font color="white">その他を表示 <font size="5">+</font></font>
</span>
</a>

<br><br><br>

  <script>
    $(function(){
      $("div").slice(0,15).show();
      $("#load").click(function(e){
        e.preventDefault();
        $("div:hidden").slice(0,16).show();
        if($("div:hidden").length==1){
        	alert("これ以上掲示がありません");
        }
      });
    });
  </script>
</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</html>