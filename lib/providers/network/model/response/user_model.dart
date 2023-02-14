import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "_id") String id;
  String firstName;
  String lastName;
  String displayName;
  String token;
  String refreshToken;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.token,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
