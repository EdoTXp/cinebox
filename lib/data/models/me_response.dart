// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'me_response.g.dart';

@JsonSerializable()
class MeResponse {
  final String email;
  final String name;
  final String picture;

  MeResponse({
    required this.email,
    required this.name,
    required this.picture,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) =>
      _$MeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeResponseToJson(this);
}
