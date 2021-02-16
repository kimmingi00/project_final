<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


 


<div class="ok">
	<c:if test="${ row==0 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">臨時アカウント登録に失敗しました。</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">登録済みのメールアドレスは既に臨時アカウントで登録されています。</p>
		<p style="font-size: 20px; margin-bottom: 20px;">*1つのEメールでは一つの商品しか予約できませんし、もう一度予約するには商品の出発日から2週間が経過しなければなりません。</p>
		
	</c:if>
	<c:if test="${ row==3 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">予約に失敗しました</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">もう一度、試してください。</p>
	</c:if>
	<c:if test="${ row==4 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">予約が成功しました</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">ヨギ観光の ご利用ありがとうございます</p>
	</c:if>	
	<p style="color:#0070c9; font-size: 23px;"><a href="/index" >トップへ ></a></p>
</div>
<style>
	.ok {color:black; text-align:center; margin-top:20%;}
	
</style>
</body>
</html>