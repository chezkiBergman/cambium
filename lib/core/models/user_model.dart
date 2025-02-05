import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String first_name,
    required String last_name,
    required String email,
    required String avatar,
    required String date_of_birth,
  }) = _UserModel;

  /// JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
