// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsData _$GoodsDataFromJson(Map<String, dynamic> json) => GoodsData(
      json['id'] as int,
      json['goods'] as String,
      json['count'] as String,
      json['shop'] as String,
      json['boughted'] as bool,
    );

Map<String, dynamic> _$GoodsDataToJson(GoodsData instance) => <String, dynamic>{
      'id': instance.id,
      'goods': instance.goods,
      'count': instance.count,
      'shop': instance.shop,
      'boughted': instance.boughted,
    };
