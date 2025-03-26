import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateProduct extends Usecase<Product,Params>{
  final ProductRepository repository;

  UpdateProduct({required this.repository});

  Future<Either<Failure, Product>> call (Params params) async {
    return await repository.insertProduct(params.product);
  }
}

class Params extends Equatable {
  final Product product;

  const Params({required this.product});

  @override
  List<Object> get props => [product];
}
