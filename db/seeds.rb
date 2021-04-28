# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "sbb3391")

Library.create(user_id: 1)

20.times do 
  Book.create(title: "Book Number #{rand(1..100)}", author: "Sam")
end

10.times do 
  LibraryTransaction.create(library_id: 1, expiration_date: Date.today-rand(10))
end

5.times do 
  BookTransaction.create(library_transaction_id: rand(1..3), book_id: rand(1..20))
end