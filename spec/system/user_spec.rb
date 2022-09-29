require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_path
      end
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 1
          click_button '登録'
          expect(page).to have_content 'ユーザー登録が完了しました'
          expect(current_path).to eq workouts_path
        end
      end
      context '名前が未入力' do
        it 'ユーザーの新規作成が失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 1
          click_button '登録'
          expect(current_path).not_to eq workouts_path
        end
      end
      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 1
          click_button '登録'
          expect(current_path).not_to eq workouts_path
        end
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = FactoryBot.create(:user)
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: existed_user.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 1
          click_button '登録'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).not_to eq workouts_path
        end
      end
    end
  end
  describe 'ログイン後' do
    before { login(user) }
    before do
      page.set_rack_session(user_id: user.id)
      visit edit_user_path(user)
    end
    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 3
          click_button '更新'
          expect(page).to have_content 'ユーザー情報を更新しました'
          expect(current_path).to eq workouts_path
        end
      end
      context '名前が未入力' do
        it 'ユーザーの編集が失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 3
          click_button '更新'
          expect(current_path).not_to eq workouts_path
        end
      end
      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する' do
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 3
          click_button '更新'
          expect(current_path).not_to eq workouts_path
        end
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの編集が失敗する' do
          existed_user = FactoryBot.create(:user)
          fill_in 'user[name]', with: 'name'
          fill_in 'user[email]', with: existed_user.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          execute_script("window.scroll(0,10000);")
          sleep 3
          click_button '更新'
          expect(current_path).not_to eq workouts_path
        end
      end
      context '他ユーザーの編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する' do
          other_user = FactoryBot.create(:user)
          expect(current_path).to eq edit_user_path(user)
        end
      end
    end
  end
end
