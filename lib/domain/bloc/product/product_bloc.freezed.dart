// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sort) getActive,
    required TResult Function() getPending,
    required TResult Function(ProductModel? product) add,
    required TResult Function(String? nameProduct) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetActive value) getActive,
    required TResult Function(_GetPending value) getPending,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res> implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  final ProductEvent _value;
  // ignore: unused_field
  final $Res Function(ProductEvent) _then;
}

/// @nodoc
abstract class _$$_GetActiveCopyWith<$Res> {
  factory _$$_GetActiveCopyWith(
          _$_GetActive value, $Res Function(_$_GetActive) then) =
      __$$_GetActiveCopyWithImpl<$Res>;
  $Res call({String? sort});
}

/// @nodoc
class __$$_GetActiveCopyWithImpl<$Res> extends _$ProductEventCopyWithImpl<$Res>
    implements _$$_GetActiveCopyWith<$Res> {
  __$$_GetActiveCopyWithImpl(
      _$_GetActive _value, $Res Function(_$_GetActive) _then)
      : super(_value, (v) => _then(v as _$_GetActive));

  @override
  _$_GetActive get _value => super._value as _$_GetActive;

  @override
  $Res call({
    Object? sort = freezed,
  }) {
    return _then(_$_GetActive(
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetActive implements _GetActive {
  const _$_GetActive({this.sort});

  @override
  final String? sort;

  @override
  String toString() {
    return 'ProductEvent.getActive(sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetActive &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_GetActiveCopyWith<_$_GetActive> get copyWith =>
      __$$_GetActiveCopyWithImpl<_$_GetActive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sort) getActive,
    required TResult Function() getPending,
    required TResult Function(ProductModel? product) add,
    required TResult Function(String? nameProduct) delete,
  }) {
    return getActive(sort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
  }) {
    return getActive?.call(sort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
    required TResult orElse(),
  }) {
    if (getActive != null) {
      return getActive(sort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetActive value) getActive,
    required TResult Function(_GetPending value) getPending,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return getActive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return getActive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (getActive != null) {
      return getActive(this);
    }
    return orElse();
  }
}

abstract class _GetActive implements ProductEvent {
  const factory _GetActive({final String? sort}) = _$_GetActive;

  String? get sort;
  @JsonKey(ignore: true)
  _$$_GetActiveCopyWith<_$_GetActive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetPendingCopyWith<$Res> {
  factory _$$_GetPendingCopyWith(
          _$_GetPending value, $Res Function(_$_GetPending) then) =
      __$$_GetPendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetPendingCopyWithImpl<$Res> extends _$ProductEventCopyWithImpl<$Res>
    implements _$$_GetPendingCopyWith<$Res> {
  __$$_GetPendingCopyWithImpl(
      _$_GetPending _value, $Res Function(_$_GetPending) _then)
      : super(_value, (v) => _then(v as _$_GetPending));

  @override
  _$_GetPending get _value => super._value as _$_GetPending;
}

/// @nodoc

class _$_GetPending implements _GetPending {
  const _$_GetPending();

  @override
  String toString() {
    return 'ProductEvent.getPending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sort) getActive,
    required TResult Function() getPending,
    required TResult Function(ProductModel? product) add,
    required TResult Function(String? nameProduct) delete,
  }) {
    return getPending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
  }) {
    return getPending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
    required TResult orElse(),
  }) {
    if (getPending != null) {
      return getPending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetActive value) getActive,
    required TResult Function(_GetPending value) getPending,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return getPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return getPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (getPending != null) {
      return getPending(this);
    }
    return orElse();
  }
}

abstract class _GetPending implements ProductEvent {
  const factory _GetPending() = _$_GetPending;
}

/// @nodoc
abstract class _$$_AddCopyWith<$Res> {
  factory _$$_AddCopyWith(_$_Add value, $Res Function(_$_Add) then) =
      __$$_AddCopyWithImpl<$Res>;
  $Res call({ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_AddCopyWithImpl<$Res> extends _$ProductEventCopyWithImpl<$Res>
    implements _$$_AddCopyWith<$Res> {
  __$$_AddCopyWithImpl(_$_Add _value, $Res Function(_$_Add) _then)
      : super(_value, (v) => _then(v as _$_Add));

  @override
  _$_Add get _value => super._value as _$_Add;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$_Add(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }

  @override
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$_Add implements _Add {
  const _$_Add({this.product});

  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'ProductEvent.add(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Add &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$_AddCopyWith<_$_Add> get copyWith =>
      __$$_AddCopyWithImpl<_$_Add>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sort) getActive,
    required TResult Function() getPending,
    required TResult Function(ProductModel? product) add,
    required TResult Function(String? nameProduct) delete,
  }) {
    return add(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
  }) {
    return add?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetActive value) getActive,
    required TResult Function(_GetPending value) getPending,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements ProductEvent {
  const factory _Add({final ProductModel? product}) = _$_Add;

  ProductModel? get product;
  @JsonKey(ignore: true)
  _$$_AddCopyWith<_$_Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  $Res call({String? nameProduct});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res> extends _$ProductEventCopyWithImpl<$Res>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, (v) => _then(v as _$_Delete));

  @override
  _$_Delete get _value => super._value as _$_Delete;

  @override
  $Res call({
    Object? nameProduct = freezed,
  }) {
    return _then(_$_Delete(
      nameProduct: nameProduct == freezed
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({this.nameProduct});

  @override
  final String? nameProduct;

  @override
  String toString() {
    return 'ProductEvent.delete(nameProduct: $nameProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            const DeepCollectionEquality()
                .equals(other.nameProduct, nameProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(nameProduct));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? sort) getActive,
    required TResult Function() getPending,
    required TResult Function(ProductModel? product) add,
    required TResult Function(String? nameProduct) delete,
  }) {
    return delete(nameProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
  }) {
    return delete?.call(nameProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? sort)? getActive,
    TResult Function()? getPending,
    TResult Function(ProductModel? product)? add,
    TResult Function(String? nameProduct)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(nameProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetActive value) getActive,
    required TResult Function(_GetPending value) getPending,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetActive value)? getActive,
    TResult Function(_GetPending value)? getPending,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductEvent {
  const factory _Delete({final String? nameProduct}) = _$_Delete;

  String? get nameProduct;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductModel?>? productList) initial,
    required TResult Function() loading,
    required TResult Function(String? mensaje) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  final ProductState _value;
  // ignore: unused_field
  final $Res Function(ProductState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  $Res call({List<ProductModel?>? productList});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$ProductStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? productList = freezed,
  }) {
    return _then(_$_Initial(
      productList: productList == freezed
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ProductModel?>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({final List<ProductModel?>? productList})
      : _productList = productList;

  final List<ProductModel?>? _productList;
  @override
  List<ProductModel?>? get productList {
    final value = _productList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductState.initial(productList: $productList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productList));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductModel?>? productList) initial,
    required TResult Function() loading,
    required TResult Function(String? mensaje) loaded,
  }) {
    return initial(productList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
  }) {
    return initial?.call(productList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(productList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial({final List<ProductModel?>? productList}) = _$_Initial;

  List<ProductModel?>? get productList;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$ProductStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductModel?>? productList) initial,
    required TResult Function() loading,
    required TResult Function(String? mensaje) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  $Res call({String? mensaje});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$ProductStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? mensaje = freezed,
  }) {
    return _then(_$_Loaded(
      mensaje: mensaje == freezed
          ? _value.mensaje
          : mensaje // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({this.mensaje});

  @override
  final String? mensaje;

  @override
  String toString() {
    return 'ProductState.loaded(mensaje: $mensaje)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.mensaje, mensaje));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mensaje));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductModel?>? productList) initial,
    required TResult Function() loading,
    required TResult Function(String? mensaje) loaded,
  }) {
    return loaded(mensaje);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
  }) {
    return loaded?.call(mensaje);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductModel?>? productList)? initial,
    TResult Function()? loading,
    TResult Function(String? mensaje)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(mensaje);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ProductState {
  const factory _Loaded({final String? mensaje}) = _$_Loaded;

  String? get mensaje;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
