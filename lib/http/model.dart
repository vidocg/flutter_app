import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class CustomPage {
  CustomPage(this.pageSize, this.itemsNum, this.currentPageNum);
  int pageSize;
  int itemsNum;
  int currentPageNum;

  factory CustomPage.fromJson(Map<String, dynamic> json) =>
      _$CustomPageFromJson(json);

  Map<String, dynamic> toJson() => _$CustomPageToJson(this);
}
