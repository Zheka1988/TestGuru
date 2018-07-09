# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'web')
Category.create(title: 'mobile')
Category.create(title: 'frontend')
Category.create(title: 'beckend')

Test.create(title: 'Ruby', level: 2, category_id: 1)
Test.create(title: 'HTML', level: 1, category_id: 1)
Test.create(title: 'CSS', level: 1, category_id: 1)
Test.create(title: 'PHP', level: 2, category_id: 2)

User.create(name: 'Vova', password: '123')
User.create(name: 'Kolya', password: '123')
User.create(name: 'Vika', password: '123')


