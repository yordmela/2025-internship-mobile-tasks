import 'package:ecommerce/feature/product/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<Product> getProduct(int id);
  Future<Product> insertProduct(Product product);
  Future<Product> updateProduct(int id, Product product);
  Future<void> deleteProduct(int id);
}
