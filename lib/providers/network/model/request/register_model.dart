import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
