import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetProduct extends Usecase<Product,Params>{
  final ProductRepository repository;

  GetProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.getProduct(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
