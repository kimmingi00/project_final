<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section >
		<div class="ok_div">		
			<c:if test="${ row == 0 }">	
				<p class="title">登録に失敗しました</p>
			</c:if>
			<c:if test="${ row == 1 }">
				<p class="title">ありがとうございます</p>
				<p class="title">商品が登録されました</p>
			</c:if>	
				<a href="/Reservation/upload_service?b_id=${ b_user.b_id }"><button class="btn">&nbsp;  他の商品登録 >>  &nbsp;</button></a><br>
				<a href="/Reservation/my_upload_product?b_id=${ b_user.b_id }"><button class="btn">&nbsp;  私の観光商品 >>  &nbsp;</button></a>
		</div>		
	</section>
	
<style>
	
	section {margin-top:10%; color:black; text-align:center; margin-bottom: 230px;}
	p {margin-bottom:50px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {
			margin-bottom:20px; background-color:#07c; color:white; 
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
	
	
</style>

<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>

</body>



</html>