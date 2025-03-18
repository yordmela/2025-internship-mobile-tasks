class Product {
  // properties
  String _name;
  String _description;
  double _price;

  // Constructor with named parameters
  Product(
      {required String name,
      required String description,
      required double price})
      : _name = name,
        _description = description,
        _price = price;

  //Getters
  String get name => _name;
  String get description => _description;
  double get price => _price;

  //Setters
  set name(String newName) => _name = newName;
  set description(String newDescription) => _description = newDescription;
  set price(double newPrice) => _price = newPrice;

  @override
  String toString() {
    return 'Product(name: $_name, description: $_description, price: $_price)';
  }
}

class ProductManager {
  // Properties
  final List<Product> _productList = [];

  // Add new product
  void addProduct(Product product) {
    _productList.add(product);
  }

  // view all products
  List<Product> viewAllProducts() {
    return _productList;
  }

  // view single product
  Product viewSingleProduct(int index) {
    if (index >= _productList.length || index < 0) {
      throw Exception('product not found at index $index');
    }
    return _productList[index];
  }

  // edit product by index
  void editProduct(int index,
      {String? name, String? description, double? price}) {
    if (index >= _productList.length || index < 0) {
      throw Exception('product not found at index $index');
    } else {
      final product = _productList[index];
      if (name != null) product.name = name;
      if (description != null) product.description = description;
      if (price != null) product.price = price;
    }
  }

  // delete product by index
  void deleteProduct(int index) {
    if (index >= _productList.length || index < 0) {
      throw Exception('product not found at index $index');
    } else {
      _productList.removeAt(index);
    }
  }
}
