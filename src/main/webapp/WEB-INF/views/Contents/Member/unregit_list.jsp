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

.button {
	cursor: pointer; display: inline-block; text-align: center; font-size: 15px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;
    margin-top: 40px;
    width: 153px;
    margin-top: 24px;
    margin-left: 201%;
    }
</style>
<script type="text/javascript">
	function del(cnt) {
		if(cnt<1) {
			alert("日にちがすぎた臨時アカウントが存在しません");
			return;
		}
		fm.submit();
	}
	 


</script>

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
		<li style="border-right:1px solid grey;"><a class="menuLink" href="unregit_list"style="height: 16px; padding-right:15px;">&nbsp; 臨時会員管理   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="admin_list">&nbsp; 管理者目録   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="product_list">&nbsp; 商品情報   &nbsp;</a></li>
		
	</ul>
	<form name="fm" method="post" action="/MemberServlet?command=unregit_delete">
		<ul>
			<li><a href="javascript:del(fm.blistcnt.value)"><input type="button" value="임시회원 계정정리" class="button"></a></li>
		</ul>
		<input type="hidden" name="blistcnt" value="${ listcnt }">
	</form>
</nav>
<br><br><br><br><br><br><br><br>
<table class="table table-striped"
	style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">メール</th>
			<th style="background-color: #eeeeee; text-align: center;">名前</th>
			<th style="background-color: #eeeeee; text-align: center;">電話番号</th>
			<th style="background-color: #eeeeee; text-align: center;">加入日</th>
		</tr>
	</thead>

	<c:if test="${! empty list }">
		<c:forEach var="list" items="${ list }">
			<tbody>
				<tr>
					<td>${ list.ur_email }</td>
					<td>${ list.ur_name }</td>
					<td>${ list.ur_tel }</td>
					<td>${ list.regdate }</td>
				</tr>
			</tbody>
		</c:forEach>
	</c:if>
	<c:if test="${ empty list }">
			<tbody>
				<tr>
					<td colspan="4">臨時会員アカウントが存在しません</td>
				</tr>
			</tbody>
	</c:if>
</table>
<br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</body>

</html>