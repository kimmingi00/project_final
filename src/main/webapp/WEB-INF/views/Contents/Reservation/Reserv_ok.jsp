<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


   <style type="text/css">
        #d1{
          width:870px;
          margin:0 auto;
        }
        
        section {background-color:#fff; font-color:black; margin-left: 220px; margin-top:7%;
        		width:1300px; height:800px;
        	 }
        

    </style>

  <script>
  $(function() {
    $( "#accordion" ).accordion();
    $('#accordion input[type="checkbox"]').click(function(e) {
        e.stopPropagation();
    });
  });
  </script>

<section>
<form action="Reserv_unregit" method="post" id="form1" name="fm">
<div id="d1">
 <font size="6">
 <h2 align="center">予約利用約款</h2>
 <input type="hidden" name="p_idx" value="${p_idx }">
 <input type="hidden" name="reserv_cnt" value="${reserv_cnt }"}>
</font>

  <tr>
      <h1 style="color:black; float:none; line-height:100px;">
         <center>
   <td align="left"><font size="4">
       利用規約、個人情報収集など必須同意項目にすべて同意します。
   <input type="checkbox" name="all" id="all" style="width:25px;height:25px;"><hr/></h3>
 </center>
    </font>
    </td>
  </tr>
 <div id="accordion">

       <center>
          <font size="4">
          個人情報取扱方針の利用約款に同意(必須)
       </font><input type="checkbox" name="c1" id="c1"/ style="width:20px;height:20px;"></a></h3>

       </center>
       <center>
          <textarea readonly="readonly" rows="8" cols="66">
第1条(目的)

この約款は、ネイバー株式会社("会社"または"ネイバー")が提供しているネイバーやネイバーの関連サービスの利用と関連し、会社と会員との権利、義務や責任事項、その他必要な事項を規定することを目的とします。


第2条(定義)

本約款で使用する用語の定義は以下のとおりです。
※"サービス"とは、実装される端末(PC、TV、携帯型端末などの各種有線·無線装置を含む)に関わらず、"会員"が利用できるネイバー及びネイバー関連の諸サービスを意味します。
※"会員"とは、会社の"サービス"にアクセスし、本約款に基づいて"会社"と利用契約を締結し、"会社"が提供する"サービス"を利用するお客様のことをいいます。
※"ID"とは、"会員"の識別と"サービス"利用のために"会員"が定め、"会社"が承認する文字と数字の組み合わせを意味します。
※"パスワード"とは、"会員"が付与された"IDと一致する"会員"であることを確認し、パスワードのために"会員"自身が定めた文字または数字の組み合わせを意味します。
"有料サービス"とは、"会社"が有料で提供する各種オンラインデジタルコンテンツ(各種情報コンテンツ、VOD、アイテムその他有料コンテンツを含む)及び諸般サービスを意味します。
※"ポイント"とは、サービスの利用のために会社が任意に策定または支給、調整できる財産的価値のない"サービス"上の仮想データを意味します。
※"掲示物"とは、"会員"が"サービス"を利用するに当たり、"サービス上"に掲示した符号·文字·音声·音響·画像·動画などの情報形態の文、写真、動画及び各種ファイルとリンクなどを意味します。
    </textarea>
       <center>
       <br>

          <font size="4">個人情報の収集及び利用に関するご案内(必須)
          </font><input type="checkbox" name="c2" id="c2"/ style="width:20px;height:20px;"></a></h3>
      </center>
   <div>
       <center>
     <textarea readonly="readonly" rows="8" cols="66">
情報通信網法の規定によって、ネイバーに会員入会の申し込みの方に収集する個人情報の項目、個人情報の収集及び利用目的、個人情報の保有及び利用期間をご案内いたしますのでご詳しく読んだ後同意してください。


1.、収集する個人情報

利用者は会員加入をしなくても情報検索、ニュースを見たりなどほとんどのネイバーサービスを会員と同一に利用することができます。 利用者がメール、カレンダー、カフェやブログなどと一緒に個人化あるいは会員制サービスを利用するため、会員加入をする場合、ネイバーはサービスの利用をために必要な最低限の個人情報を収集します。
   </textarea>
    </center>
   <br>
   </div>

    <center>
          <font size="4">位置情報利用約款の同意(選択)
       </font><input type="checkbox" name="c3" id="c3"/ style="width:20px;height:20px;"></center></a>
   <div>
       <center>
     <textarea readonly="readonly" rows="8" cols="66">

