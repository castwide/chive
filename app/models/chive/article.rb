module Chive
  class Article < ActiveRecord::Base
    self.per_page = 10
    belongs_to :author, class_name: 'User'

    #enum status: [:draft, :publish]

    acts_as_taggable

    after_initialize :set_default_autosummary, :if => :new_record?
    before_save :set_published_at, :set_slug, :generate_summary

    def to_param
      slug
    end

    def byline
      custom_byline || author.email
    end

    private
    def set_default_autosummary
      self.autosummary = Chive.default_autosummary || false
    end
    def set_published_at
      self.published_at = DateTime.now if self.published_at.nil?
    end
    def set_slug
      # TODO Slugs need to be unique
      self.slug = self.title.parameterize if self.slug.nil?
    end
    def generate_summary
      if self.autosummary?
        html = Nokogiri::HTML(self.body)
        para = html.css('p').first
        puts para
        self.summary = para.inner_html
      end
    end
  end
end
