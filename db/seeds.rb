# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
restaurants = [
  { name: "Le Petit Chef", address: "123 Paris St, France", phone_number: "123-456-7890", category: "french" },
  { name: "Sushi Express", address: "456 Tokyo Rd, Japan", phone_number: "987-654-3210", category: "japanese" },
  { name: "Pasta Mania", address: "789 Rome Ave, Italy", phone_number: "555-123-4567", category: "italian" },
  { name: "Waffles & More", address: "321 Brussels Ln, Belgium", phone_number: "111-222-3333", category: "belgian" },
  { name: "Dim Sum House", address: "654 Beijing Blvd, China", phone_number: "444-555-6666", category: "chinese" }
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

puts "Finished seeding!"
