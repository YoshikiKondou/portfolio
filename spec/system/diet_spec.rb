require 'rails_helper'

RSpec.describe 'Diets', type: :system do
  describe '体重・カロリー新規登録' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    context 'フォームの入力値が正常' do
      it '体重・カロリーの新規作成が成功する' do
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(page).to have_content '体重・カロリーを記録しました'
        expect(current_path).to eq diets_path
      end
    end
    context '日付が未入力' do
      it '体重・カロリーの記録が失敗する' do
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
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
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: ''
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context 'タンパク質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: ''
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '脂質が未入力' do
      it '体重・カロリーの記録が失敗する' do
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
    context '炭水化物が未入力' do
      it '体重・カロリーの記録が失敗する' do
        page.set_rack_session(user_id: user.id)
        visit new_diet_path
        fill_in 'diet[record_time]', with: '002020-10-06-10-06'
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: ''
        fill_in 'diet[carbohydrate]', with: '50'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq diets_path
      end
    end
  end
end
