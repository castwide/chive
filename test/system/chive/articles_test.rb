require "application_system_test_case"

module Chive
  class ArticlesTest < ApplicationSystemTestCase
    setup do
      @article = chive_articles(:one)
    end

    test "visiting the index" do
      visit articles_url
      assert_selector "h1", text: "Articles"
    end

    test "creating a Article" do
      visit articles_url
      click_on "New Article"

      fill_in "Author", with: @article.author_id
      check "Autosummary" if @article.autosummary
      fill_in "Body", with: @article.body
      fill_in "Custom byline", with: @article.custom_byline
      fill_in "Expired at", with: @article.expired_at
      fill_in "Published at", with: @article.published_at
      fill_in "Slug", with: @article.slug
      fill_in "Status", with: @article.status
      fill_in "Summary", with: @article.summary
      fill_in "Title", with: @article.title
      click_on "Create Article"

      assert_text "Article was successfully created"
      click_on "Back"
    end

    test "updating a Article" do
      visit articles_url
      click_on "Edit", match: :first

      fill_in "Author", with: @article.author_id
      check "Autosummary" if @article.autosummary
      fill_in "Body", with: @article.body
      fill_in "Custom byline", with: @article.custom_byline
      fill_in "Expired at", with: @article.expired_at
      fill_in "Published at", with: @article.published_at
      fill_in "Slug", with: @article.slug
      fill_in "Status", with: @article.status
      fill_in "Summary", with: @article.summary
      fill_in "Title", with: @article.title
      click_on "Update Article"

      assert_text "Article was successfully updated"
      click_on "Back"
    end

    test "destroying a Article" do
      visit articles_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Article was successfully destroyed"
    end
  end
end
