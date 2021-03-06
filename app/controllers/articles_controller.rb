    class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
        @author= @article.author[:username]


    end
    def new
        @article = current_user.articles.new(params[:post])
    end
     def create
        @article = current_user.articles.new(article_params)
        @article.save
        flash.notice = "Article '#{@article.title}' has been Created."
        redirect_to article_path(@article.id)
    end
#idea from here  https://stackoverflow.com/questions/34562994/managing-users-in-ruby-on-rails-ownership
    #private
    #def article_params
     #   params.require(:article).permit()
    #end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article '#{@article.title}' has been Removed."
        redirect_to articles_path
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' has been Updated."
        redirect_to articles_path(@article)
    end

end
