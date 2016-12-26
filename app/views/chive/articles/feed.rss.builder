xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Title"
    xml.description "A blog about software and chocolate"
    xml.link chive.articles_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.summary
        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link chive.article_url(article)
        xml.guid chive.article_url(article)
       end
    end
  end
end
