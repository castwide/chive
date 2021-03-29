require_dependency "chive/application_controller"

module Chive
  class ArticlesController < ApplicationController
    layout Chive.public_layout, only: [:index, :show]

    before_action :authenticate_chive_user, except: [:index, :show]

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET /articles
    # GET /articles.json
    def index
      @articles = if (chive_user || Rails.env.development?) && !params.key?(:public)
        Article.latest
      else
        Article.latest_published
      end.paginate(page: params[:page])
    end

    # GET /articles/1
    # GET /articles/1.json
    def show
    end

    # GET /articles/new
    def new
      @article = Article.new(published_at: DateTime.now)
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    # POST /articles.json
    def create
      @article = Article.new(article_params)
      @article.author = chive_user

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articles/1
    # PATCH/PUT /articles/1.json
    def update
      respond_to do |format|
        if params[:delete_image] || params[:article][:image]
          @article.image.purge
        end
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params[:article].permit(:title, :body, :custom_byline, :autosummary, :summary, :published_at, :expired_at, :status, :tag_list, :image)
    end
  end
end
