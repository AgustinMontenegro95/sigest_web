part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded({List<ProductModel?>? productList}) =
      _Loaded;
}
