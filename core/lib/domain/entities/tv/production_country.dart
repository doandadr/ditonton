
import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    iso31661,
    name,
  ];

}