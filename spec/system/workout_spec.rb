require 'rails_helper'

RSpec.describe 'Workout', type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:workout) { create(:workout) }
  describe 'トレーニング新規登録' do
    before do
      page.set_rack_session(user_id: user.id)
      visit new_workout_path
    end
    context 'フォームの入力値が正常' do
      it '体重・カロリーの新規作成が成功する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(page).to have_content 'トレーニングを記録しました'
        expect(current_path).to eq workouts_path
      end
    end
    context '日付が未入力' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: ''
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '部位が未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        have_no_select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context 'トレーニングメニューが未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        have_no_select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '1st setの重量が未入力' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: ''
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '1st setの回数が未入力' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: ''
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '睡眠が未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        have_no_select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '食事が未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        have_no_select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context 'モチベーションが未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        have_no_select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '疲労が未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        have_no_select 1, from: 'workout[fatigue]'
        select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
      end
    end
    context '筋肉の状態が未選択' do
      it 'トレーニングの記録が失敗する' do
        fill_in 'workout[start_time]', with: '002020-10-06-10-06'
        select '背中', from: 'workout[part]'
        select 'チンニング', from: 'workout-menu'
        fill_in 'workout-first_set-weight', with: '10'
        fill_in 'workout-first_set-rep', with: '10'
        select 1, from: 'workout[sleep]'
        select 1, from: 'workout[eat]'
        select 1, from: 'workout[motivation]'
        select 1, from: 'workout[fatigue]'
        have_no_select 1, from: 'workout[muscle]'
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_button '記録する'
        expect(current_path).not_to eq workouts_path
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
      page.set_rack_session(user_id: user.id)
      visit new_diet_path
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
    context 'ページ遷移' do
      it '編集ボタンを押すと体重・カロリー編集ページに遷移する' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_on '編集'
        expect(current_path).to eq edit_diet_path(diet)
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
  end
end
