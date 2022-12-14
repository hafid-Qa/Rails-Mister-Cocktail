# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
puts "clearing the database"
Ingredient.destroy_all

puts "creating ingredient list"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = JSON.parse(URI.open(url).read)
response['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "created #{Ingredient.count}"