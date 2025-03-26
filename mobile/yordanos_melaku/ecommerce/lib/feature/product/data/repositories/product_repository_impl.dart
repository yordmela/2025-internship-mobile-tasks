import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/platform/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.localDataSource, required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, Product>> getProduct(int id){
    return null;
  }
  Future<Either<Failure, Product>> insertProduct(Product product){
    return null;
  }
  Future<Either<Failure, Product>> updateProduct(int id, Product product){
    return null;
  }
  Future<Either<Failure, Product>> deleteProduct(int id){
    return null;
  }

}