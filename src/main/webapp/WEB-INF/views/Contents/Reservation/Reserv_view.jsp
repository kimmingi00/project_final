<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <link rel="stylesheet"  href="/resources/Index/imgslider_css/lightslider.css"/>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="tempDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
	<fmt:parseDate value="${tempDate}" var="sysDate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${ sysDate.time  / (1000*60*60*24) }" integerOnly="true" var="sysDateNum"></fmt:parseNumber>
	<fmt:parseDate value="${ pvo.p_indate }" var="indate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${ indate.time  / (1000*60*60*24) }" integerOnly="true" var="indateNum"></fmt:parseNumber>
	
	<div class="view_title">
		<img src="/resources/img/product_img/천지연.jpg" style="width:1900px; height:850px;">
		<h2 style="color:white;position: absolute;left: 28%;top: 50%;font-size: 50px; text-shadow: 2px 1px 1px black;">今, ヨギ観光と一緒に旅行してみませんか？</h2>
	</div>
	<div class="flash">
	  <h1 style="position:absolute; left: 41%; top: 669px; text-shadow: 2px 1px 1px black;">
	  	下で商品の情報を確認してください<br>
	  	<i class="fa fa-angle-double-down" aria-hidden="true" style="position:absolute;left: 46%;top: 108px;text-shadow: 2px 1px 1px black;font-size: 52px;"></i>
	  </h1>
	</div>
	<section class="product">
		<div class="cont_img">
			<c:if test="${ pvo.p_filename==null }">
				<img src="/resources/img/product_img/no-image.png" style="width:650px; height:340px; ">
			</c:if>
			<c:if test="${ pvo.p_filename!=null }">			
			    <div class="demo">
			        <div class="item">
			            <div class="clearfix" style="max-width:474px;">
			                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
			                    <c:forEach var="filename" items="${ filename }">
			                    	
			                    	<c:if test="${ filename!=null }">
					                    <li data-thumb="${ savePath }/${filename}" >
					                        <img src="${ savePath }/${filename}" style="width:650px; height:340px;" />
					                    </li>
					                </c:if>    
			                    </c:forEach>
			                </ul>
			            </div>
			        </div>
			    </div>
		    </c:if>	
	    </div>
		<div class="cont_info">
			<h2>${ pvo.p_title }</h2>
			
			<p>掲示者 : <a href="">${ pvo.b_id }</a>&nbsp;&nbsp;&nbsp;&nbsp; <c:if test="${user!=null}"><a href="/Message/MsgIdSend?id=${ pvo.b_id }" ><img src="/resources/img/icon/message.png" style="width: 31px; height: 25px;"></a></c:if></p> 
			
		<c:if test="${ (indateNum-sysDateNum) > 0 }">	
			<p>出発日 : ${ pvo.p_indate }/ 
			 <font style="font-weight:bold;">現在 ${indateNum-sysDateNum}日 残り</font></p>
		</c:if>	
		
		<c:if test="${ (indateNum-sysDateNum) <= 0 }">	
			<p>出発日 : ${ pvo.p_indate }/ 
			 <font style="font-weight:bold;">時間がすぎた旅行です</font></p>
		</c:if>	
		
			
			
				 
					<c:forEach var="place" items="${ place }" varStatus="stat">
				   	<p>出発地${ stat.count } :
				   		 ${ place }&nbsp;/&nbsp;
				   		 <c:forEach var="time" items="${ time }" begin="${ stat.index }" end="${ stat.index }" >
				   		 ${time }
				   		 </c:forEach>
				   		 
				   	</p>	 
				   	</c:forEach>
				
				
			<p>到着日 : ${ pvo.p_outdate }&nbsp;/&nbsp;到着時間 : ${ pvo.p_outtime } </p>
			<p>到着地 : ${ pvo.p_out }</p>
			
			<p>現在予約人数 : ${ pvo.p_reservpeople }人&nbsp;/&nbsp;制限 : ${ pvo.p_maxpeople }人</p>
			<p>予約可能人数 : <font style="font-weight:bold;">${ pvo.p_maxpeople-pvo.p_reservpeople }人</font></p>
			<p>価格 : ${ pvo.p_price }円</p>
			
			<c:if test="${pvo.theme!=null }">
			<p>テーマ : ${ pvo.theme }</p>
			</c:if>
			
			<p>登録日 : ${ pvo.p_regdate.substring(0,10) }</p>
			<form name="fm" method="post">
				<c:if test="${ pvo.p_reservpeople<pvo.p_maxpeople }">
					
					<c:if test="${ (indateNum-sysDateNum) > 0 }">

						<c:if test="${ row == 0 || !empty cnt}">
							<p>
							 予約人数&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="javascript:cnt_down()"><i class="fa fa-angle-left" aria-hidden="true" style="color:#0071e3;"></i></a>&nbsp;
							 <input type="button" value="1" name="reserv_cnt" style="background:#fff; border:none; font-size:20px;">&nbsp;
							 <a href="javascript:cnt_up(${ pvo.p_maxpeople-pvo.p_reservpeople })"><i class="fa fa-angle-right" aria-hidden="true" style="color:#0071e3;"></i></a>&nbsp;&nbsp;&nbsp;
							 <input type="button" value="${ pvo.p_price }" name="reserv_money" style="background:#fff; border:none; font-size:20px;">円
							</p>
							<a href="javascript:reserv()"><input type="button" value="予約" class="btn"></a>&nbsp;&nbsp;&nbsp;
							<c:if test="${ user==null }">
								<a href="javascript:unregit_modify(fm.reserv_cnt.value)"><input type="button" value="予約変更/取り消し(非会員)" class="btn"></a>
							</c:if>
						</c:if>
						
						<c:if test="${ row == 1 }">
							<p>
							<font style="font-weight:bold;">すでに予約した商品です</font>
							</p>
							<a href="/Reservation/Reserv_modify?p_idx=${ pvo.p_idx }&id=${ user.id }"><input type="button" value="予約変更/取り消し" class="btn"></a>
						</c:if>
												
					</c:if>	
				</c:if>
				<c:if test="${ pvo.p_reservpeople>=pvo.p_maxpeople }">
					<p>売り切れました</p>
				</c:if>
				<input type="hidden" name="id" value="${ user.id }">
				<input type="hidden" name="idx" value="${ pvo.p_idx }">
				<input type="hidden" name="p_price" value="${ pvo.p_price }">
				
			</form>
		</div>
	
		
	</section>
	
	<section class="product_cont">
		<div class="cont_contents">
			<br><br><br><br><br><br><br><br><br><br>
			<p>${ contents }</p>
		</div>	
	</section>
