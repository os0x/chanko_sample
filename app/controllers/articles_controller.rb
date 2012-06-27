class ArticlesController < ApplicationController
  ext_action(:article_deletion, :destroy)

  def index
  end

  def create
    attributes = params[:article].dup.extract!(:title, :content, :image).merge(:user_id => session[:user].try(:id))
    @article = Article.new(attributes)
    if @article.save
      redirect_to top_path
    else
      render :action => 'index'
    end
  end
end


