import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiRequest {
  AuthApiRequest(this.password, this.email);
  @JsonKey(name: 'Password')
  String password;
  @JsonKey(name: 'Email')
  String email;

  factory AuthApiRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiRequestToJson(this);
}

@JsonSerializable()
class AuthApiResponse {
  AuthApiResponse(this.jwt, this.refresh);
  @JsonKey(name: 'Refresh')
  String refresh;
  @JsonKey(name: 'Jwt')
  String jwt;

  factory AuthApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiResponseToJson(this);
}
