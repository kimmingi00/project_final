<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section>
	<c:if test="${ empty b_user }">
		<div class="no_b_id">
			<h2 style="margin-bottom: 45px;">申し訳ございません</h2>
			<p>ここのメニューは事業者方ためのメニューです</p>
			<p>一般使用者かたは他のメニューを利用してください</p>
			<a href="/index"><input type="button" name="main" value="トップへ >" class="button" style="margin-top: 50px;"></a>
		</div>	
	</c:if>
	<c:if test="${ !empty b_user }">
		<p class="title" style="padding-top: 100px; ">今すぐヨギ観光のサービスを利用してください</p>
		<p style="font-size:20px;">ヨギ観光は事業者みなさなのよりいい収益と便利さのため多様なサービスを提供しています</p>
		<a href="/Reservation/upload_service?b_id=${ b_user.b_id }"><button class="button">&nbsp;  観光商品登録 >>  &nbsp;</button></a><br>
		<a href="/Reservation/my_upload_product?b_id=${ b_user.b_id }"><button class="button">&nbsp;  私の観光商品 >>  &nbsp;</button></a>
	</c:if>
	</section>

</body>
<style>
	
	section {margin-top:6%; color:black; text-align:center; margin-left:24%; background-color:white; 
				width:1000px; height:500px;
				
				}
	p {margin-bottom:20px;}
	.title {font-size: 40px; font-weight:bold;}
	.btn {margin-bottom:20px; background-color:white; color:black; font-size:25px;}
	.no_b_id {font-size:30px; padding-top:110px;
				
	}
	.button {
	cursor: pointer; display: inline-block; text-align: center; font-size: 25px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;
    margin-top: 40px;
    }
</style>

<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</html>