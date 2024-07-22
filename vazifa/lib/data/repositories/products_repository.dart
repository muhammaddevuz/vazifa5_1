import 'package:lesson81/data/services/dio_products_service.dart';

import '../models/product.dart';

class ProductsRepository {
  final DioProductsService _dioProductsService;

  ProductsRepository({required DioProductsService dioProductsService})
      : _dioProductsService = dioProductsService;

  Future<List<Product>> getProducts() async {
    return await _dioProductsService.getProducts();
  }
  Future<void> deleteProducts(String id) async {
    return await _dioProductsService.deleteProduct(id);
  }
  Future<void> addProducts(Map product) async {
    return await _dioProductsService.addProduct(product);
  }
  Future<void> editProducts(String id, Map product) async {
    return await _dioProductsService.editProduct(id, product);
  }
}
