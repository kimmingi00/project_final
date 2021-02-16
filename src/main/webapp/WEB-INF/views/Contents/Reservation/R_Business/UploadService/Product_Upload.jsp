<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<link rel="stylesheet" href="/resources/Index/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/resources/Index/jquery-ui-1.12.1/jquery-ui.min.js"></script>
      <script src="/resources/Index/jquery-ui-1.12.1/datepicker-ko.js"></script> 
    <link rel="stylesheet" href="/resources/CSS/CSS_Reservation/product_css/signupstyle.css">

  <style type="text/css">
      body{
        margin-top: 28%; background-color:#f2f2f2;
      }
    </style>

    <script>
    //캘린더 함수
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker1").datepicker();
        $("#datepicker2").datepicker();

    });

    function send(){
      if(member.p_title.value==""){
        alert("観光商品のタイトルを入力してください");
        member.p_tile.focus();
        return false;
      }
      if(member.p_contents.value==""){
        alert("観光商品の内容を入力してください");
        member.p_contents.focus();
        return false;
      }
      if(member.p_indate.value==""){
        alert("出発日を選択してください");
        member.p_indate.focus();
        return false;
      }
      if(member.p_intime.value==""){
        alert("出発時間を入力してください");
        member.p_intime.focus();
        return false;
      }
      if(member.p_outdate.value==""){
        alert("到着日を選択してください");
        member.p_outdate.focus();
        return false;
      }
      if(member.p_outtime.value==""){
        alert("到着時間を入力してください");
        member.p_outtime.focus();
        return false;
      }
      if(member.p_in.value==""){
        alert("搭乗地を入力してください");
        member.p_in.focus();
        return false;
      }
      if(member.p_out.value==""){
        alert("到着地を入力してください");
        member.p_out.focus();
        return false;
      }
      if(member.place.value==0){
          alert("出発地域を選択してください");
          return false;
        }
      if(member.outplace.value==0){
            alert("到着地域を選択してください");
            return false;
        }

      if(member.p_spot.value==""){
          alert("集結地を入力してください");
          member.p_spot.focus(); 
          return false;
        }

      if(member.p_spottime.value==""){
          alert("集結時間を入力してください");
          member.p_spottime.focus();
          return false;
        }

      if(member.p_stopover.value==""){
          alert("下車地を入力してください");
          member.p_stopover.focus();
          return false;
        }
      if(member.p_stoptime.value==""){
          alert("下車時間を入力してください");
          member.p_stoptime.focus();
          return false;
        }
      if(member.p_maxpeople.value==""){
          alert("予約可能人数を入力してください");
          member.p_maxpeople.focus();
          return false;
        }
      if(member.p_price.value==""){
          alert("価格を入力してください");
          member.p_price.focus();
          return false;
        }
      if(isNaN(member.p_price.value)){
          alert("価格は数字だけ入力してください");
          member.p_price.focus();
          return false;
        }
      if(isNaN(member.p_maxpeople.value)){
          alert("予約可能人数は数字だけ入力してください");
          member.p_maxpeople.focus();
          return false;
        }
      
      member.submit();
    }

    //Row 추가
    function add_row(cnt) {
      var my_tbody = document.getElementById('add_p_in');
      // var row = my_tbody.insertRow(0); // 상단에 추가
      var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
	  
      if(my_tbody.rows.length > 4){
        alert("搭乗地は最大五つまでです");
        member.p_in.focus();
        return;
      }else {
    	  member.cnt.value=my_tbody.rows.length+2;	
    	  cell1.innerHTML = "<td><input type='text' name='p_in"+cnt+"' style='width:180px;' required onkeyup='this.setAttribute('value', this.value);' value=''><input type='time' name='p_intime"+cnt+"' style='width:100px;'><input type='button' value='X' style='WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px' onclick='delete_row(member.cnt.value)'></td>";
          cnt--;
      }

    }

    //Row 삭제
    function delete_row(cnt) {
      var my_tbody = document.getElementById('add_p_in');
      if (my_tbody.rows.length < 1) return;
      // my_tbody.deleteRow(0); // 상단부터 삭제
      my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
      
      member.cnt.value=my_tbody.rows.length+1;
      
    }
	
    function add_file(fcnt) {
        var my_tbody = document.getElementById('plus_file');
        // var row = my_tbody.insertRow(0); // 상단에 추가
        var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
       
        if(my_tbody.rows.length > 4){
          alert("パイルは最大五つまでです");
          member.p_file.focus();
          return;
        }else {
             fcnt++;
           cell1.innerHTML = "<td><input type='file' id='p_filename"+fcnt+"' name='p_filename"+fcnt+"' style='width:180px;' required onkeyup='this.setAttribute('value', this.value);' value=''><input type='button' value='X' id='p_button"+fcnt+"' name='p_button' style='WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px' onclick='delete_filerow("+fcnt+")'></td>";
            member.fcnt.value=fcnt;
        }

      }
      //Row 삭제
      function delete_filerow(fcnt) {
        var my_tbody = document.getElementById('plus_file');
        if (my_tbody.rows.length < 1) return;
        // my_tbody.deleteRow(0); // 상단부터 삭제
        $("#p_filename"+fcnt).remove();// 삭제
        $("#p_button"+fcnt).remove();
      }
      
      
      


    </script>

	<section style="margin-top:26%;">	
        <div class="box">
                <center><font size="6">商品アップロード</font></center>
                <br>
                <form name="member" method="post" enctype="multipart/form-data" action="/Reservation/upload_service?b_id=${ b_user.b_id }">
                  <div class="inputBox">
                    <input type="text" name="p_title" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">観光商品タイトル</font></label>
                  </div>

                  <div class="inputBox">
                    <input type="text" name="p_contents" style="width:95%; height:130px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">観光商品内容</font></label>
                  </div>

	              <div class="inputBox" >
                  	<span><font size="4">出発地域</font></span>
                  	
                  	<select name="place" style="height:30px; margin-left: 105px;    ">
                  		<option value="0">地域選択</option>
                  		<option value="1">ソウル/京畿/仁川</option>
                  		<option value="2">江原道</option>
                  		<option value="3">大田/忠清南道/忠淸北道</option>
                  		<option value="4">光州/全羅南道/全羅北道</option>
                  		<option value="5">釜山/大邱/慶尙南道/慶尙北道</option>
                  	</select>
                  
                  </div>
	              
	              <div class="inputBox" id="p_in" style=" margin-top: 30px;">
                          <input type="text" name="p_in" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">搭乗地</font></label>
                          <input type="hidden" name="cnt" value="2">
                          <input type="button" value="地域追加"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_row(member.cnt.value)">
                  </div>
                  
                  <div class="inputBox" >
	                  <input type="text" name="p_indate" id="datepicker1" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                  <label><font size="4">出発日</font></label>
	                  <input type="time" name="p_intime" style="width:180px;" value="">
	              </div>

                  <table>
                    <tbody id="add_p_in" class="inputBox">

                    </tbody>
                  </table>
	              
	              
	              
	              <div class="inputBox">
                  	<span><font size="4">到着地域</font></span>
                  	
                  	<select name="outplace" style="height:30px; margin-left: 105px;">
                  		<option value="0">地域選択</option>
                  		<option value="1">ソウル/京畿/仁川</option>
                  		<option value="2">江原道</option>
                  		<option value="3">大田/忠清南道/忠淸北道</option>
                  		<option value="4">光州/全羅南道/全羅北道</option>
                  		<option value="5">釜山/大邱/慶尙南道/慶尙北道</option>
                  	</select>
                  
                  </div>
	              
	               <div class="inputBox" style="margin-top: 30px;">
                        <input type="text" name="p_out" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="" >
                        <label><font size="4">目的地</font></label>
                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_outdate" id="datepicker2" style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">到着日</font></label>
                        <input type="time" name="p_outtime" style="width:180px;" value="">
                  </div>

                  

                 

                  <div class="inputBox">
                        <input type="text" name="p_spot" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">観光地搭乗地</font></label>
                        <input type="time" name="p_spottime" style="width:180px;" value="">
                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_stopover" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">下車地</font></label>
                        <input type="time" name="p_stoptime" style="width:180px;" value="">
                  </div>

                  <div class="inputBox">
                    <input type="text" name="p_maxpeople" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">最大人数</font></label>
                  </div>

                  <div class="inputBox" >
                    <input type="text" name="p_price" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">価格</font></label>
                  </div>

                  <div class="thema">
                    <span><font size="4">オプション</font></span><br>
                    <span style="margin:60px;"><input type="checkbox" name="thema" value="1">食事可否</span>
                  </div>
                  
                  
                  
                 
                     <div class="inputBox" id="p_file">
                        <input type="file" name="p_filename" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <input type="button" name="0" value="パイル追加"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_file(member.fcnt.value)">
                        <input type="hidden" name="fcnt" value="0">
                  </div>
                  
         <table id="plus_file" class="inputBox">
                    <tbody>
                    </tbody>
            </table>
                 


                  <input type="button" value="登録"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="send();">
                  <input type="reset" value="書き直し"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >

                </form>
        </div>
    </section>      

        
</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</html>
