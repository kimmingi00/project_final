<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${ row==1 }">
		<center>
	<h2> 削除した ID: ${ id } </h2>
	
	<h2> 削除した 名前:  ${ name } </h2>
			</center>
	</c:if>
		
		<c:if test="${ row==0 }">
		<center>
		<h2>予約したお客です</h2>
		<a href="/MemberServlet?command=member_list">元へ</a>
		</center>
		</c:if>
	
</body>
</html>