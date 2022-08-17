require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録が完了しました'
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
          expect(current_path).not_to eq workouts_path
          expect(page).to have_field 'user[email]', with: existed_user.email
        end
      end
    end
  end
 
  describe 'ログイン後' do
    before { login(user) }
    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit edit_user_path(user.id)
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: 'update@example.com'
          fill_in 'user[password]', with: 'update_password'
          fill_in 'user[password_confirmation]', with: 'update_password'
          click_button '更新'
          expect(page).to have_content('ユーザー情報を更新しました')
          expect(current_path).to eq workouts_path
        end
      end
      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する'
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの編集が失敗する'
      end
      context '他ユーザーの編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する'
      end
    end
 
    describe 'マイページ' do
      context 'タスクを作成' do
        it '新規作成したタスクが表示される'
      end
    end
  end
end