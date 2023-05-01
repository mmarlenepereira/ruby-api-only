class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: article
    else
      render json: {
               error: "Failed to create article"
             },
             status: :unprocessable_entity
    end
  end
  

  def update
    article = Article.find(params[:id])

    if article.update(article_params)
      render json: article
    else
      render json: {
               error: "Failed to update article"
             },
             status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :published)
  end
end
