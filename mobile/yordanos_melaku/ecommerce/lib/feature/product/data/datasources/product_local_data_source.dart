import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<Product> getCachedProduct();
  Future<void> cacheProduct(ProductModel product);
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheListOfProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  static const String CACHED_PRODUCT = 'CACHED_PRODUCT';

  @override
  Future<ProductModel> getCachedProduct() async {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCT);
    if (jsonString != null) {
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonString = sharedPreferences.getString('CACHED_PRODUCT_LIST');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return Future.value(
        jsonList.map((json) => ProductModel.fromJson(json)).toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    final jsonString = json.encode(product.toJson());
    await sharedPreferences.setString(CACHED_PRODUCT, jsonString);
  }

  @override
  Future<void> cacheListOfProducts(List<ProductModel> products) async {
    final jsonString = json.encode(
      products.map((product) => product.toJson()).toList(),
    );
    await sharedPreferences.setString('CACHED_PRODUCT_LIST', jsonString);
  }
}
