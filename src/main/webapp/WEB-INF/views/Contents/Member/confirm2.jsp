<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>약관동의</title>

   <style type="text/css">
        #d1{
          width:870px;
          margin:0 auto;
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
</head>


<body>
<form action="/MemberServlet?command=member_write" method="post" id="form1">
<div id="d1">
 <font size="6">
 <h2 align="center">SignUp</h2>
</font>

  <tr>
      <h1>
         <center>
   <td align="left"><font size="4">
       利用約款, 個人情報 収集 など 必修同意 項目に すべて 同意します
   <input type="checkbox" name="all" id="all" style="width:25px;height:25px;"><hr/></h3>
 </center>
    </font>
    </td>
  </tr>
 <div id="accordion">

       <center>
          <font size="4">
          個人情報扱い方針 利用約款 同意 (必修)
       </font><input type="checkbox" name="c1" id="c1"/ style="width:20px;height:20px;"></a></h3>

       </center>
       <center>
          <textarea readonly="readonly" rows="8" cols="66">
第 1 条 (目的)

本約款は、ここ観光株式会社("会社"または"ここ観光")が提供するここ観光及び여기관광関連の諸サービスの利用に関して、会社と会員との権利、義務及び責任事項、その他必要な事項を規定することを目的とします。


第 2 条 (定義)

この約款で使用する用語の定義は次のようです。
①"サービス"とは、実装される端末機(PC、TV、携帯型端末機などの各種の有・無線装置を含む)とは関係なく、"会員"が利用できるここに観光及びここに観光関連の諸サービスを意味します。
②"会員"とは、会社の"サービス"に接続して、この約款に基づき、"会社"と利用契約を締結して"会社"が提供する"サービス"を利用する顧客を話します。
③"・アイディ(ID)"とは、"会員"の識別と"サービス"利用のため、"会員"が定めて"会社"が承認する文字と数字の組み合わせを意味します。
④"パスワード"とは、"会員"が付与された"ハンドルネームと一致される"会員"であることを確認して秘密の保護のため、"会員"自分が定めた文字や数字の組み合わせを意味します。
⑤"有料サービス"とは、"会社"が有料で提供する各種オンライン・デジタル・コンテンツ(各種情報・コンテンツ、VOD、アイテムその他有料コンテンツを含む)、及び各般サービスを意味します。
⑥"ポイント"とは、サービスの効率的利用のため、会社が任意に策定または支給、調整し得る財産的価値がない"サービス"上の仮想データを意味します。
⑦"掲示物"とは、"会員"が"サービス"を利用するに当たって、"サービス上"に掲示した符号ㆍ文字ㆍ音声ㆍ音響ㆍ画像ㆍ動画などの情報の形の文や写真、動画や各種ファイルとリンクなどを意味します。
    </textarea>
       <center>
       <br>

          <font size="4">個人情報 収集 ・ 利用に ついて 案内 (必修)
          </font><input type="checkbox" name="c2" id="c2"/ style="width:20px;height:20px;"></a></h3>
      </center>
   <div>
       <center>
     <textarea readonly="readonly" rows="8" cols="66">
※規定によりこちらの観光に会員登録を申請される方に収集する個人情報の項目、個人情報の収集及び利用目的、個人情報の保有及び利用期間をご案内いたしますので、詳しくお読みの上、同意ください。


1. 収集する 個人情報

利用者は会員加入をしなくても情報検索、ニュースを見たりなどほとんどの列記観光サービスを会員と同一に利用することができます。 利用者がメール、カレンダー、カフェやブログなどと一緒に個人化あるいは会員制サービスを利用するため、会員加入をする場合、ここグヮングヮンヌンサービス利用のために必要な最小限の個人情報を収集します。
   </textarea>
    </center>
   <br>
   </div>

    <center>
          <font size="4">情報 利用約款 同意 (選択)
       </font><input type="checkbox" name="c3" id="c3"/ style="width:20px;height:20px;"></center></a>
   <div>
       <center>
     <textarea readonly="readonly" rows="8" cols="66">

位置情報利用約款に同意すると、位置を活用した広告情報受信などを含むここに観光位置基盤サービスを利用することができます。


第 1 条 (目的)
本約款は、こちらの観光株式会社(以下、"会社"という。)が提供する位置情報サービス事業または位置基盤サービス事業に関して、会社と個人位置情報主体との権利、義務及び責任事項、その他必要な事項を規定することを目的とします。


第 2 条 (約款 外 準則)
この約款に明記されていない事項は位置情報の保護および利用などに関する法律、情報通信網利用促進及び情報保護などに関する法律、電気通信基本法、電気通信事業法など関係法令や会社の利用約款と個人情報取扱方針、会社が別途に定めた指針等によります。


第 3 条 (サービス 内容 ・ 料金)
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
   <td align="left"><font size="4"> イベント など プロモーション お知らせ メール 受信 (選択)</font>
    </td>
   <td><input type="checkbox" name="c4" id="c4" style="width:20px;height:20px;"></td><hr/>
    </center>
  </tr>

  <br>
 <div align="center">
  <input type="submit" value="同意します"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >
  <input type="reset" value="同意しません" style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >
 </div>
   <br>
</div>

</form>

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
    alert('利用同意 約款に 同意してないです');
    return false;
   }
   if ( !form1_data['c2'] ) {
    alert('個人情報 収集 ・ 利用に ついて 案内に 同意してないです');
    return false;
   }
   this.submit();
  };
</script>
</body>
</html>