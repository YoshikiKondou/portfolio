import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "cocoon"
import "cocoon-js-vanilla";
import "select2";
import "bootstrap"

$('.custom-file-input').on('change',function(){
  $(this).next('.custom-file-label').html($(this)[0].files[0].name);
})
//ファイルの取消
$('.reset').click(function(){
  $(this).parent().prev().children('.custom-file-label').html('ファイル選択...');
  $('.custom-file-input').val('');
})

console.log("test");
$('.js-searchable').select2({
  width: 200,
  allowClear: true
});
