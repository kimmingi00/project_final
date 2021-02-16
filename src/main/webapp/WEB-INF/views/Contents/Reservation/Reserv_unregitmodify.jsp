<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<section>
		<form name="fm" method="post" >
				
	        <br><br><br><br><br><br><br><br><br>
	        <div class="cont_info">
	        	<h2 style="font-size: 30px;    margin-bottom: 60px;    margin-left: 28px;">${ pvo.p_title }</h2>
	        	<c:set var="file_split" value="${fn:split(pvo.p_filename, ',') }"></c:set>
	        	<c:if test="${pvo.p_title!=null }">
	        	<c:forEach var="file" items="${ file_split }" begin="0" end="0">	
	        	
	        		<img src="${savePath }/${file}" style="width:220px; height:140px; margin-bottom:60px;"><br>
	        	</c:forEach>
	        	</c:if>
	        	<c:if test="${pvo.p_title==null }" >
	        		<img src="${savePath }/no-image.png" style="width:220px; height:140px; margin-bottom:60px;"><br>
	        	</c:if>
	        	<input type="hidden" name="ur_email" value="${ ur_email }">
	        	<input type="hidden" name="p_price" value="${ pvo.p_price }">
	        	<a href="javascript:cnt_down()" style= "margin-left: 50px;"><i class="fa fa-angle-left" aria-hidden="true" style="color:#0071e3;"></i></a>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="button" value="${ reserv_cnt }" name="reserv_cnt" style="background:#fff; border:none; font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;
	        	<a href="javascript:cnt_up(${ pvo.p_maxpeople-pvo.p_reservpeople })"><i class="fa fa-angle-right" aria-hidden="true" style="color:#0071e3;"></i></a>
	        	&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;<input type="button" value="${ reserv_cnt*pvo.p_price }" name="reserv_money" style="background:#fff; border:none; font-size:20px;">円
	        	<br><br><br><br><br>
	        	<p><a href="javascript:send(fm.reserv_cnt.value)"><input type="button" name="reserv" value="予約変更" class="btn" style="margin-left:70px;"></a>&nbsp;&nbsp; <a href="javascript:del(fm.reserv_cnt.value)"><input type="button" name="reserv" value="予約取り消し" class="btn" style="margin-left:70px;"></a></p>
	        </div>    
		</form>
		
	</section>
<style>
	
	section {background-color:#fff; font-color:black; margin-left: 290px; margin-top:8%;
        		width:1300px; height:720px; 
        		
        		
        		}
	
	p {margin-bottom:20px;}
	
	.cont_info {margin-left:42%; }
	
	
	.btn {margin-bottom:20px; background-color:#07c; color:white; 
		border-color: #07c;
    	border-width: 1px;
    	border-style: solid;
    	font-size: 17px;
    	font-weight: 400;
    	text-align: center;
    	white-space: nowrap;
    	line-height: 1.17648;
	    min-width: 28px;
	    padding-left: 16px;
	    padding-right: 16px;
	    padding-top: 8px;
	    padding-bottom: 8px;
	    border-radius: 18px;
	    background: #0071e3;
		}
		

  .box {
    position: relative;
    top: 370px;
    left: 370px;
    transform: translate(-50%, -50%);
    width: 36rem;
    padding: 2.5rem;
    box-sizing: border-box;
    border-right: 1px solid #dadce0;
    -webkit-border-radius: 8px;
    border-radius: 8px;
    text-align:center;

  }



  .box h2 {
    margin: 0px 0 -0.125rem;
    padding: 0;
    color: #fff;
    text-align: center;
    color: #202124;
    font-family: 'Google Sans','Noto Sans Myanmar UI',arial,sans-serif;
    font-size: 24px;
    font-weight: 400;
  }

  .box p {
    font-size: 16px;
    font-weight: 400;
    letter-spacing: .1px;
    line-height: 1.5;
    margin-bottom: 25px;
    text-align: center;
  }

  .box .inputBox {
    position: relative;
  }

  .box .inputBox input {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;

  }

  .box .thema {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;
    height: 50px;
    padding-bottom: 10px;
}

  .box .inputBox label {
    position: absolute;
    top: 0;
    left: 160px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }
  
   .box .inputBox .em_label {
    position: absolute;
    top: 0;
    left: 30px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }
	
  .box .inputBox input:focus ~ .em_label,
  .box .inputBox input:valid ~ .em_label,
  .box .inputBox input:not([value=""]) ~ .em_label {
    top: -1.125rem;
    left: 20px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }
	
	
  .box .inputBox input:focus ~ label,
  .box .inputBox input:valid ~ label,
  .box .inputBox input:not([value=""]) ~ label {
    top: -1.125rem;
    left: 150px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }
  .box .inputBox input:focus {
    outline: none;
    border: 2px solid #363636;
  }
  .box input[type="submit"] {
    border: none;
    outline: none;
    color: #fff;
    background-color: #;
    padding: 0.625rem 1.25rem;
    cursor: pointer;
    border-radius: 0.312rem;
    font-size: 1rem;
    float: right;
  }

  .box input[type="submit"]:hover {
    background-color: #909090;
  }

  

	
</style>
<script>
	function send(cnt) {
		
		fm.action='/Reservation/Unregit_modify?p_idx=${ pvo.p_idx }&reserv_cnt='+cnt+'&email='+fm.ur_email.value;
		fm.submit();
	}
	
	
function cnt_up(max) {
		
		if(fm.reserv_cnt.value<max) {
			fm.reserv_cnt.value++;
			fm.reserv_money.value=fm.p_price.value*fm.reserv_cnt.value;
		}
		
	}
	function cnt_down() {
		if(fm.reserv_cnt.value>1) {
			fm.reserv_cnt.value--;
			fm.reserv_money.value=fm.p_price.value*fm.reserv_cnt.value;
		}
		
	}	
	
	function del(cnt) {
		fm.action='/ReservServlet?command=unregit_delete&p_idx=${ pvo.p_idx }&reserv_cnt='+cnt;
		fm.submit();
	}
</script>

<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</body>





</html>