<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <link rel="stylesheet"  href="/resources/Index/imgslider_css/lightslider.css"/>

   <c:set var="now" value="<%=new java.util.Date()%>" />
   <c:set var="tempDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
   <fmt:parseDate value="${tempDate}" var="sysDate" pattern="yyyy-MM-dd"/>
   <fmt:parseNumber value="${ sysDate.time  / (1000*60*60*24) }" integerOnly="true" var="sysDateNum"></fmt:parseNumber>
   <div>
      <img src="/resources/img/product_img/천지연.jpg" style="width:1900px; height:850px;">
      <h2 style="color:white;position: absolute;left: 28%;top: 50%;font-size: 50px; text-shadow: 2px 1px 1px black;">今, ヨギ観光と一緒に旅行してみませんか？</h2>
   </div>
     <h1 class="flash" style="position:absolute; left: 41%; top: 669px; text-shadow: 2px 1px 1px black;">
        下で商品の情報を確認してください<br>
        <i class="fa fa-angle-double-down" aria-hidden="true" style="position:absolute;left: 46%;top: 108px;text-shadow: 2px 1px 1px black;font-size: 52px;"></i>
     </h1>

   <section class="product">
      <div class="cont_img">
         <c:if test="${ pvo.p_filename==null }">
            <div class="demo">
        <div class="item">
            <div class="clearfix" style="max-width:474px;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                    <li data-thumb="/resources/Index/imgslider_image/thumb/cS-1.jpg">
                        <img src="/resources/Index/imgslider_image/cS-1.jpg" />
                         </li>
                </ul>
            </div>
        </div>
    </div>
         </c:if>
           <c:if test="${ pvo.p_filename!=null }">
            <img src="${ savePath }/${pvo.p_filename}" style="width:650px; height:340px; margin-left:11%; margin-top: 2%;">
         </c:if>
      </div>
      <div class="cont_info">
         <h2>${ pvo.p_title }</h2>

         <p>出発日 : ${ pvo.p_indate }&nbsp;&nbsp;/
         <fmt:parseDate value="${ pvo.p_indate }" var="indate" pattern="yyyy-MM-dd"/>
         <fmt:parseNumber value="${ indate.time  / (1000*60*60*24) }" integerOnly="true" var="indateNum"></fmt:parseNumber>
         	<c:set var="restday" value="${indateNum-sysDateNum}"/>
         	
          <font style="font-weight:bold;">
          	<c:if test="${restday>0}">現在 ${indateNum-sysDateNum}日 残り</c:if>
          	<c:if test="${restday<=0}">出発しました</c:if>
          </font></p>
          	
         <p>到着日 : ${ pvo.p_outdate }</p>
         <p>出発地 : ${ pvo.p_in }</p>
         <p>到着地 : ${ pvo.p_out }</p>
         <p>現在予約人数 : ${ pvo.p_reservpeople }&nbsp;/&nbsp;制限 : ${ pvo.p_maxpeople }</p>
         <p>予約可能人数 : <font style="font-weight:bold;">${ pvo.p_maxpeople-pvo.p_reservpeople }人</font></p>
         <p>価格 : ${ pvo.p_price }円</p>

         <c:if test="${pvo.theme!=null }">
         <p>テーマ : ${ pvo.theme }</p>
         </c:if>

         <p>登録日 : ${ pvo.p_regdate.substring(0,10) }</p>
         <form name="fm" method="post" >
         	<c:if test="${restday>0}">
           	 <a href="javascript:reserv()"><input type="button" value="予約" class="btn"></a>
            </c:if>
            <input type="hidden" name="id" value="${ b_user.b_id }">
            <input type="hidden" name="idx" value="${ pvo.p_idx }">
         </form>
      </div>


   </section>

   <section class="product_cont">
      <div class="cont_contents">
         <p>${ pvo.p_contents }</p>
      </div>
   </section>
<style>

   section {background-color:#fff; font-color:black; margin-left: 184px; }
   .product {margin-top:7%; color:black; width:1500px; height:500px; }
   .product h2 {font-size:35px; margin-bottom:5%;}
   p {margin-bottom:20px;}
   .title {font-size: 30px; font-weight:bold;}
   .btn {margin-bottom:20px; background-color:#07c; color:white;
      border-color: #07c;
       border-width: 1px;
       border-style: solid;
       font-size: 17px;
       font-weight: 400;
       text-align: center;
       white-space: nowrap;
       line-height: 1.17648;
       min-width: 28px;
       padding-left: 16px;
       padding-right: 16px;
       padding-top: 8px;
       padding-bottom: 8px;
       border-radius: 18px;
       background: #0071e3;
      }
   .cont_image {position:absolute;  }
   .cont_info {margin-top: -24%; margin-left:67%;}
   .cont_info p {font-size:20px;}

   .product_cont {margin-top:7%; color:black; width:1500px; height:500px;
               text-align:center; font-size:20px;
   }

   	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }

		.demo{
			width: 800px;
		}


<!--flash css -->
@-webkit-keyframes flash {
  from,
  50%,
  to {
    opacity: 1;
  }

  25%,
  75% {
    opacity: 0;
  }
}

@keyframes flash {
  from,
  50%,
  to {
    opacity: 1;
  }

  25%,
  75% {
    opacity: 0;
  }
}

.flash {
  -webkit-animation-name: flash;
  animation-name: flash;
}

<!--flash css 끝 -->

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/resources/Index/imgslider_js/lightslider.js"></script>
    <script>
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }
            });
		});
    </script>
    <script>
    	function reserv() {
    		fm.action='Reserv_unregit';
    		
    		location.href='Reserv_unregit_ok';
    	}
    </script>
</body>





</html>
