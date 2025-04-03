import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/mocks.mocks.dart';

void main() {
  late ProductLocalDataSourceImpl localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = ProductLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group("getCachedProduct", () {
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test(
      'Should return cached product from the sharedpreference when there is one',
      () async {
        //arrange
        when(
          mockSharedPreferences.getString(any),
        ).thenReturn(fixture('product.json'));

        //act
        final result = await localDataSource.getCachedProduct();

        //assert
        verify(mockSharedPreferences.getString("CACHED_PRODUCT"));
        expect(result, equals(tProductModel));
      },
    );

    test('should throw cache exception when there is no cached product', () {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      //act
      final result = localDataSource.getCachedProduct;

      //assert
      expect(() => result(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('cacheProduct', () {
    final tProductModel = ProductModel(
      id: '1',
      name: 'boots',
      description: 'this is boots',
      price: "3000.0",
      imageUrl: 'assets/boots.png',
    );
    test('should call shared preferences to cache data', () async {
      //arrange
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_)async =>true);
      //act
      await localDataSource.cacheProduct(tProductModel);

      final expectedJsonString = json.encode(tProductModel.toJson());
      verify(
        mockSharedPreferences.setString('CACHED_PRODUCT', expectedJsonString),
      );
    });
  });
}
