class EntriesController < ApplicationController
  # before_action :login_required, expect: [:index, :show]

  # 記事一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @entries = @user.entries
    else
      @entries = Entry.all
  end
  # @entries = @entries.readable_for(current_user)
  # .order(posted_at: :desc).paginate(page: params[:page], per_page: 5)
end

  def show
    @entry = Entry.readable_for(current_user).find(params[:id])
  end

  def new
    @entry = Entry.new(posted_at: Time.current)
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  # 新規作成
  def create
    # @entry = Entry.new(entry_params)
    @entry = Entry.new(params[:id])
    # @entry.author = current_user
    if @entry.save
      redirect_to @entry, notice: "記事を作成しました"
    else
      render "new"
    end
  end

  #　更新
  def update
  @entry = current_user.entries.find(params[:id])
  @entry.assign_attributes(entry_params)
  if @entry.save
    redirect_to @entry, notice: "記事を更新しました"
  else
    render "edit"
  end
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy
    redirect_to :entries, notice: "記事を削除しました"
  end

  # private
  # def entry_params
  #  params.required(:entry).permit(:title, :body, :posted_at, :status)
  # end

end
