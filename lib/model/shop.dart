class Shop {
  late String shopName;
  late String shopCategory;
  late String shopDescription;
  late String shopImage;

  Shop(
      {required this.shopName,required this.shopCategory,required this.shopDescription,required this.shopImage});

  Shop.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    shopCategory = json['shop_category'];
    shopDescription = json['shop_description'];
    shopImage = json['shop_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    data['shop_category'] = this.shopCategory;
    data['shop_description'] = this.shopDescription;
    data['shop_image'] = this.shopImage;
    return data;
  }
}
