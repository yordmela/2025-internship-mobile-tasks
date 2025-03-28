import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<Product> getCachedProduct();
  Future<void> cacheProduct(ProductModel product);
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
  Future<void> cacheProduct(ProductModel product) async {
    final jsonString = json.encode(product.toJson());
    await sharedPreferences.setString(CACHED_PRODUCT, jsonString);
  }
}
