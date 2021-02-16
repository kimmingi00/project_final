<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	
	<c:if test="${row==1}">
		<center><h2>メッセージ伝送に成功しました</h2></center>
	</c:if>
	<c:if test="${row==0}">
		<center><h2>メッセージ伝送に失敗しました</h2></center>
	</c:if>
	
</section>
<style>
	body{background:#f2f2f2;}
	section {margin-top:20%;}
	table, tr, td {border:1px solid white;}
	.msg_table {font-size:20px; text-align:center; margin-left:30%;}
	
	.msg_table th {width:250px;}
	.msg_ul {font-size:20px; margin-bottom:5%;}
	
	
</style>
</body>
</html>