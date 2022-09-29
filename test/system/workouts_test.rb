require "application_system_test_case"

class WorkoutsTest < ApplicationSystemTestCase
  setup do
    @workout = workouts(:one)
  end

  test "visiting the index" do
    visit workouts_url
    assert_selector "h1", text: "Workouts"
  end

  test "should create workout" do
    visit workouts_url
    click_on "New workout"

    fill_in "Eat", with: @workout.eat
    fill_in "Fatigue", with: @workout.fatigue
    fill_in "Memo", with: @workout.memo
    fill_in "Mental", with: @workout.mental
    fill_in "Menu", with: @workout.menu
    fill_in "Motivation", with: @workout.motivation
    fill_in "Rep", with: @workout.rep
    fill_in "Set", with: @workout.set
    fill_in "Sleep", with: @workout.sleep
    fill_in "User", with: @workout.user_id
    fill_in "Weight", with: @workout.weight
    click_on "Create Workout"

    assert_text "Workout was successfully created"
    click_on "Back"
  end

  test "should update Workout" do
    visit workout_url(@workout)
    click_on "Edit this workout", match: :first

    fill_in "Eat", with: @workout.eat
    fill_in "Fatigue", with: @workout.fatigue
    fill_in "Memo", with: @workout.memo
    fill_in "Mental", with: @workout.mental
    fill_in "Menu", with: @workout.menu
    fill_in "Motivation", with: @workout.motivation
    fill_in "Rep", with: @workout.rep
    fill_in "Set", with: @workout.set
    fill_in "Sleep", with: @workout.sleep
    fill_in "User", with: @workout.user_id
    fill_in "Weight", with: @workout.weight
    click_on "Update Workout"

    assert_text "Workout was successfully updated"
    click_on "Back"
  end

  test "should destroy Workout" do
    visit workout_url(@workout)
    click_on "Destroy this workout", match: :first

    assert_text "Workout was successfully destroyed"
  end
end
