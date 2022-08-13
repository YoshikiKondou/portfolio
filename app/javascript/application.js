import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "cocoon"
import "cocoon-js-vanilla";
import "bootstrap"
import "select2";

$('.custom-file-input').on('change',function(){
  $(this).next('.custom-file-label').html($(this)[0].files[0].name);
})
//ファイルの取消
$('.reset').click(function(){
  $(this).parent().prev().children('.custom-file-label').html('ファイル選択...');
  $('.custom-file-input').val('');
})

$('#select-field').select2({
  theme: 'bootstrap-5',
});

$('#workout_menus').on('cocoon:after-insert', function() {
  $('#select-field').select2({
    theme: 'bootstrap-5',
  }); 
});

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
