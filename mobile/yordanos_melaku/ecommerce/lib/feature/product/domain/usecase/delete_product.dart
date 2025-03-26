import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteProduct extends Usecase<Product, Params> {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.deleteProduct(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}