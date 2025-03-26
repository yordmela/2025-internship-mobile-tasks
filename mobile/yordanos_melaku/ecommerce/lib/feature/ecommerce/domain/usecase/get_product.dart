import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/feature/ecommerce/domain/entities/product.dart';
import 'package:ecommerce/feature/ecommerce/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> execute({required int id}) async {
    return await repository.getProduct(id);
  }
}
