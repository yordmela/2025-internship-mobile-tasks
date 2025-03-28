import 'package:ecommerce/feature/product/data/models/product_model.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProduct(int id);
  Future<ProductModel> insertProduct(Product product);
  Future<ProductModel> updateProduct(int id, Product product);
  Future<void> deleteProduct(int id);
}
