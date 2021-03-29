require 'test_helper'

module Chive
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @article = chive_articles(:one)
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article" do
      assert_difference('Article.count') do
        post articles_url, params: { article: { author_id: @article.author_id, autosummary: @article.autosummary, body: @article.body, custom_byline: @article.custom_byline, expired_at: @article.expired_at, published_at: @article.published_at, slug: @article.slug, status: @article.status, summary: @article.summary, title: @article.title } }
      end

      assert_redirected_to article_url(Article.last)
    end

    test "should show article" do
      get article_url(@article)
      assert_response :success
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      patch article_url(@article), params: { article: { author_id: @article.author_id, autosummary: @article.autosummary, body: @article.body, custom_byline: @article.custom_byline, expired_at: @article.expired_at, published_at: @article.published_at, slug: @article.slug, status: @article.status, summary: @article.summary, title: @article.title } }
      assert_redirected_to article_url(@article)
    end

    test "should destroy article" do
      assert_difference('Article.count', -1) do
        delete article_url(@article)
      end

      assert_redirected_to articles_url
    end
  end
end
