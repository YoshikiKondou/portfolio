class DietsController < ApplicationController
  before_action :set_diet, only: [:edit, :update, :destroy]
  before_action :set_user_id

  def index
    @diets = Diet.all
    @diet_by_day = @diets.group("date(record_time)")
    @chartlabels = @diet_by_day.size.map(&:first).sort { |a,b| a <=> b }.to_json.html_safe
    @proteindata = @diet_by_day.sum("protein * 4").map(&:second).to_json.html_safe
    @fatdata = @diet_by_day.sum("fat * 9").map(&:second).to_json.html_safe
    @carbohydratedata = @diet_by_day.sum("carbohydrate * 4").map(&:second).to_json.html_safe
    @body_weightdata = @diet_by_day.sum(:body_weight).map(&:second).to_json.html_safe
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.save!
      flash[:success] = "体重・カロリーを記録しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "体重・カロリーを記録できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @diet.update(diet_params)
      flash[:success] = "体重・カロリーを更新しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "体重・カロリーを更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diet.destroy
    flash[:success] = "体重・カロリーを削除しました"
    redirect_to("/workouts")
  end

  private
    def set_diet
      @diet = Diet.find(params[:id])
    end

    def set_user_id
      @user = User.find(session[:user_id])
    end

    def diet_params
      params.require(:diet).permit(
        :record_time,
        :body_weight,
        :protein,
        :fat,
        :carbohydrate
      ).merge(user_id: session[:user_id])
    end
end