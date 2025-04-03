import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/usecase/delete_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/get_all_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/insert_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/update_product.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetAllProduct getAllProduct;
  InsertProduct insertProduct;
  UpdateProduct updateProduct;
  DeleteProduct deleteProduct;

  ProductBloc({
    required this.getAllProduct,
    required this.insertProduct,
    required this.updateProduct,
    required this.deleteProduct,
  }) : super(ProductInitialState()) {
    // list of event handlers
    on<GetAllProductEvent>((event, emit) async {
      emit(ProductsLoadingState());
      final result = await getAllProduct.call(NoParams());
      result.fold(
        (failure) => emit(ProductsErrorState('Error loading products')),
        (products) => emit(ProductsLoadedState(products)),
      );
    });

    on<InsertProductEvent>((event, emit) async {
      emit(ProductsLoadingState());

      final result = await insertProduct.call(event.product);

      result.fold(
        (failure) => emit(ProductsErrorState('Error in adding product')),
        (product) => emit(ProductsInsertedState(product)),
      );
    });

    on<UpdateProductEvent>((event, emit) async {
      emit(ProductsLoadingState());

      final result = await updateProduct.call(event.product);

      result.fold(
        (failure) => emit(ProductsErrorState('Error in updating product')),
        (product) => emit(ProductsUpdatedState(product)),
      );
    });

    on<DeleteProductEvent>((event, emit) async {
      emit(ProductsLoadingState());

      final result = await deleteProduct.call(event.id);
      print(result);
      result.fold(
        (failure) => emit(ProductsErrorState('Error in deleting product')),
        (product) {
          emit(ProductsDeletedState());
          add(GetAllProductEvent());
        },
      );
    });
  }
}
