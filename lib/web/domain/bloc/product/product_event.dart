part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getActive({String? sort}) = _GetActive;
  const factory ProductEvent.getPending() = _GetPending;
  const factory ProductEvent.add({ProductModel? product}) = _Add;
  const factory ProductEvent.delete({String? nameProduct}) = _Delete;
}
