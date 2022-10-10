import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
part 'snack_categories_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_SNACK_CATEGORY_VO, adapterName: "SnackCategoryVOAdapter")
class SnackCategoriesVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "title")
  @HiveField(1)
  String? title;

  @JsonKey(name: "title_mm")
  @HiveField(2)
  String? titleMM;

  @JsonKey(name: "is_active")
  @HiveField(3)
  int? isActive;

  @JsonKey(name: "created_at")
  @HiveField(4)
  String? createdAt;

  @JsonKey(name: "updated_at")
  @HiveField(5)
  String? updatedAt;

  @JsonKey(name: "deleted_at")
  @HiveField(6)
  String? deletedAt;

  SnackCategoriesVO(this.id, this.title, this.titleMM, this.isActive, this.createdAt,
      this.updatedAt, this.deletedAt);

  factory SnackCategoriesVO.fromJson(Map<String,dynamic> json) => _$SnackCategoriesVOFromJson(json);

  Map<String,dynamic> toJson() => _$SnackCategoriesVOToJson(this);
}