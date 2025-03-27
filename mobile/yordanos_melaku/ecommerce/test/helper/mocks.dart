import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([InternetConnectionChecker, NetworkInfo,ProductRemoteDataSource, ProductLocalDataSource, ProductRepositoryImpl])
void main(){}