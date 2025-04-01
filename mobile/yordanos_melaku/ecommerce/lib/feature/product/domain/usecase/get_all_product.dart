import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';

class GetAllProduct extends Usecase<List<Product>,NoParams>{
  final ProductRepository repository;

  GetAllProduct(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams) async {
    return await repository.getAllProducts();
  }
}

