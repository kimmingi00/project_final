<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp"%>

<div class = "notice" 
    
>
<font color="#000000" class="alert">
  <font size ="6">
        予約商品
  </font>
  <br>
    <table style="border-top:3px solid black; margin-top: 20px;">  
        <tbody>
        	<tr>
        		
        		<th>商品名前</th>
        		<th>出発地</th>
        		<th>出発日</th>
        		<th>到着地</th>
        		<th>価格</th>
        	</tr>
     
       
		<tr onMouseOver="style.backgroundColor='#ffffff'" onMouseOut="style.backgroundColor=''">
		<c:if test="${ empty list }">
		 <td colspan="5"><font class="alert" size="6" color="#000000">予約した商品が存在しません</font></td>
		</c:if>
		<c:if test="${ not empty list }">
		 
		
		<c:forEach var="board" items="${list}" varStatus="stat">
				
				<td align="left" height="20" style="width:500px;text-align:center;">&nbsp; 
					<font class="alert" size="6" color="#000000">
					<a class="list" href="/Reservation/product_view?p_idx=${ board.p_idx }&id=${user.id}" style="color:black;text-decoration:none;">${board.p_title}</a></td>
					
						<td align="center" height="20"><font class="alert" size="6">
						${board.p_in}</font></td>
						
						 <td align="center" height="20" ><font class="alert" size="6">${board.p_indate.substring(0,10)}</td>
						 
					<td align="center" height="20"><font class="alert" size="6">${board.p_out}</font></td>
					<td align="center" height="20"><font class="alert" size="6">${board.p_price}원</font></td>
				</tr>
				<c:set var="listcount" value="${listcount-1}"/>	</div>
		</c:forEach>
		</c:if>
        </tbody>
      </table>
          <table>
  		<tr>
             <td>        
                 <div align="center" style="color:#000000">${pageSkip}</div>
			  </td>
			 </tr>
		</table>
		
			
</font>
</div>

     <style>
    body{background-color:#f2f2f2}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:130px; width:60%; height: 450px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%; margin-bottom: 170px;}
    .add{position: absolute; right: 90px; top:710px;}

    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
   table{width: 100%;border-collapse: collapse;}
   .notice th, td { border-bottom: 1px solid #D8D8D8; padding : 20px 0px 20px 0px; text-align: center;}
    th{background-color: #585858; color:#ffffff;}

select {
text-align:center;
width: 60px;
padding: .8em .5em;
border: 2px solid #000000;
font-family: inherit;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
border-radius: 12px;
color:black;
size:5;
}

select::-ms-expand {
display: none;


}


.inputbox{
	width:150px;
}

.alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";
    font-size:16px;
    }
  </style>
  
<script type="text/javascript">
	function search(){
		if(sboard.key.value==""){
			alert("検索語を入力してください");
			sboard.key.focus();
			return;
		}
		sboard.submit();
	}
</script>
</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>


</html>
