class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :show, :update, :destroy]
  before_action :set_login_user

  def index
    @workouts = Workout.where(user_id: session[:user_id]).order(start_time: "desc")
  end

  def show
  end

  def new
    @workout = Workout.new
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
      render :new
    end
  end

  def update
    if @workout.update(workout_params)
      flash[:success] = "トレーニング内容を更新しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "トレーニング内容を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @workout.destroy
    flash[:success] = "トレーニングを削除しました"
	  redirect_to("/workouts")
  end

  def graph
    @workouts = Workout.all
    @workouts = Workout.where('workouts.menu LIKE(?)', "%#{params[:search]}%") if params[:search].present?
    @workout_by_day = @workouts.group("date(start_time)")
    @chartlabels = @workout_by_day.size.map(&:first).to_json.html_safe
    @sleepdata = @workout_by_day.sum(:sleep).map(&:second).to_json.html_safe
    @eatdata = @workout_by_day.sum(:eat).map(&:second).to_json.html_safe
    @motivationdata = @workout_by_day.sum(:motivation).map(&:second).to_json.html_safe
    @fatiguedata = @workout_by_day.sum(:fatigue).map(&:second).to_json.html_safe
    @mentaldata = @workout_by_day.sum(:mental).map(&:second).to_json.html_safe
    @totalvolume = @workout_by_day.sum("weight * rep").map(&:second).to_json.html_safe
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
        :memo,
        :sleep,
        :eat,
        :motivation,
        :fatigue,
        :mental,
        :start_time,
        workout_menus: [%w(menu weight rep set)]
      ).merge(user_id: session[:user_id])
    end
end
