import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/cities_vo.dart';
part 'get_cities_response.g.dart';

@JsonSerializable()
class CitiesResponse {
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CitiesVO>? citiesList;

  CitiesResponse(this.code, this.message, this.citiesList);

  factory CitiesResponse.fromJson(Map<String,dynamic> json) => _$CitiesResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CitiesResponseToJson(this);

}