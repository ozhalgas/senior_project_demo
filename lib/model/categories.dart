class Categories {
  late List<String> categories;

  Categories({required this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    return data;
  }
}