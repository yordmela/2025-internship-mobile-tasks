import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/mocks.mocks.dart';

void main() {
  // Common test data
  const tId = 1;
  final tProductModel = ProductModel(
    id: tId,
    name: 'boots',
    description: 'this is boots',
    price: 3000.0,
    imageUrl: 'assets/boots.png',
  );
  final Product tProduct = tProductModel;

  // Mocks
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockProductLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  // Common setup
  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  // Helper functions
  void setupOnline() {
    when(
      mockNetworkInfo.isConnected,
    ).thenAnswer((_) async => Future.value(true));
  }

  void setupOffline() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  }

  // Test groups
  group("getProduct", () {
    group('device is online', () {
      setUp(() => setupOnline());

      test('should check if the device is online', () async {
        when(
          mockRemoteDataSource.getProduct(tId),
        ).thenAnswer((_) async => tProductModel);
        await repository.getProduct(tId);
        verify(mockNetworkInfo.isConnected);
      });

      test('should return remote data when successful', () async {
        when(
          mockRemoteDataSource.getProduct(tId),
        ).thenAnswer((_) async => tProductModel);
        final result = await repository.getProduct(tId);
        verify(mockRemoteDataSource.getProduct(tId));
        expect(result, equals(Right(tProduct)));
      });

      test('should cache the data locally when successful', () async {
        when(
          mockRemoteDataSource.getProduct(tId),
        ).thenAnswer((_) async => tProductModel);
        await repository.getProduct(tId);
        verify(mockRemoteDataSource.getProduct(tId));
        verify(mockLocalDataSource.cacheProduct(tProduct));
      });

      test('should return server failure when unsuccessful', () async {
        when(mockRemoteDataSource.getProduct(tId)).thenThrow(ServerException());
        final result = await repository.getProduct(tId);
        verify(mockRemoteDataSource.getProduct(tId));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() => setupOffline());

      test('should return cached data when present', () async {
        when(
          mockLocalDataSource.getCachedProduct(),
        ).thenAnswer((_) async => tProductModel);
        final result = await repository.getProduct(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProduct());
        expect(result, Right(tProduct));
      });

      test('should return cache failure when no cached data', () async {
        when(
          mockLocalDataSource.getCachedProduct(),
        ).thenThrow(CacheException());
        final result = await repository.getProduct(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProduct());
        expect(result, Left(CacheFailure()));
      });
    });
  });

  group("insertProduct", () {
    test('should check if the device is online', () async {
      setupOnline();
      when(
        mockRemoteDataSource.insertProduct(tProduct),
      ).thenAnswer((_) async => tProductModel);
      await repository.insertProduct(tProduct);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() => setupOnline());

      test("should add product to remote datasource", () async {
        when(
          mockRemoteDataSource.insertProduct(tProduct),
        ).thenAnswer((_) async => tProductModel);
        final result = await repository.insertProduct(tProduct);
        verify(mockRemoteDataSource.insertProduct(tProduct));
        expect(result, Right(tProductModel));
      });

      test('should return server failure when unsuccessful', () async {
        when(
          mockRemoteDataSource.insertProduct(tProduct),
        ).thenThrow(ServerException());
        final result = await repository.insertProduct(tProduct);
        verify(mockRemoteDataSource.insertProduct(tProduct));
        expect(result, Left(ServerFailure()));
      });
    });

    group('device is offline', () {
      setUp(() => setupOffline());

      test("should return network exception", () async {
        when(
          mockRemoteDataSource.insertProduct(tProduct),
        ).thenThrow(NetworkException());
        final result = await repository.insertProduct(tProduct);
        verify(mockNetworkInfo.isConnected);
        expect(result, Left(NetworkFailure()));
      });
    });
  });

  group("updateProduct", () {
    test('should check if the device is online', () async {
      setupOnline();
      when(
        mockRemoteDataSource.updateProduct(tId, tProduct),
      ).thenAnswer((_) async => tProductModel);
      await repository.updateProduct(tId, tProduct);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() => setupOnline());

      test("should update the product", () async {
        when(
          mockRemoteDataSource.updateProduct(tId, tProduct),
        ).thenAnswer((_) async => tProductModel);
        final result = await repository.updateProduct(tId, tProduct);
        verify(mockRemoteDataSource.updateProduct(tId, tProduct));
        expect(result, Right(tProductModel));
      });

      test('should return server failure when unsuccessful', () async {
        when(
          mockRemoteDataSource.updateProduct(tId, tProduct),
        ).thenThrow(ServerException());
        final result = await repository.updateProduct(tId, tProduct);
        verify(mockRemoteDataSource.updateProduct(tId, tProduct));
        expect(result, Left(ServerFailure()));
      });
    });

    group('device is offline', () {
      setUp(() => setupOffline());

      test("should return network exception", () async {
        when(
          mockRemoteDataSource.updateProduct(tId, tProduct),
        ).thenThrow(NetworkException());
        final result = await repository.updateProduct(tId, tProduct);
        verify(mockNetworkInfo.isConnected);
        expect(result, Left(NetworkFailure()));
      });
    });
  });

  group("deleteProduct", () {
    test('should check if the device is online', () async {
      setupOnline();
      when(
        mockRemoteDataSource.deleteProduct(tId),
      ).thenAnswer((_) async => null);
      await repository.deleteProduct(tId);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() => setupOnline());

      test("should delete the product", () async {
        when(
          mockRemoteDataSource.deleteProduct(tId),
        ).thenAnswer((_) async => null);
        final result = await repository.deleteProduct(tId);
        verify(mockRemoteDataSource.deleteProduct(tId));
        expect(result, Right(null));
      });

      test('should return server failure when unsuccessful', () async {
        when(
          mockRemoteDataSource.deleteProduct(tId),
        ).thenThrow(ServerException());
        final result = await repository.deleteProduct(tId);
        verify(mockRemoteDataSource.deleteProduct(tId));
        expect(result, Left(ServerFailure()));
      });
    });

    group('device is offline', () {
      setUp(() => setupOffline());

      test("should return network exception", () async {
        when(
          mockRemoteDataSource.deleteProduct(tId),
        ).thenThrow(NetworkException());
        final result = await repository.deleteProduct(tId);
        verify(mockNetworkInfo.isConnected);
        expect(result, Left(NetworkFailure()));
      });
    });
  });
}
