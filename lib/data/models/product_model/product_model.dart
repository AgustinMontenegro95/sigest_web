import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String uId,
    required int code,
    required String name,
    required int? amount,
    double? price,
    double? purchasePrice,
    String? entryDate,
    String? desc,
    String? category,
    String? provider,
    required bool state,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
