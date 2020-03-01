class UsersController < ApplicationController
  # 会員一覧
  def index
    @users = User.order("id")
  end

  def search
    @users = User.search(params[:q])
    render "index"
  end

  def show
    @user = User.find(params[:id])
  end

  # 新規登録
  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])
  end

  # 会員の新規登録
  def create
  #  @user = User.new(user_params)
  @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "会員を登録しました"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "会員を削除しました"
  end

  private
  def user_params
    attrs = [:number, :name]
    # attrs << :administrator if current_user.administrator?params.required(:user).permit(attrs)
  end

end
