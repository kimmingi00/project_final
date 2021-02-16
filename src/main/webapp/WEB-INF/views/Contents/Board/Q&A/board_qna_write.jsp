<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %>

<title>write</title>

<section>
<center>
<div class="notice">

     <div style="margin-top:30px;">
     <font style="color:#000000;" class="alert" size="5">
     <img src="/resources/img/board_img/qwrite.png" width="64px;" height="64px;"style="margin-left:130px;"></a>
     	アップロード
     </font>
     </div>
 
     <form method="post" name="board" action="board_qna_write?page=${page}" >
     	<input type="hidden" name="parent" value="${boardVO.q_parent}">
		<input type="hidden" name="realparent" value="${boardVO.q_re_ref}">
		<input type="hidden" name="depth" value="${boardVO.q_re_lev}">
		<input type="hidden" name="indent" value="${boardVO.q_re_seq}">
	  <table border="0" style="margin-top:30px;width:90%;margin-left:10px">

       <tr>
         <td><font size="3" color="#000000" class="alert">ID</font></td>
         
        <c:if test="${ !empty user }"> 
         <td>       
         <input type="text" size="60" name="id" style="text-align:center;width:200px;" value="${user.id}" ></td>
        </c:if> 
        <c:if test="${ !empty b_user }"> 
         <td>       
         <input type="text" size="60" name="id" style="text-align:center;width:200px;" value="${b_user.b_id}" ></td>
        </c:if> 
       </tr>
	   <tr>
         <td><font size="3"  color="#000000" class="alert">タイトル</font></td>
         <td><input type="text" size="60" name="q_title" style=text-align:center;width:400px;></td>
       </tr>
       <tr>
      
         <td><font size="3" color="#000000" class="alert">内容</font></td>
         <td><textarea wrap="physical" rows="30" name="q_contents" cols="100" style="border-radius:24px;text-align:center;width:90%;height:300px"></textarea></td>
       </tr>
       
       	<tr>
		  
		  <td><font size="3"  color="#000000" class="alert">パイル</font></td>
		  <td><input type="file" name="filename" size="60" style="width:180px;position:relative;top:4px;"></td>
		  </tr>
		 
		<tr>
          <td style="position:relative;left:480px;">
          <center>
            <a href="javascript:send()"><img src="/resources/img/board_img/qwrite.png" style="width:64px;height:64px"></a>
            <a href="javascript:back()"><img src="/resources/img/board_img/qback.png" style="position:relative;bottom:3px;width:64px;height:64px"></a>
            </center>
          </td>
        </tr>
        
      </table>
    
      </form>
	</div>
  </center>
</section>




<script>
	function send(){
	alert("伝送します");
	board.submit();
}
	
	function back(){
		alert("元に戻ります");
		history.back();
	}
</script>

<style>
	
    body{background-color: #f2f2f2;}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 60%; height:740px; border: 24px solid #f2f2f2;
      background-color: #ffffff; overflow: auto; margin-bottom: 170px;}
    .add{position: absolute; right: 90px; top:710px;}
	
    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;}
    th, td {padding: 10px; text-align: center;}
    th{background-color: #003800;}
    input{border-radius: 12px; height:30px;}
    
 .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";}
  </style>
  </body>
  <%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
  </html>
