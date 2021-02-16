<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<section>
	<div class="list_cont">
		<ul>
			<li>
				<p>{pvo.p_title}</p>
			</li>
			<li>
				<img src="" alt="">
			</li>
			<li>
				出発日 &nbsp;${pvo.p_in.substring(0,10)}/終了日&nbsp;${pvo.p_out.substring(0,10)}
			</li>
		<c:if test="${pvo.p_maxpeople-pvo.p_reservpeople==0}">	
			<li>売り切れました</li>
		</c:if>
		<c:if test="${pvo.p_maxpeople-pvo.p_reservpeople>0}">	
			<li>
				予約人数&nbsp;${pvo.p_reservpeople}人/${pvo.p_maxpeople}人<br>
				今すぐ予約してください!&nbsp;<a href="#"><button>予約</button></a>
			</li>
		</c:if>	
			<li>
				登録日&nbsp;${pvo.p_regdate.substring(0,10)}
			</li>
		</ul>
	</div>		
	
</section>


</body>

<style>
	section {margin-top:20%; color:white; text-align:center;}
</style>

</html>