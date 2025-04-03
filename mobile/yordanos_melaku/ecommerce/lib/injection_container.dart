import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/feature/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/feature/product/domain/usecase/delete_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/get_all_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/insert_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/update_product.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  //Bloc
  sl.registerFactory(
    () => ProductBloc(
      getAllProduct: sl(),
      insertProduct: sl(),
      updateProduct: sl(),
      deleteProduct: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetAllProduct(sl()));
  sl.registerLazySingleton(() => InsertProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
