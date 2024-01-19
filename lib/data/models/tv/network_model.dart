class NetworkModel {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  NetworkModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
    id: json["id"],
    logoPath: json["logo_path"],
    name: json["name"],
    originCountry: json["origin_country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountry,
  };
}