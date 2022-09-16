// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      uId: json['uId'] as String,
      code: json['code'] as int,
      name: json['name'] as String,
      amount: json['amount'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      entryDate: json['entryDate'] as String?,
      desc: json['desc'] as String?,
      category: json['category'] as String?,
      provider: json['provider'] as String?,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
      'price': instance.price,
      'purchasePrice': instance.purchasePrice,
      'entryDate': instance.entryDate,
      'desc': instance.desc,
      'category': instance.category,
      'provider': instance.provider,
      'state': instance.state,
    };
