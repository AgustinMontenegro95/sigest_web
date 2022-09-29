part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial({List<ProductModel?>? productList}) =
      _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded({String? mensaje}) = _Loaded;
}
