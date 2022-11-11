
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

//run: flutter pub run build_runner watch
//if get error by run: flutter pub run build_runner watch --delete-conflicting-outputs 

@JsonSerializable()
class GoodsData{
  @JsonKey( name: "id" )       final int    id;
  @JsonKey( name: "goods" )    final String goods;
  @JsonKey( name: "count" )    final String count;
  @JsonKey( name: "shop" )     final String shop;
  @JsonKey( name: "boughted" ) final bool   boughted;

  const GoodsData( this.id,this.goods, this.count, this.shop, this.boughted);

  bool valid() => goods.isNotEmpty && count.isNotEmpty && shop.isNotEmpty;

  dynamic toJson() => _$GoodsDataToJson(this);
  factory GoodsData.fromJson(dynamic json) => _$GoodsDataFromJson(json); 
}
