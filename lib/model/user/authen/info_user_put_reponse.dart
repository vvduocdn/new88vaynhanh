import 'package:json_annotation/json_annotation.dart';

part 'info_user_put_reponse.g.dart';

@JsonSerializable()
class InfoUserPutResponse {
  @JsonKey(name: 'updatedTime')
  int? updatedTime;

  @JsonKey(name: 'fullName')
  String? fullName;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: '_id')
  String? id;

  InfoUserPutResponse();

  factory InfoUserPutResponse.fromJson(Map<String, dynamic> json) => _$InfoUserPutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserPutResponseToJson(this);
}
