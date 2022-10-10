import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/banner_vo.dart';
part 'get_banner_response.g.dart';
@JsonSerializable()
class BannerResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<BannerVO>? bannerList;

  BannerResponse(this.code, this.message, this.bannerList);

  factory BannerResponse.fromJson(Map<String,dynamic> json) => _$BannerResponseFromJson(json);

  Map<String,dynamic> toJson() => _$BannerResponseToJson(this);
}