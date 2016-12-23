require "chive/engine"

module Chive
  # TODO Testing Devise style configuration
  class << self
    attr_accessor :slug_style
    attr_accessor :default_autosummary
    attr_accessor :per_page
    attr_accessor :date_format
  end
  def self.setup
    yield self
  end
end
