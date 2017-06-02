# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Yaourt.create(name: 'Nature')
Yaourt.create(name: 'Nature sucré')
Yaourt.create(name: 'Abricot')
Yaourt.create(name: 'Banane')
Yaourt.create(name: 'Citron')
Yaourt.create(name: 'Fraise')
Yaourt.create(name: 'Fruits rouge')
Yaourt.create(name: 'Noix de coco')
Yaourt.create(name: 'Orange')
Yaourt.create(name: 'Vanille')
Yaourt.create(name: 'Crème chocolat')
Yaourt.create(name: 'Crème vanille')
Yaourt.create(name: 'Fromage blanc')

Cheese.create(name: 'Nature')
Cheese.create(name: 'Ail & fines herbes')
Cheese.create(name: 'Fromage blanc')
Cheese.create(name: 'Noix figues')
Cheese.create(name: 'Poivre curry')
Cheese.create(name: 'Tomates poivrons')

User.create(
  email: 'admin@exemple.fr',
  password: 'password',
  password_confirmation: 'password'
)
