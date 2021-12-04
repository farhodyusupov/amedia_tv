class Sort{
    final String id;
    final String image;
    final String year;
    Name name;
    final List<Category> category;
    Sort({required this.name,required this.image,required this.year, required this.id, required this.category});
    factory Sort.fromJson(Map<String, dynamic> json){
      var list  = json['category'] as List;
      List <Category> catList = list.map((e) => Category.fromJson(e)).toList();
      return Sort(name: Name.fromJson(json['name']), image: json['image'], year:json['year'], id: json['id'], category:catList);
    }
}

class Name{
  final String uz;
  final String ru;

  Name({required this.uz, required this.ru});

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(uz: json['uz'], ru: json['ru']);
  }
}

class Category{
  String id;
  String nameuz;
  Category({required this.id, required this.nameuz});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(id: json['id'], nameuz: json['nameuz']);
  }
}