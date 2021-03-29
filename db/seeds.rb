# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Chive examples
if Rails.env.development?
  user = User.create(name: 'Example', email: 'example@example.com', password: 'password')
  Chive::Article.create(
    title: 'Hello, World!',
    body: %(
      <p>This is an example article created by the development seeds (db/seeds.rb).</p>
    ),
    author: user,
    status: 'published',
    published_at: DateTime.today
  )
end