位置情報利用約款に同意すると、位置を活用した広告情報受信などを含めているネイバーの位置基盤サービスを利用することができます。


第1条(目的)
この約款は、ネイバー株式会社(以下"会社")が提供する位置情報事業、または位置基盤サービス事業と関連し、会社と個人位置情報主体との権利、義務や責任事項、その他必要な事項を規定することを目的とします。


第2条(約款のほか準則)
この約款に明記されていない事項は位置情報の保護および利用などに関する法律、情報通信網利用促進及び情報保護などに関する法律、電気通信基本法、電気通信事業法など関係法令や会社の利用約款と個人情報取扱方針、会社が別途に定めた指針等によります。


第3条(サービス内容及び料金)
①会社は直接位置情報を収集したり、位置情報事業者の移動通信会社から位置情報を受け取り、下記のような位置基盤サービスを提供します。 1.Geo Taggingサービス:書き込みの登録時点の個人位置情報主体の位置情報を掲示書き込みと共に保存します。
2.位置情報を活用した検索結果提供サービス:情報検索を要請したり、個人位置情報主体または移動性のある機器の位置情報を提供時、本の位置情報を利用した検索結果や周辺の結果(美味しい店、周辺業者、交通手段など)を提示します。
3.位置情報を活用した友達探しや友だちを作る:現在位置を活用して友達を探してくれたり、友人を推薦してくれます。
4.連絡先交換すること:位置情報を活用して友達と連絡先を交換することができます。
5.現在位置を活用した広告情報提供サービス:広告情報提供要請の際、個人位置情報主体の現在の位置を利用して広告素材を提示します。
6.利用者保護及び不正利用防止:個人位置情報主体または移動性のある機器の位置を利用して権限のない者の非正常的なサービス利用の動きなどを遮断します。
 </textarea>
</center>
   </div>
 </div>

<br>
  <tr>
      <center>
   <td align="left"><font size="4"> イベントなどプロモーション通知メール受信(選択)</font>
    </td>
   <td><input type="checkbox" name="c4" id="c4" style="width:20px;height:20px;"></td><hr/>
    </center>
  </tr>

  <br>
 <div align="center">
  <input type="submit" value="同意する"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >
  <input type="reset" value="同意しない" style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >
 </div>
   <br>
</div>

</form>
</section>
<!-- 체크박스 이벤트처리 -->
<script>
var doc = document;
  var form1 = doc.getElementById('form1');
  var inputs = form1.getElementsByTagName('INPUT');
  var form1_data = {
   "c1": false,
   "c2": false,
   "c3": false
  };
  var c1 = doc.getElementById('c1');
  var c2 = doc.getElementById('c2');
  var c3 = doc.getElementById('c3');
  function checkboxListener() {
   form1_data[this.name] = this.checked;
  }
   c1.onclick = c2.onclick = c3.onclick = checkboxListener;
   var all = doc.getElementById('all');
   all.onclick = function() {  //전체 체크를 누를 시 모든 체크박스 활성화
    if (this.checked) {
     setCheckbox(form1_data, true);
    } else {
     setCheckbox(form1_data, false);
    }
   };
   function setCheckbox(obj, state) {
    for (var x in obj) {
     obj[x] = state;
     for(var i = 0; i < inputs.length; i++) {
      if(inputs[i].type == "checkbox") {
       inputs[i].checked = state;
      }
     }

    }
   }
  form1.onsubmit = function(e) {
   e.preventDefault();
   if ( !form1_data['c1'] ) {
    alert('利用同意約款に同意してないです');
    return false;
   }
   if ( !form1_data['c2'] ) {
    alert('個人情報収集及び利用に同意してないです');
    return false;
   }
   location.href='Reserv_unregit?p_idx='+fm.p_idx.value+'&reserv_cnt='+fm.reserv_cnt.value;
   //this.submit();
  };
</script>
</body>
</html>