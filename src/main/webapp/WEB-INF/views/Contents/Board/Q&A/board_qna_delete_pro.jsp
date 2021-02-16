<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${row == 0}">
	<script>
		alert("ミス発生");
		history.back();
	</script>
</c:if>

<c:if test="${row != 0}">
	<script>
		alert("削除完了");
		location.replace("board_qna?page=${page}");
		opener.location.href='board_qna?page=1';
		self.close();
	</script>
</c:if>
