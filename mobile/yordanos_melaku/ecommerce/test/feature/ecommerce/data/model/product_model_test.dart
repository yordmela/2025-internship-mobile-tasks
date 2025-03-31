import 'dart:convert';

import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tProductModel = ProductModel(
    id: '1',
    name: 'boots',
    description: 'this is boots',
    price: 3000.0,
    imageUrl: 'assets/boots.png',
  );
  test('should be subclass of product entitiy', () async {
    expect(tProductModel, isA<Product>());
  });

  group("fromjson", () {
    test("should return a valid model for the json", () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));

      // act
      final result = ProductModel.fromJson(jsonMap);

      // assert
      expect(result, tProductModel);
    });
  });

  group("tojson", () {
    test("should return a valid json for the product model", () {
      // arrange
      final result = tProductModel.toJson();

      // act
      final expectedJsonMap = {
        "id": 1,
        "name": "boots",
        "description": "this is boots",
        "price": 3000.0,
        "imageUrl": "assets/boots.png",
      };

      // assert
      expect(result, expectedJsonMap);
    });
  });
}
