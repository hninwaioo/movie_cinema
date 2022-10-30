
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_now_and_coming_soon/date_vo.dart';
import '../../data/vos/movie_now_and_coming_soon/movie_vo.dart';

part 'get_movie_now_and_coming_soon_response.g.dart';

@JsonSerializable()
class MovieListResponse{
  @JsonKey(name: "dates")
  DateVO? dates;

  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "results")
  List<MovieVO>? results;

  MovieListResponse(this.dates,this.page,this.results);

  factory MovieListResponse.fromJson(Map<String,dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String,dynamic> toJson() => _$MovieListResponseToJson(this);
}