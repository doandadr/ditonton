import 'package:equatable/equatable.dart';

class Network extends Equatable {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    logoPath,
    name,
    originCountry,
  ];

}