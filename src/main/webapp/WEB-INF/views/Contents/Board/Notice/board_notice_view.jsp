<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %>



 
<title>view</title>
<font class="alert">
<div class = "notice" style="margin-top:50px;margin-left:20%;">
<font color="#000000" class="alert">
  <font size ="6" style=margin-bottom:10px;>
        お知らせ
  </font>
  <br>
   <table border="0" width="800" style="margin-top:20px;border-top:3px solid black;">
     <tr>
       <td width="100%" valign="top">&nbsp;<br>
       
       <table border="0" width="100%" align="center" cellspacing="0" style="height:200px;">
       
         <tr>
           <td class="title" style="height:50px;">
          <font size="5" style="color:#000000;position:relative;bottom:15px;">
                  ${board.title}
                  </font>
              <div style="float:right;position:relative;top:10px;color:#737881">
              <font style="color:#000000;margin-right:30px;">${board.id}</font>
              ${board.regdate.substring(0,11)} 
              
              </div>
             
           </td>
         </tr>
         
         <tr>
           <td class="content"  style="height:380px;width:500px;border-bottom: 1px solid #D8D8D8;border-top: 1px solid #D8D8D8;">
             <p style="margin-bottom:100px;">
             <font style="color:#000000;font-size:10.5pt;">       
             ${board.contents}
            </font>
            </p>
           </td>
         </tr>
         
         </table>
</font>

      <!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
      <p align="center" style="position:relative;top:25px;">
      <font size="2">
       
		<c:if test="${user.admin==1}">	
		   <!-- 수정하기 -->
	       <a href="board_modify?idx=${board.idx}&page=${page}">
	       <img src="/resources/img/board_img/qupdate2.png" border="0" style="width:64px;height:64px"></a>&nbsp;&nbsp;
	     	<a href="javascript:board_del()"><img src="/resources/img/board_img/qtrash3.png" border="0" style="width:64px;height:64px"></a>&nbsp;&nbsp;
		</c:if>
        <!-- 목록보기 -->
       <a href="notice?page=${page}"><img src="/resources/img/board_img/qlist.png" style="width:64px;height:64px"></a>&nbsp;&nbsp;
      </font>
    </td>
  </tr>
  </table>  
</div>
</font>
	<style>
    body{background-color:#f2f2f2}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 60%; height: 650px; border: 24px solid #ffffff;
      background-color: #ffffff; overflow: auto; margin-bottom: 170px;}
    .add{position: absolute; right: 90px; top:710px;}
	
    @font-face {
      font-family:'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;}
    th, td {padding: 10px;}
    th{background-color: #003800;}
    input{border-radius: 12px; height:45px;}
    
    .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";
    font-size:16px;
    }
  </style>

<script>
   function board_del(){
      url = "board_notice_delete?idx=${board.idx}&page=${page}";
      window.open(url,"board_notice_delete","width=500,height=140,top="+(screen.availHeight/2-80)+",left="+((screen.availWidth/2)-200)+"");     
   }
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
  </body>
  <%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
  </html>

