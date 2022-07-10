import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "cocoon"

function addForm(){
  console.log("test");
  let html = '<div class="field form-row"><label for="workout_menu">種目：</label><select name="workout[workout_menus][][menu]" id="workout_menu"><option value="">選択して下さい</option><option value="ベンチプレス">ベンチプレス</option><option value="スクワット">スクワット</option><option value="デッドリフト">デッドリフト</option><option value="バーベルカール">バーベルカール</option><option value="フレンチプレス">フレンチプレス</option><option value="ショルダープレス">ショルダープレス</option></select></div><div class="field form-row addition"><label for="workout_weight">重量：</label><input autocomplete="weight" name="workout[workout_menus][][weight]" id="workout_weight" type="number"> kg</div><div class="field form-row addition"><label for="workout_rep">回数：</label><input autocomplete="rep" name="workout[workout_menus][][rep]" id="workout_rep" type="number"> 回</div><div class="field form-row"><label for="workout_rep">セット数：</label><input autocomplete="set" name="workout[workout_menus][][set]" type="number" id="workout_rep"> セット</div>'
  
  let form_list = document.getElementById("form_list")
  form_list.insertAdjacentHTML('beforeend', html);
}

document.getElementById("add_form_btn").addEventListener("click", addForm, false);
