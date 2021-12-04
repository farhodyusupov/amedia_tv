class Data {
  final String id;
  final String nameuz;
  final String nameru;
  final DateTime createdAT;

  Data({required this.id, required this.nameuz, required this.nameru, required this.createdAT});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(id: json["_id"], nameuz: json["nameuz"], nameru: json["nameru"], createdAT: json["createdAT"]);
}
