import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([InternetConnectionChecker, NetworkInfo,ProductRemoteDataSource, ProductLocalDataSource, ProductRepositoryImpl,SharedPreferences])
void main(){}