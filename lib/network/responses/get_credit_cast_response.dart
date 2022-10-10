import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import '../../data/vos/movie_now_and_coming_soon/credit_crew_vo.dart';
part 'get_credit_cast_response.g.dart';

@JsonSerializable()
class CreditCastResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "cast")
  List<CreditCastVO>? castList;

  @JsonKey(name: "crew")
  List<CreditCrewVO>? crewList;

  CreditCastResponse(this.id, this.castList, this.crewList);

  factory CreditCastResponse.fromJson(Map<String,dynamic> json) => _$CreditCastResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CreditCastResponseToJson(this);
}