import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

part 'genres_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GENRE_VO, adapterName: "GenresVOAdapter")
class GenresVO {

  @JsonKey(name: "id")
  @HiveField(0)
  int id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  GenresVO(this.id, this.name);

  factory GenresVO.fromJson(Map<String,dynamic> json) => _$GenresVOFromJson(json);

  Map<String,dynamic> toJson() => _$GenresVOToJson(this);

  @override
  String toString() {
    return 'GenresVO{id: $id, name: $name}';
  }
}