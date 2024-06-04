# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
patient1 = Patient.new(name: "Carl", age: 42, insurance: "Anthem")
patient1.save

patient2 = Patient.new(name: "Alice", age: 35, insurance: "Medical Mutual")
patient2.save

patient3 = Patient.new(name: "Anthony", age: 20, insurance: "Oscar")
patient3.save