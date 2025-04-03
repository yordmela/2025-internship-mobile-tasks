import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/usecase.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockGetAllProduct mockGetAllProducts;
  late MockInsertProduct mockInsertProduct;
  late MockDeleteProduct mockDeleteProduct;
  late MockUpdateProduct mockUpdateProduct;

  setUp(() {
    mockGetAllProducts = MockGetAllProduct();
    mockUpdateProduct = MockUpdateProduct();
    mockDeleteProduct = MockDeleteProduct();
    mockInsertProduct = MockInsertProduct();

    productBloc = ProductBloc(
      getAllProduct: mockGetAllProducts,
      insertProduct: mockInsertProduct,
      deleteProduct: mockDeleteProduct,
      updateProduct: mockUpdateProduct,
    );
  });

  Product product = const Product(
    id: '1',
    name: 'jeans',
    price: "100",
    description: 'this is jeans',
    imageUrl: '../assets/bag.jpg',
  );
  String tId = '1';

  test('initial state should be initial state', () {
    //assert
    expect(productBloc.state, ProductInitialState());
  });

  group('LoadAllProductEvent', () {
    List<Product> productList = [
      const Product(
        id: '1',
        name: 'jeans',
        price: "100",
        description: 'this is jeans',
        imageUrl: '../assets/bag.jpg',
      ),
      const Product(
        id: '1',
        name: 'jeans',
        price: "100",
        description: 'this is jeans',
        imageUrl: '../assets/bag.jpg',
      ),
    ];

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, LoadedAllProductState] when LoadAllProductEvent is added and getAllProducts returns data',
      build: () {
        when(mockGetAllProducts.call(any)).thenAnswer(
          (_) async => Right(productList),
        ); // Ensure it returns the product list
        return productBloc;
      },
      act: (bloc) => bloc.add(GetAllProductEvent()),
      expect: () => [ProductsLoadingState(), ProductsLoadedState(productList)],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, ErrorState] when LoadAllProductEvent is unsuccessful',
      build: () {
        when(
          mockGetAllProducts.call(any),
        ).thenAnswer((_) async => Left(ServerFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetAllProductEvent()),
      expect:
          () => [
            ProductsLoadingState(),
            ProductsErrorState('Error loading products'),
          ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, ErrorState] when LoadAllProductEvent is unsuccessful',
      build: () {
        when(
          mockGetAllProducts.call(any),
        ).thenAnswer((_) async => Left(CacheFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetAllProductEvent()),
      expect:
          () => [
            ProductsLoadingState(),
            ProductsErrorState('Error loading products'),
          ],
    );
  });

  group('InsertProductEvent', () {
    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, InsertedProductState] when InsertProductEvent is added and insertProduct insert product',
      build: () {
        when(
          mockInsertProduct.call(any),
        ).thenAnswer((_) async => Right(product));

        return productBloc;
      },
      act: (bloc) => bloc.add(InsertProductEvent(product: product)),
      expect: () => [ProductsLoadingState(), ProductsInsertedState(product)],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, ErrorState] when InsertProductEvent is unsuccessful',
      build: () {
        when(
          mockInsertProduct.call(any),
        ).thenAnswer((_) async => Left(ServerFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(InsertProductEvent(product: product)),
      expect:
          () => [
            ProductsLoadingState(),
            ProductsErrorState('Error in adding product'),
          ],
    );
  });

  group('DeleteProductEvent', () {
    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, DeletedProductState] when DeleteProductEvent is added and deleteProduct delete product',
      build: () {
        when(
          mockDeleteProduct.call(any),
        ).thenAnswer((_) async => Right(unit));

        when(mockGetAllProducts.call(NoParams()))
      .thenAnswer((_) async => Right([]));

        return productBloc;
      },
      act: (bloc) => bloc.add(DeleteProductEvent(id: tId)),
      expect: () => [ProductsLoadingState(), ProductsDeletedState(),   ProductsLoadingState(), ProductsLoadedState([])]
    );

    blocTest<ProductBloc, ProductState>(
      'emits [LoadingState, ErrorState] when DeleteProductEvent is unsuccessful',
      build: () {
        when(
          mockDeleteProduct.call(any),
        ).thenAnswer((_) async => Left(ServerFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(DeleteProductEvent(id: tId)),
      expect:
          () => [
            ProductsLoadingState(),
            ProductsErrorState('Error in deleting product'),
          ],
    );
  });
}
