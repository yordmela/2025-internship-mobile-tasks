import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllProductEvent extends ProductEvent {}

class GetProductEvent extends ProductEvent {
  final String id;
  GetProductEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class InsertProductEvent extends ProductEvent {
  final Product product;
  InsertProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateProductEvent extends ProductEvent {
  final String id;
  final Product product;
  UpdateProductEvent({required this.id, required this.product});

  @override
  List<Object> get props => [id, product];
}

class DeleteProductEvent extends ProductEvent {
  final String id;
  DeleteProductEvent({required this.id});

  @override
  List<Object> get props => [id];
}
