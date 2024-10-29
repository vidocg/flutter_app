import 'package:json_annotation/json_annotation.dart';

part 'Test.g.dart';

@JsonSerializable()
class Test {
  Test(this.valOne, this.valTwo);

  String valOne;
  String valTwo;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);

  // static const fromJsonFactory = _$TestFromJson;
}
