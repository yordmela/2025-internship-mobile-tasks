import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

// Base State
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

// Initial State
class ProductInitialState extends ProductState {}

// Loading States
class ProductsLoadingState extends ProductState {}

// Success States
class ProductsLoadedState extends ProductState {
  final List<Product> products;
  const ProductsLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsInsertedState extends ProductState {
  final Product product;
  const ProductsInsertedState(this.product);

  @override
  List<Object> get props => [product];
}

class ProductsUpdatedState extends ProductState {
  final Product product;
  const ProductsUpdatedState(this.product);

  @override
  List<Object> get props => [product];
}

class ProductsDeletedState extends ProductState {}

// Error States
class ProductsErrorState extends ProductState {
  final String message;
  const ProductsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
