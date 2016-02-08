class ArticlesController < ApplicationController
  # GET articles
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article =  Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    @article.save
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :published?)
    end

end