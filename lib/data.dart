class Categorie{
  String categorieName;
  List<Shop> listShops;

  Categorie(this.categorieName, this.listShops);
}

class Shop{
  String name;
  String description;
  String floor;
  Shop(this.name, this.description, this.floor);
}

final List<Categorie> dataForExpandableWidget = <Categorie>[
  Categorie(
    'Family Shops', 
    <Shop>[
      Shop('InJoy', 'Snacks and sweets shop. Diverse assortment of chocolate, marmalade, flakes, soda and chips', '2'),
      Shop('Leonardo','"Hobby and Handycraft shop. There are board games, stationery, sewing, beading, knitting, and embroidery products.', '2'),
      Shop('Marwin','Family shop with variety of products: books, board games, LEGOs, sweets', '2'),
      Shop('Miniso','Japanese lifestyle shop. There are home goods, electronics, cosmetics and accessories.', '2'),
      Shop('Zadari.kz','Original gifts shop for all ages and sexes.', '2'),
    ]
  ),
  Categorie(
    'Beauty Salon', 
    <Shop>[
      Shop('Luxe', 'Barbershop, manicure, visage and hair dyeing services in one place', '2'),
      Shop('Viva', 'Barbershop, manicure, visage and hair dyeing services in one place', '2'),
    ]
  ),
  Categorie(
    'Sportswear', 
    <Shop>[
      Shop('Li-Ning', 'Chinese sportswear and sports equipment shop.', '2'),
      Shop('Nike', 'American company producing sporting footwear, apparel, equipment and accessories.', '2'),
      Shop('Sportmaster', 'Largest sportswear and sports equipment shop in Mega SilkWay. It has the most diverse equipment.', '2'),
      Shop('Summit Sport', 'Australian sportswear and sports equipment shop. It focuses on delivering ‘Best-In-Game’ products.', '2'),
      Shop('Under Armour', 'American sports equipment, footwear and casual apparel shop.', '2'),
    ]
  ),
];

final List<Shop> allShops = [
  Shop('InJoy', 'Snacks and sweets shop. Diverse assortment of chocolate, marmalade, flakes, soda and chips', '2'),
  Shop('Leonardo','"Hobby and Handycraft shop. There are board games, stationery, sewing, beading, knitting, and embroidery products.', '2'),
  Shop('Li-Ning', 'Chinese sportswear and sports equipment shop.', '2'),
  Shop('Luxe', 'Barbershop, manicure, visage and hair dyeing services in one place', '2'),
  Shop('Marwin','Family shop with variety of products: books, board games, LEGOs, sweets', '2'),
  Shop('Miniso','Japanese lifestyle shop. There are home goods, electronics, cosmetics and accessories.', '2'),
  Shop('Nike', 'American company producing sporting footwear, apparel, equipment and accessories.', '2'),
  Shop('Sportmaster', 'Largest sportswear and sports equipment shop in Mega SilkWay. It has the most diverse equipment.', '2'),
  Shop('Summit Sport', 'Australian sportswear and sports equipment shop. It focuses on delivering ‘Best-In-Game’ products.', '2'),
  Shop('Under Armour', 'American sports equipment, footwear and casual apparel shop.', '2'),
  Shop('Viva', 'Barbershop, manicure, visage and hair dyeing services in one place', '2'),
  Shop('Zadari.kz','Original gifts shop for all ages and sexes.', '2'),
];