class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to("/workouts")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/workouts")
    else
      @user = User.new
      flash[:failure] = "ログインできませんでした"
      @email = params[:email]
      render("users/sign_in")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/")
  end

  def edit
    if params[:id] == session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def update
    @user = User.find(session[:user_id])
    @user.image = params[:user][:image] if params[:user][:image].present?
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to("/workouts")
    else
      flash[:failure] = "ユーザー情報を更新できませんでした"
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :age,
    :image,
    :password,
    :password_confirmation,
    :introduction,
    :target_protein,
    :target_fat,
    :target_carbohydrate
    )
  end
end
