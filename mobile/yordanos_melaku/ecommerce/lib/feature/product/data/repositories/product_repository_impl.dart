import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProduct(id);
        localDataSource.cacheProduct(remoteProduct);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProduct = await localDataSource.getCachedProduct();
        return Right(localProduct);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      print(await networkInfo.isConnected);
      try {
        print("in the repository");
        final remoteProduct = await remoteDataSource.getAllProduct();
        print(remoteProduct);
        localDataSource.cacheListOfProducts(remoteProduct);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProduct = await localDataSource.getCachedProducts();
        return Right(localProduct);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> insertProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        final insertedProduct = await remoteDataSource.insertProduct(product);
        return Right(insertedProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(
    Product product,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final updatedProduct = await remoteDataSource.updateProduct(
          product,
        );
        return Right(updatedProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
