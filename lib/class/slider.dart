class SliderImage{
  final String id;
  final String date;
  SerialSlider serial;
  SliderImage({required this.id, required this.date, required this.serial});

  
  factory SliderImage.fromJson(Map <String, dynamic> json){
    return SliderImage(id: json['_id'], date: json['date'], serial: SerialSlider.fromJson(json['serial']));
  }
}

class SerialSlider{
  final String id;
  final String image;
  Screen screen;
  Name name;
  Description description;
  SerialSlider({required this.id, required this.image, required this.screen, required this.name, required this.description});

  factory SerialSlider.fromJson(Map<String, dynamic > json){
    return SerialSlider(id: json['id'], image: json['image'],screen: Screen.fromJson(json['screens']), name: Name.fromJson(json['name']), description: Description.fromJson(json['description']));
  }
}

class Screen{
  final List<String> original;

  Screen({required this.original});
  
  factory Screen.fromJson(Map<String, dynamic> json){
    var original = json['original'];
    List<String> originalList = new List<String>.from(original);
    return Screen(original: originalList);
  }
}

class Name{
  final String uz;
  final String ru;

  Name({required this.ru, required this.uz});

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(ru: json['ru'], uz: json['uz']);
  }
}

class Description{
  final String uz;
  final String ru;

  Description({required this.uz, required this.ru});

  factory Description.fromJson(Map<String, dynamic> json){
    return Description(uz: json['uz'], ru: json['ru']);
  }
}