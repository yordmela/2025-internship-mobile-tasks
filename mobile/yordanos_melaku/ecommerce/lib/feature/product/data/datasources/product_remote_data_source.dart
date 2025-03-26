import 'package:ecommerce/feature/product/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<Product> getProduct(int id);
  Future<Product> insertProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<Product> deleteProduct(int id);
}