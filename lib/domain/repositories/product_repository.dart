import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sigest/data/models/product_model/product_model.dart';

class ProductRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  Future addProduct({ProductModel? product}) async {
    final user = _firebaseAuth.currentUser!.email;
    try {
      await _store
          .collection(user.toString())
          .doc(product!.name)
          .set(product.toJson())
          .then((value) {});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductModel?> isCodeExists({ProductModel? product}) async {
    final user = _firebaseAuth.currentUser!.email;
    try {
      ProductModel pro;
      final query = await _store
          .collection(user.toString())
          .where('code', isEqualTo: product!.code)
          .get();
      if (query.size > 0) {
        pro = ProductModel.fromJson(query.docs.first.data());
        return pro;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future<List<ProductModel?>> getProducts() async {
    final user = _firebaseAuth.currentUser!.email;
    List<ProductModel?> productList = [];
    ProductModel productModel;
    try {
      await _store
          .collection(user.toString())
          //.where('state', isEqualTo: true)
          .get()
          .then((value) {
        for (var element in value.docs) {
          productModel = ProductModel.fromJson(element.data());
          productList.add(productModel);
        }
      });

      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel?>> getProductsState({required bool state}) async {
    final user = _firebaseAuth.currentUser!.email;
    List<ProductModel?> productList = [];
    ProductModel productModel;
    try {
      await _store
          .collection(user.toString())
          .where('state', isEqualTo: state)
          .get()
          .then((value) {
        for (var element in value.docs) {
          productModel = ProductModel.fromJson(element.data());
          productList.add(productModel);
        }
      });

      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel?>> getProductsByPrice({required bool sort}) async {
    final user = _firebaseAuth.currentUser!.email;
    List<ProductModel?> productList = [];
    ProductModel productModel;
    try {
      await _store
          .collection(user.toString())
          .orderBy('price', descending: sort)
          .get()
          .then((value) {
        for (var element in value.docs) {
          productModel = ProductModel.fromJson(element.data());
          if (productModel.state) {
            productList.add(productModel);
          }
        }
      });

      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel?>> getProductsByAmount({required bool sort}) async {
    final user = _firebaseAuth.currentUser!.email;
    List<ProductModel?> productList = [];
    ProductModel productModel;
    try {
      await _store
          .collection(user.toString())
          .orderBy('amount', descending: sort)
          .get()
          .then((value) {
        for (var element in value.docs) {
          productModel = ProductModel.fromJson(element.data());
          if (productModel.state) {
            productList.add(productModel);
          }
        }
      });

      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future deleteProduct({String? nameProduct}) async {
    final user = _firebaseAuth.currentUser!.email;
    try {
      await _store.collection(user.toString()).doc(nameProduct).delete().then(
            (doc) => debugPrint("Document deleted"),
            onError: (e) => debugPrint("Error updating document $e"),
          );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
