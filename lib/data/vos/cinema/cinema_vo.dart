import 'package:json_annotation/json_annotation.dart';
import 'cinema_facilities_vo.dart';
part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "promo_vdo_url")
  String? promoVdoUrl;

  @JsonKey(name: "facilities")
  List<CinemaFacilitiesVO>? facilitiesList;

  @JsonKey(name: "safety")
  List<String>? safetyList;

  CinemaVO(this.id, this.name, this.phone, this.email, this.address,
      this.promoVdoUrl, this.facilitiesList, this.safetyList);

  factory CinemaVO.fromJson(Map<String,dynamic> json) => _$CinemaVOFromJson(json);

  Map<String,dynamic> toJson() => _$CinemaVOToJson(this);
}