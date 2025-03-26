import 'package:ecommerce/feature/product/domain/entities/product.dart';

abstract class ProductLocalDataSource {
    Future<Product> getCachedProduct();
    Future<void> cacheProduct(Product product);

}