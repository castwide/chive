require 'chive/version'
require 'chive/engine'

module Chive
  def self.setup
    yield self
  end

  class << self
    attr_writer :user_model

    def user_model
      @user_model ||= 'User'
    end

    attr_writer :user_pk_attr

    def user_pk_attr
      @user_pk_attr ||= 'id'
    end

    attr_writer :user_name_attr

    def user_name_attr
      @user_name_attr ||= 'name'
    end

    attr_writer :anonymous_name

    def anonymous_name
      @anonymous_name ||= 'Anonymous'
    end

    attr_writer :use_devise

    def use_devise?
      @use_devise ||= false
    end

    attr_writer :public_layout

    def public_layout
      @public_layout ||= 'chive/application'
    end
  end
end
