import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> insertProduct(Product product);
  Future<ProductModel> updateProduct(String id, Product product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  final baseUrl = 'http://localhost:5000/api/products/';

  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(
      Uri.parse('$baseUrl$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> insertProduct(Product product) async {
    final productModel= ProductModel(id: product.id, name: product.name, description: product.description, price: product.price, imageUrl: product.imageUrl);
    final response = await client.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json', // Required for JSON APIs
      },
      body: (json.encode(productModel.toJson())),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(String id, Product product) async {
    final productModel= ProductModel(id: product.id, name: product.name, description: product.description, price: product.price, imageUrl: product.imageUrl);
    final response = await client.put(
      Uri.parse('http://localhost:5000/api/products/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productModel.toJson()),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException();
    }
  }
}
