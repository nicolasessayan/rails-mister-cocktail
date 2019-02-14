# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_hash = JSON.parse(open(url).read)
ingredients_attributes = []

json_hash['drinks'].each do |hash|
  ingredients_attributes << { name: hash['strIngredient1'] }
end

puts 'Cleaning ingredientss database...'
Ingredient.destroy_all
puts 'Creating ingredients...'

Ingredient.create!(ingredients_attributes)
puts 'Finished!'
