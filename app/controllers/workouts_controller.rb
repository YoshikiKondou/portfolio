class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :show, :update, :destroy]
  

  def index
    @workouts = Workout.where(user_id: session[:user_id]).order(start_time: "desc").includes(:workout_menus)
    @workouts = Workout.where('part LIKE(?)', "%#{params[:search]}%") if params[:search].present?
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
    if @workout.save!
      flash[:success] = "トレーニングを記録しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "トレーニングの記録ができませんでした"
      render :new
    end
  end

  def update
    if @workout.update(update_workout_params)
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
    @menu_search = params.dig(:workout_menus, :search).present?
    @workouts = Workout.all
    @workouts = Workout.eager_load(:workout_menus).where('workout_menus.menu LIKE(?)', "%#{params[:workout_menus][:search]}%") if params.dig(:workout_menus, :search).present?
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

  def body_weight_graph
    @workouts = Workout.all
    @workout_by_day = @workouts.group("date(start_time)")
    @chartlabels = @workout_by_day.size.map(&:first).to_json.html_safe
    @bodyweightdata = @workout_by_day.sum(:body_weight).map(&:second).to_json.html_safe
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
        :body_weight,
        :part,
        :memo,
        :sleep,
        :eat,
        :motivation,
        :fatigue,
        :muscle,
        workout_menus_attributes: [:menu, :first_set_weight, :second_set_weight, :third_set_weight, :fourth_set_weight, :fifth_set_weight, :first_set_rep, :second_set_rep, :third_set_rep, :fourth_set_rep, :fifth_set_rep, :_destroy]
      ).merge(user_id: session[:user_id])
    end

    def update_workout_params
      params.require(:workout).permit(
        :start_time,
        :body_weight,
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
end
