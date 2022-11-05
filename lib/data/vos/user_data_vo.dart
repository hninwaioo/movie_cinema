import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';
part 'user_data_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_DATA_VO, adapterName: "UserDataVOAdapter")

class UserDataVO {
  @JsonKey(name:"id")
  @HiveField(0)
  int? id;

  @JsonKey(name:"name")
  @HiveField(1)
  String? name;

  @JsonKey(name:"email")
  @HiveField(2)
  String? email;

  @JsonKey(name:"phone")
  @HiveField(3)
  String? phone;

  @JsonKey(name: "total_expense")
  @HiveField(4)
  int? totalExpense;

  @JsonKey(name:"profile_image")
  @HiveField(5)
  String? profileImage;

  @JsonKey(name:"cards")
  @HiveField(6)
  List<String>? cardList;

  @HiveField(7)
  String? token;

  UserDataVO(this.id, this.name, this.email, this.phone,
      this.totalExpense, this.profileImage, this.cardList,this.token);

  factory UserDataVO.fromJson(Map<String,dynamic> json) => _$UserDataVOFromJson(json);

  Map<String,dynamic> toJson() => _$UserDataVOToJson(this);

}