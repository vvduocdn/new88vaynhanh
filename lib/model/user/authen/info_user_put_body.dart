import 'package:json_annotation/json_annotation.dart';

part 'info_user_put_body.g.dart';

@JsonSerializable()
class InfoUserPutBody {
  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'avatar')
  String? phoneNumber;

  @JsonKey(name: 'phone')
  String? phone;

  InfoUserPutBody();

  factory InfoUserPutBody.fromJson(Map<String, dynamic> json) => _$InfoUserPutBodyFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserPutBodyToJson(this);
}
