import 'package:core/domain/entities/tv/created_by.dart';
import 'package:equatable/equatable.dart';

class CreatedByModel extends Equatable {
  int id;
  String creditId;
  String name;
  int gender;

  CreatedByModel({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) => CreatedByModel(
        id: json["id"],
        creditId: json["credit_id"],
        name: json["name"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "credit_id": creditId,
        "name": name,
        "gender": gender,
      };

  CreatedBy toEntity() {
    return CreatedBy(
      id: id,
      creditId: creditId,
      name: name,
      gender: gender,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
      ];
}
