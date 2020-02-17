class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def show

  end

  def new
  end

  def edit

  end

  #　会員の新規登録
  def create
  end

  def update

  end
  def destroy

  end
end
