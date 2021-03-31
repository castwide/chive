require 'rails/generators'

module Chive
  module Generators
    class SeedsGenerator < Rails::Generators::Base

      desc <<-DESC
Add database seeds.
      DESC

      class_option :article, type: :string, default: 'Article', desc: 'The article model'
      class_option :user, type: :string, default: 'User', desc: 'The user model'

      def manifest
        append_to_file 'db/seeds.rb' do
          <<-RUBY

# Chive examples
if Rails.env.development?
  user = #{options[:user].camelize}.create(name: 'Example', email: 'example@example.com', password: 'password')
  Chive::#{options[:article].camelize}.create(
    title: 'Hello, World!',
    body: %(
      <p>This is an example article created by the development seeds (db/seeds.rb).</p>
    ),
    author: user,
    status: 'publish',
    published_at: DateTime.now
  )
end
          RUBY
        end
      end
    end
  end
end
