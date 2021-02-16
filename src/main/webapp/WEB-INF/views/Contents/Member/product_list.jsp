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
			alert("出発時間がすぎた商品は存在してません");
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
		<li style="border-right:1px solid grey;"><a class="menuLink" href="unregit_list" style="height: 16px; padding-right:15px;">&nbsp; 臨時会員管理   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="admin_list">&nbsp; 管理者目録   &nbsp;</a></li>
		<li style="border-right:1px solid grey;"><a class="menuLink"	href="product_list">&nbsp; 商品情報   &nbsp;</a></li>
	</ul>
	<form name="fm" method="post" action="/ReservServlet?command=product_delete">
		<ul>
			<li><a href="javascript:del(fm.blistcnt.value)"><input type="button" value="日にちがすぎた商品削除" class="button"></a></li>
		</ul>
		<input type="hidden" name="blistcnt" value="${ listcnt }">
	</form>

</nav>
<br><br><br><br><br><br><br><br>
<table class="table table-striped"
	style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">商品番号</th>
			<th style="background-color: #eeeeee; text-align: center;">商品名</th>
			<th style="background-color: #eeeeee; text-align: center;">事業者ID</th>
			<th style="background-color: #eeeeee; text-align: center;">出発地</th>
			<th style="background-color: #eeeeee; text-align: center;">出発日</th>
			<th style="background-color: #eeeeee; text-align: center;">到着地</th>
			<th style="background-color: #eeeeee; text-align: center;">予約人数</th>
			
		</tr>
	</thead>

	<c:if test="${! empty list }">
		<c:forEach var="list" items="${ list }">
			<tbody>
				<tr>
					
					<td>${ list.p_idx }</td>
					<td>${ list.p_title }</td>
					<td><a href="/MessageServlet?command=MsgIdSend&id=${ list.b_id }">${ list.b_id }</a></td>
					<td>${ list.p_in }</td>
					<td>${ list.p_indate.substring(0,10) }</td>
					<td>${ list.p_out }</td>
					<td>${ list.p_reservpeople }</td>
				</tr>
			</tbody>
		</c:forEach>
	</c:if>
	<c:if test="${ empty list }">
			<tbody>
				<tr>
					<td colspan="7">登録された商品が存在しません</td>
				</tr>
			</tbody>
	</c:if>
</table>
<br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</body>

</html>