<style>
	
	section {background-color:#fff; font-color:black; margin-left: 184px; }
	.product {margin-top:7%; color:black; width:1500px; height:780px; }
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
	.cont_img { margin-left:125px; padding:75px; }
	.cont_info {margin-top: -27%; margin-left:64%;}
	.cont_info p {font-size:20px;}
	
	.product_cont {margin-top:7%; color:black; width:1500px; height:500px; 
					text-align:center; font-size:20px;
	}
	
	
	
<!--flash css -->


@keyframes flash {
  25% {
  	opacity: 0;
  	 }
 
 
  50% {
    opacity: 1;
  }
	
 
 
  75% {
    opacity: 0;
  }
  
  100% {
    opacity: 1;
  }
}

.flash {

  animation-name: flash;
}

<!--flash css 끝 -->	
	
</style>

<script>
	function reserv() {
		if(fm.id.value=="") {
			fm.action="/Reservation/Reserv_ok?p_idx="+fm.idx.value+"&reserv_cnt="+fm.reserv_cnt.value;
			fm.submit();
		}else {
			fm.action="/Reservation/Reserv_regit?p_idx="+fm.idx.value+"&reserv_cnt="+fm.reserv_cnt.value;
			fm.submit();
		}
	}
	
	function cnt_up(max) {
		
		if(fm.reserv_cnt.value<max) {
			fm.reserv_cnt.value++;
			fm.reserv_money.value=fm.p_price.value*fm.reserv_cnt.value;
		}
		
	}
	function cnt_down() {
		if(fm.reserv_cnt.value>1) {
			fm.reserv_cnt.value--;
			fm.reserv_money.value=fm.p_price.value*fm.reserv_cnt.value;
		}
		
	}
	
	function unregit_modify(cnt) {
		fm.action='/Reservation/Unregit_login?p_idx=${ pvo.p_idx }&reserv_cnt='+cnt;
		fm.submit();
	}
	
	
	
</script>
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
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</body>
</html>