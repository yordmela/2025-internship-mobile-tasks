import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/feature/ecommerce/domain/entities/product.dart';
import 'package:ecommerce/feature/ecommerce/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct({required this.repository});

  Future<Either<Failure, Product>> execute({required Product product}) async {
    return await repository.insertProduct(product);
  }
}
