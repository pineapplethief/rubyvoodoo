class ArticlesController < ApplicationController

  def index
  end

  def show
  end

  private

  def articles
    @articles ||= Article.all
  end

  def article
    @article ||= Article.find_by_name(params[:id])
  end

end
