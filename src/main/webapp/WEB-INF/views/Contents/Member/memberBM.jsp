<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="UTF-8">
<title>본인확인 </title>
<script>
function send(){
	
	
		if(mfm.checkPW.value==""){
			alert("アカウント情報を確認するとパスワードを入力してください");
			return;
		}
		
		
		
		mfm.submit();
	}
function before(){
	alert("トップへ戻ります");
	location.href="index";
}
	

    </script>




<div class="container" style="margin-bottom:300px;">
		<div class="alert">
		<br><br><br><br>
						<center>
						<font size ="4"><p>会員様の <span>アカウント確認</span>のためパスワードをもう一回入力してください</p></font>
						</center>
						<br>
					<ul>
						<center>
						<font size ="3"><li>パスワードが他人に露出されないよう注意してください</li><br>
						<li>パスワードには個人情報やIDを含んだ </li>
						<li>パスワード, 家電話, 携帯番号 , 英文姓名 など 他人が使いやすいパスワードは使用しないようにしてください</li>
						</font>
						</center>
					</ul>
				</div>

					<br>
				
					<div style="text-align:center">
						<form name="mfm" method="post" action="/Member/memberBM" style="display:inline">
						<font size ="4"><h3>会員情報</h3></font>
						<br>				
						<font size ="3">
						<ul>
						
							<li><input type="hidden" name="id" value="${ user.id }"></li>
							<li><input type="hidden" name="pass" value="${ user.pass }"></li>
							<li><input type="hidden" name="id" value="${ b_user.b_id }"></li>
							<li><input type="hidden" name="pass" value="${ b_user.b_pass }"></li>
						</ul>
							<center>
							<table>
								<tr>
								    <c:if test="${ empty b_user }">
									<td style="text-align:left">ID &nbsp;&nbsp;: &nbsp;${ user.id }</td>
									</c:if>
									<c:if test="${ empty user }">
									<td style="text-align:left">ID &nbsp;&nbsp;: &nbsp;${ b_user.b_id }</td>
									</c:if>
								</tr>
								<tr>
									<td>パスワード : &nbsp;<input type="password" class="medium" id="checkPW" name="checkPW" title="비밀번호를 입력하세요" style="width:120px" /></td>
								</tr>
							</table>
							</center>
						</font>		
									
						</font>
							</form>
						</div>
				<br><br><br><br>
					<div style="text-align:center">
					<input type="submit" value="確認" title="확인" class="btn" onClick="javascript:send()"/>
					<input type="submit" value="取り消し" title="취소" class="btn" onClick="javascritpt:before()"/>
					</div>
		
				</div>
</div>
		
				
				
				
	


   

 
<style>
	body{background-color:#f2f2f2;
	}
   .container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:180px; width:60%; height: 450px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%;}

       .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";

    }

            .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}

</style>
				
</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>

</html>