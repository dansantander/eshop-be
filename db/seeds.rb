require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Product.create(name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4), price: Faker::Commerce.price)
end

#Faker::LoremPixel.image(size: "243x342", is_gray: false, category: 'sports')