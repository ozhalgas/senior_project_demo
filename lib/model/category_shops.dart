class CategoryShops {
  late List<String> categoryShops;

  CategoryShops({required this.categoryShops});

  CategoryShops.fromJson(Map<String, dynamic> json) {
    categoryShops = json['category_shops'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_shops'] = this.categoryShops;
    return data;
  }
}