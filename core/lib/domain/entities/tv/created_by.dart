import 'package:equatable/equatable.dart';

class CreatedBy extends Equatable {
  int id;
  String creditId;
  String name;
  int gender;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    creditId,
    name,
    gender,
  ];
}