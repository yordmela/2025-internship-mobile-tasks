import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/feature/product/domain/usecase/delete_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/get_all_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/insert_product.dart';
import 'package:ecommerce/feature/product/domain/usecase/update_product.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  InternetConnectionChecker,
  NetworkInfo,
  ProductRemoteDataSource,
  ProductLocalDataSource,
  ProductRepositoryImpl,
  SharedPreferences,
  http.Client,
  GetAllProduct,
  InsertProduct,
  UpdateProduct,
  DeleteProduct
  
])
void main() {}
