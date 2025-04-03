import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';

class InsertProduct extends Usecase<Product,Product>{
  final ProductRepository repository;

  InsertProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.insertProduct(product);
  }

}

