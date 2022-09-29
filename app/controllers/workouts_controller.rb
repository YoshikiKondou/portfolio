class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :show, :update, :destroy]
  before_action :set_user_id

  def index
    @workouts = Workout.where(user_id: session[:user_id]).order(start_time: "DESC").includes(:workout_menus)
    @workouts = Workout.where(user_id: session[:user_id]).where('part LIKE(?)', "%#{params[:search]}%").order(start_time: "DESC") if params[:search].present?
  end

  def show
  end

  def new
    @workout = Workout.new
    @workout_menus = @workout.workout_menus.build
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:success] = "トレーニングを記録しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "トレーニングの記録ができませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      flash[:success] = "トレーニング内容を更新しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "トレーニング内容を更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    flash[:success] = "トレーニングを削除しました"
    redirect_to("/workouts")
  end

  def graph
    @search_params = workout_search_params
    @workouts = Workout.where(user_id: @user.id).search(@search_params).joins(:workout_menus)
    @menu_search = @search_params.present?
    @workout_by_day = @workouts.group("date(start_time)")
    @chartlabels = @workout_by_day.size.map(&:first).to_json.html_safe
    @sleepdata = @workout_by_day.sum(:sleep).map(&:second).to_json.html_safe
    @eatdata = @workout_by_day.sum(:eat).map(&:second).to_json.html_safe
    @motivationdata = @workout_by_day.sum(:motivation).map(&:second).to_json.html_safe
    @fatiguedata = @workout_by_day.sum(:fatigue).map(&:second).to_json.html_safe
    @muscledata = @workout_by_day.sum(:muscle).map(&:second).to_json.html_safe
    @workouts_by_day = @workouts.includes(:workout_menus).group("date(start_time)")
    @totalvolume = @workouts_by_day.sum("first_set_weight * first_set_rep").map(&:second).to_json.html_safe
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def set_user_id
      @user = User.find(session[:user_id])
    end

    def workout_params
      params.require(:workout).permit(
        :start_time,
        :part,
        :memo,
        :sleep,
        :eat,
        :motivation,
        :fatigue,
        :muscle,
        workout_menus_attributes: [:menu, :first_set_weight, :second_set_weight, :third_set_weight, :fourth_set_weight, :fifth_set_weight, :first_set_rep, :second_set_rep, :third_set_rep, :fourth_set_rep, :fifth_set_rep, :_destroy, :id]
      ).merge(user_id: session[:user_id])
    end

    def workout_search_params
      params.fetch(:search, {}).permit(
        :from_start_time,
        :to_start_time,
        workout_menus: [:menu]
      )
    end
end
