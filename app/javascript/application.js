import "@hotwired/turbo-rails"
import "controllers"
function addForm(){
  console.log("test");
  let html = '<div class="field form-row"><label for="workout_menu">種目：</label><select name="workout[menu]" id="workout_menu"><option value="">選択して下さい</option><option value="ベンチプレス">ベンチプレス</option><option value="スクワット">スクワット</option><option value="デッドリフト">デッドリフト</option><option value="バーベルカール">バーベルカール</option><option value="フレンチプレス">フレンチプレス</option><option value="ショルダープレス">ショルダープレス</option></select></div><div class="field form-row addition"><label for="workout_weight">重量：</label><input autocomplete="weight" name="workout[weight]" id="workout_weight" type="number"> kg</div><div class="field form-row addition"><label for="workout_rep">回数：</label><input autocomplete="rep" name="workout[rep]" id="workout_rep" type="number"> 回</div><div class="field form-row"><label for="workout_set">セット数：</label><select name="workout[set]" id="workout_set"><option value="">選択して下さい</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select> セット</div>'
  
  let form_list = document.getElementById("form_list")
  form_list.insertAdjacentHTML('beforeend', html);
}

document.getElementById("add_form_btn").addEventListener("click", addForm, false);
