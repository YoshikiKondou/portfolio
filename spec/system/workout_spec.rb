require 'rails_helper'

RSpec.describe 'Workout', type: :system do
  let(:user) { create(:user) }
  let!(:workout) { create(:workout) }
  let!(:other_workout) { create(:other_workout) }
  describe 'トレーニング新規登録' do
    before do
      page.set_rack_session(user_id: user.id)
      visit new_workout_path
    end
    context 'フォームの入力値が正常' do
      it 'トレーニングの新規作成が成功する' do
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
  describe 'トレーニングメニュー編集' do
    before do
      page.set_rack_session(user_id: user.id)
      visit edit_workout_path(workout)
    end
    context 'フォームの入力値が正常' do
      it 'トレーニングの編集が成功する' do
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
        expect(page).to have_content 'トレーニング内容を更新しました'
        expect(current_path).to eq workouts_path
      end
    end
    context'日付が未入力' do
      it 'トレーニングの編集が失敗' do
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
  describe "トレーニング一覧ページ" do
    before do
      page.set_rack_session(user_id: Workout.last.user_id)
      visit workouts_path
    end
    context 'ページ遷移' do
      it '確認ボタンを押すとトレーニング詳細ページに遷移する' do
        execute_script("window.scroll(0,10000);")
        sleep 5
        click_on '確認'
        expect(current_path).to eq workout_path(other_workout.id)
      end
      it '編集ボタンを押すとトレーニング編集ページに遷移する' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        click_on '編集'
        expect(current_path).to eq edit_workout_path(other_workout.id)
      end
      it '削除ボタンを押すとトレーニングを削除できる' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        page.dismiss_confirm("本当に削除しますか？") do
        click_on '削除'
        end
        expect(current_path).to eq workouts_path
      end
    end
    context 'データ数' do
      let!(:workout) { create(:workout, user_id: user.id) }
      let!(:other_workout) { create(:other_workout, user_id: user.id) }
      it 'データ数が２つである' do
        execute_script("window.scroll(0,10000);")
        sleep 3
        expect(page.all('.start_time').count).to eq 2
      end
      it 'トレーニングが表示されないこと' do
        select '脚', from: 'search'
        click_on '部位で絞り込む'
        expect(page).to have_content 'トレーニング履歴はありません'
      end
      it 'トレーニングが表示されること' do
        select '胸', from: 'search'
        click_on '部位で絞り込む'
        expect(page).to have_selector 'div', text: 'ベンチプレス'
      end
    end
  end
  describe "記録推移ページ" do
    before do
      page.set_rack_session(user_id: Workout.last.user_id)
      visit workouts_graph_path
    end
    context "グラフ表示" do
      it 'グラフにデータが反映されていること' do
        select 'ベンチプレス', from: '種目'
        fill_in 'search[from_start_time]', with: '002020-10-01-10-06'
        fill_in 'search[to_start_time]', with: '002020-10-31-10-06'
        click_on '重量推移を見る'
        sleep 3
      end
    end
    context "重量×回数" do
      it 'トレーニングの1set目の重量×回数がtotal_volumeと等しいこと' do
        select 'ベンチプレス', from: '種目'
        fill_in 'search[from_start_time]', with: '002020-10-01-10-06'
        fill_in 'search[to_start_time]', with: '002022-10-31-10-06'
        click_on '重量推移を見る'
        totalvolume = page.find('#volume')['data-volume']
        expect(totalvolume).to eq "[500.0]"
      end
    end
  end
end
