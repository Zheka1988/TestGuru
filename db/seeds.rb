# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



categ = Array.new(4) do |i|
  Category.create!(title: "Category ##{i}")
end


Test.create!(title: 'Ruby', level: 2, category_id: categ[0].id)
Test.create!(title: 'HTML', level: 1, category_id: categ[1].id)
Test.create!(title: 'CSS', level: 1, category_id: categ[1].id)
Test.create!(title: 'PHP', level: 2, category_id: categ[2].id)
Test.create!(title: 'Delphi', level: 2, category_id: categ[3].id)

test_objects = Test.all

User.create!(name: 'Vova', password: '123')
User.create!(name: 'Kolya', password: '123')
User.create!(name: 'Vika', password: '123')

users_object = User.all

question_objects = Array.new(5) do |i|
  Question.create!(body: "Question ##{i+1}", test_id: test_objects[i].id )
end


5.times do |i|
  Answer.create!(question_id: question_objects[i].id)
end

3.times do |i|
  TraveledTest.create!(user_id: users_object[i].id, test_id: test_objects[i].id )
end
  TraveledTest.create!(user_id: users_object[0].id, test_id: test_objects[1].id )



