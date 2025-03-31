import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helper/mocks.mocks.dart';

void main() {
  late MockClient mockClient;
  late ProductRemoteDataSource productRemoteDataSource;

  setUp(() {
    mockClient = MockClient();
    productRemoteDataSource = ProductRemoteDataSourceImpl(client: mockClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockClient.get(any, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response(fixture('product.json'), 200));

    when(
      mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => http.Response(fixture('product.json'), 200));

    when(
      mockClient.put(any, headers: anyNamed('headers'), body: anyNamed('body')),
    ).thenAnswer((_) async => http.Response(fixture('product.json'), 200));

    when(
      mockClient.delete(any, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response("Successfully deleted", 200));
  }

  void setUpMockHttpClientFailure404() {
    when(
      mockClient.get(any, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));

    when(
      mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));

    when(
      mockClient.put(any, headers: anyNamed('headers'), body: anyNamed('body')),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));

    when(
      mockClient.delete(any, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group("getProduct", () {
    const tId = '1';
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test('should send get request to the url', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await productRemoteDataSource.getProduct(tId);

      //assert
      verify(
        mockClient.get(
          Uri.parse('http://localhost:5000/api/products/$tId'),
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });

    test('should return a product model when the status code is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      final response = await productRemoteDataSource.getProduct(tId);

      // assert
      expect(response, equals(tProductModel));
    });

    test('should throw server exception when the status code is 404', () async {
      //arrange
      setUpMockHttpClientFailure404();

      //act
      final response = await productRemoteDataSource.getProduct;

      // assert
      expect(() => (response(tId)), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("insertProduct", () {
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );
    print(tProductModel);

    test('should send post request to the url', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await productRemoteDataSource.insertProduct(tProductModel);

      //assert
      verify(
        mockClient.post(
          Uri.parse('http://localhost:5000/api/products/'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(tProductModel.toJson()),
        ),
      );
    });

    test('should return a product model when the status code is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      final response = await productRemoteDataSource.insertProduct(
        tProductModel,
      );

      // assert
      expect(response, equals(tProductModel));
    });

    test('should throw server exception when the status code is 404', () async {
      //arrange
      setUpMockHttpClientFailure404();

      //act
      final response = await productRemoteDataSource.insertProduct;

      // assert
      expect(
        () => (response(tProductModel)),
        throwsA(TypeMatcher<ServerException>()),
      );
    });
  });

  group("updateProduct", () {
    const tId = '1';
    final tProductModel = ProductModel.fromJson(
      json.decode(fixture('product.json')),
    );

    test('should send put request to the url', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await productRemoteDataSource.updateProduct(tId, tProductModel);

      //assert
      verify(
        mockClient.put(
          Uri.parse('http://localhost:5000/api/products/$tId'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(tProductModel.toJson()),
        ),
      );
    });

    test('should return a product model when the status code is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      final response = await productRemoteDataSource.updateProduct(
        tId,
        tProductModel,
      );

      // assert
      expect(response, equals(tProductModel));
    });

    test('should throw server exception when the status code is 404', () async {
      //arrange
      setUpMockHttpClientFailure404();

      //act
      final response = await productRemoteDataSource.updateProduct;

      // assert
      expect(
        () => (response(tId, tProductModel)),
        throwsA(TypeMatcher<ServerException>()),
      );
    });
  });

  group("deleteProduct", () {
    const tId = '1';

    test('should send delete request to the url', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await productRemoteDataSource.deleteProduct(tId);

      //assert
      verify(
        mockClient.delete(
          Uri.parse('http://localhost:5000/api/products/$tId'),
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });

    test(
      'should return a success message when the status code is 200',
      () async {
        //arrange
        setUpMockHttpClientSuccess200();

        //act
        await productRemoteDataSource.deleteProduct(tId);

        // assert
        await expectLater(
          productRemoteDataSource.deleteProduct(tId),
          completes,
        );
      },
    );

    test('should throw server exception when the status code is 404', () async {
      //arrange
      setUpMockHttpClientFailure404();

      //act
      final response = await productRemoteDataSource.deleteProduct;

      // assert
      expect(() => (response(tId)), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
