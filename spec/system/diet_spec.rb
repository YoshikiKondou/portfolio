require 'rails_helper'

RSpec.describe 'Diets', type: :system do
  describe '体重・カロリー新規登録' do
    context 'フォームの入力値が正常' do
      it '体重・カロリーの新規作成が成功する' do
        visit new_diet_path
        fill_in 'diet[body_weight]', with: '50'
        fill_in 'diet[protein]', with: '50'
        fill_in 'diet[fat]', with: '50'
        fill_in 'diet[carbonhydrate]', with: '50'
        click_button '記録する'
        expect(page).to have_content '体重・カロリーを記録しました'
        expect(current_path).to eq workouts_path
      end
    end

    context '名前が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: 'email@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録'
        expect(current_path).not_to eq workouts_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'user[name]', with: 'name'
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録'
        expect(current_path).not_to eq workouts_path
      end
    end

    context '登録済のメールアドレスを使用' do
      it 'ユーザーの新規作成が失敗する' do
        existed_user = FactoryBot.create(:user)
        visit new_user_path
        fill_in 'user[name]', with: 'name'
        fill_in 'user[email]', with: existed_user.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(current_path).not_to eq workouts_path
      end
    end
  end
end
