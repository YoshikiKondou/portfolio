require 'rails_helper'

RSpec.describe 'Diets', type: :system do
  let(:user) { create(:user) }
  let!(:diet) { create(:diet) }
  let!(:other_diet) { create(:other_diet) }
  describe '体重・カロリー新規登録' do
    before do
      page.set_rack_session(user_id: user.id)
      visit new_diet_path
    end
    context 'フォームの入力値が正常' do
      it '体重・カロリーの新規作成が成功する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '記録する'
        expect(page).to have_content '体重・カロリーを記録しました'
        expect(current_path).to eq diets_path
      end
    end
    context '日付が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: ''
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '体重が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: ''
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context 'タンパク質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: ''
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '脂質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '炭水化物が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
  end
  describe '体重・カロリー編集' do
    before do
      page.set_rack_session(user_id: user.id)
      visit edit_diet_path(diet)
    end
    context 'フォームの入力値が正常' do
      it 'ユーザーの編集が成功する' do
        fill_in 'diet[record_time]', with: '002020-10-10-10-10'
        fill_in 'diet[body_weight]', with: '100'
        fill_in 'diet[protein]', with: '100'
        fill_in 'diet[fat]', with: '100'
        fill_in 'diet[carbohydrate]', with: '100'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '変更する'
        expect(page).to have_content '体重・カロリーを更新しました'
        expect(current_path).to eq diets_path
      end
    end
    context'日付が未入力' do
      it 'ユーザーの編集が失敗' do
        fill_in 'diet[record_time]', with: ''
        fill_in 'diet[body_weight]', with: '100'
        fill_in 'diet[protein]', with: '100'
        fill_in 'diet[fat]', with: '100'
        fill_in 'diet[carbohydrate]', with: '100'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '変更する'
        expect(current_path).not_to eq diets_path
      end
    end
    context 'タンパク質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: ''
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '変更する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '脂質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '変更する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '炭水化物が未入力' do
      it '体重・カロリーの記録が失敗する' do
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 1
        click_button '変更する'
        expect(current_path).not_to eq diets_path
      end
    end
  end
  describe "体重推移ページ" do
    before do
      page.set_rack_session(user_id: Diet.last.user_id)
      visit diets_path
    end
    context 'ページ遷移' do
      it '編集ボタンを押すと体重・カロリー編集ページに遷移する' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_on '編集'
        expect(current_path).to eq edit_diet_path(other_diet.id)
      end
      it '削除ボタンを押すと体重・カロリーデータを削除できる' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        page.dismiss_confirm("本当に削除しますか？") do
          click_on '削除'
        end
        expect(current_path).to eq diets_path
      end
    end
    context 'データ数' do
      let!(:diet) { create(:diet, user_id: user.id) }
      let!(:other_diet) { create(:other_diet, user_id: user.id) }
      it 'データ数が２つである' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        expect(page.all('.record_time').count).to eq 2
      end
    end
    context 'データ表示' do
      it 'データが表示されていないこと' do
        fill_in 'search[from_record_time]', with: '002010-10-01-10-06'
        fill_in 'search[to_record_time]', with: '002010-10-31-10-06'
        click_on '期間を絞り込む'
        sleep 1
        execute_script("window.scroll(0,10000);")
        sleep 3
        expect(page).to have_content '入力履歴はありません'
      end
      it 'データが表示されていること' do
        fill_in 'search[from_record_time]', with: '002022-8-01-10-06'
        fill_in 'search[to_record_time]', with: '002022-9-30-10-06'
        click_on '期間を絞り込む'
        sleep 1
        execute_script("window.scroll(0,10000);")
        sleep 3
        expect(page).to have_selector 'div', text: 'タンパク質'
      end
    end
  end
end
