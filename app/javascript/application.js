import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "cocoon"
import "cocoon-js-vanilla";
import "bootstrap"
import "select2";

//画像選択、ファイル取り消し
$('.custom-file-input').on('change',function(){
  $(this).next('.custom-file-label').html($(this)[0].files[0].name);
})
//ファイルの取消
$('.reset').click(function(){
  $(this).parent().prev().children('.custom-file-label').html('ファイル選択...');
  $('.custom-file-input').val('');
})

//動的form作成時のselect2適応
$('#select-field').select2({
  theme: 'bootstrap-5'
});


$('#select-field').on('cocoon:after-insert', function(e, insertedItem) {
  $(insertedItem).addClass('select2-hidden-accessible');
});

//画像拡大時の動作
$(".course-item img").click(function () {
  // まず、クリックした画像の HTML(<img>タグ全体)を#frayDisplay内にコピー
  $("#grayDisplay").html($(this).prop("outerHTML"));
  //そして、fadeInで表示する。
  $("#grayDisplay").fadeIn(200);
  return false;
});

// コース画像モーダル非表示イベント
// モーダル画像背景 または 拡大画像そのものをクリックで発火
$("#grayDisplay").click(function () {
  // 非表示にする
  $("#grayDisplay").fadeOut(200);
  return false;
});

//バリテーション
(function () {
  var forms = document.querySelectorAll('.needs-validation');
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  })
})();

//カロリー計算機能

const P1 = document.getElementById('P1');
const F1 = document.getElementById('F1');
const C1 = document.getElementById('C1');
const X = document.getElementById('X');

P1.addEventListener('input', () => {
  P2.textContent = Number(P1.value) * 4;
});

F1.addEventListener('input', () => {
  F2.textContent = Number(F1.value) * 9;
});

C1.addEventListener('input', () => {
  C2.textContent = Number(C1.value) * 4;
});
    
const inputs = document.querySelectorAll('input');

inputs.forEach(input => {
  input.addEventListener('input', () => {
    X.textContent = Number(P1.value) * 4 + Number(F1.value) * 9 + Number(C1.value) * 4;
  });
});

//電卓

function clickbutton(target) {
  let result = document.getElementById("result");
  let target_value = target.innerHTML;
  const operator = ["+", "-", "*", "/", "."];
  
  if (target_value == "AC") {
      result.innerHTML = "0";
  } else if (target_value == "=") {
        result.innerHTML = eval(result.innerHTML);
  } else {
    if (operator.includes(target_value) && operator.includes(result.innerHTML.slice(-1))) return
    if (result.innerHTML == "0") {
        result.innerHTML = target_value;
    } else if (result.innerHTML == "00") {
        result.innerHTML = target_value;
    } else if (result.innerHTML == "+") {
        result.innerHTML = target_value;
    } else if (result.innerHTML == "*") {
        result.innerHTML = target_value;     
    } else if (result.innerHTML == ".") {
        result.innerHTML = eval("0." + target_value);
    } else {
        result.innerHTML += target_value; 
    }
  }
}
