class LessonController < ApplicationController
  def step1
    render text: "こんにちは#{params[:name]}さん"
  end
  def step8
    @price = (2000 * 1.05).floor
  end
  def step10
    @comment = "<script>alert('危険')</script>こんにちは"
  end
  def step11
    @comment = "<strong>安全な</strong>"
  end
end
