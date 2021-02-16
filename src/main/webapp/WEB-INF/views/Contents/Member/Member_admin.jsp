<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp"%><style>
body {
	background-color: #f2f2f2;
}

#topMenu {
	position: relative;
	left: 700px;
	top:37px;
	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	float: left;
	display:inline;

	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: black;
	display: block;
	width: 100px;
	font-size: 14px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: white;
	background-color: #4d4d4d;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-bottom:200px;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;こんにちは、管理者 ${ user.name }様</h2>
<nav id="topMenu">

	<ul>
		<li style="border-right:1px solid grey;"><a class="menuLink" href="member_list" style="height: 16px; padding-right:15px;" >&nbsp; 一般会員情報   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="business_list">&nbsp; 事業者情報   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink" href="unregit_list" style="height: 16px; padding-right:15px;">&nbsp; 臨時会員管理   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="admin_list">&nbsp; 管理者目録   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="product_list">&nbsp; 商品情報   &nbsp;</a></li>
	</ul>

</nav>
<br><br><br><br><br><br><br><br>
<table class="table table-striped"
	style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">ID</th>
			<th style="background-color: #eeeeee; text-align: center;">名前</th>
			<th style="background-color: #eeeeee; text-align: center;">メール</th>
			<th style="background-color: #eeeeee; text-align: center;">電話番号</th>
			<th style="background-color: #eeeeee; text-align: center;">加入日</th>
			<th style="background-color: #eeeeee; text-align: center;">最後のログイン</th>
		</tr>
	</thead>

	<c:if test="${! empty list }">
		<c:forEach var="list" items="${ list }">
			<tbody>
				<tr>
					<td><a href="/MessageServlet?command=MsgIdSend&id=${ list.id }">${ list.id }</a></td>
					<td>${ list.name }</td>
					<td>${ list.email }</td>
					<td>${ list.tel }</td>
					<td>${ list.regdate }</td>
					<td>${ list.lastdate }</td>
				</tr>
			</tbody>
		</c:forEach>
	</c:if>
</table>
<br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</body>

</html>