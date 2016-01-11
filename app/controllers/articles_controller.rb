class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      # save_tags
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      # save_tags
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    # byebug
    @article = Article.find(params[:id])
    tags = ArticleTag.where(article_id: params[:id])
    ArticleTag.destroy(tags)
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,
                                    :body,
                                    :article_image,
                                    :tag_list)
  end

  def save_tags
    params[:article][:tags].split.each do |tag|
      @article.tags.find_or_create_by(title: tag.capitalize)
    end
  end

end
