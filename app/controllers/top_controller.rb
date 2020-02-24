class TopController < ApplicationController
  def index
    @article = Article.open.readable_for(current_user)
    .order("released_at DESC").limit(5)
  end
end
