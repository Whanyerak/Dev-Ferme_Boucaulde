DistributionPoint.create(name: 'Le Quesnoy')
DistributionPoint.create(name: 'Valenciennes')
DistributionPoint.create(name: 'Saint-Amand les eaux')

Cart.create(name: 'Grand', nb_butters: 2, nb_cheeses: 6)
Cart.create(name: 'Petit', nb_butters: 1, nb_cheeses: 3)

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
  password_confirmation: 'password',
  cart: Cart.first,
  distribution_point: DistributionPoint.first,
  nb_yaourts: 12
)
