import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

class SubscriptionApiRequest {}

@JsonSerializable()
class SubscriptionApiResponse {
  SubscriptionApiResponse(this.valOne, this.valTwo);
  String valOne;
  String valTwo;

  factory SubscriptionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionApiResponseFromJson(json);

  // / `toJson` is the convention for a class to declare support for serialization
  // / to JSON. The implementation simply calls the private, generated
  // / helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$SubscriptionApiResponseToJson(this);
}
