import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sigest/data/models/product_model/product_model.dart';
import 'package:sigest/domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(const _Loading()) {
    on<ProductEvent>(_onProductEvent);
  }

  Future<void> _onProductEvent(ProductEvent event, Emitter<ProductState> emit) {
    return event.when(
      getActive: (String? sort) async {
        emit(const _Loading());
        try {
          List<ProductModel?> productList;
          switch (sort) {
            case 'Precio ascendente':
              productList =
                  await productRepository.getProductsByPrice(sort: true);
              break;
            case 'Precio descendente':
              productList =
                  await productRepository.getProductsByPrice(sort: false);
              break;
            case 'Cantidad ascendente':
              productList =
                  await productRepository.getProductsByAmount(sort: true);
              break;
            case 'Cantidad descendente':
              productList =
                  await productRepository.getProductsByAmount(sort: false);
              break;
            default:
              productList =
                  await productRepository.getProductsState(state: true);
          }

          emit(_Loaded(productList: productList));
        } catch (e) {
          debugPrint("error$e");
        }
      },
      getPending: () async {
        emit(const _Loading());
        try {
          final productList =
              await productRepository.getProductsState(state: false);
          emit(_Loaded(productList: productList));
        } catch (e) {
          debugPrint("error$e");
        }
      },
      add: (ProductModel? product) async {
        emit(const _Loading());
        try {
          await productRepository.addProduct(product: product);
        } catch (e) {
          print("error$e");
        }
      },
      delete: (String? nameProduct) async {
        emit(const _Loading());
        try {
          await productRepository.deleteProduct(nameProduct: nameProduct);
        } catch (e) {
          print("error$e");
        }
      },
    );
  }
}
