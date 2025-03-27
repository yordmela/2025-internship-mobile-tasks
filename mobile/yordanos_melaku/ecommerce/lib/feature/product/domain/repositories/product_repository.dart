import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProduct(int id);
  Future<Either<Failure, Product>> insertProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(int id, Product product);
  Future<Either<Failure, void>> deleteProduct(int id);
}