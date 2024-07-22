import 'package:dio/dio.dart';
import 'package:lesson81/core/network/dio_client.dart';
import 'package:lesson81/data/models/product.dart';

class DioProductsService {
  final _dioClient = DioClient();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dioClient.get(url: "https://api.escuelajs.co/api/v1/products");

      List<Product> products = [];

      for (var userData in response.data) {
        products.add(Product.fromMap(userData));
      }

      return products;
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e.response?.data);
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _dioClient.delete('https://api.escuelajs.co/api/v1/products/$id');
      
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e);
    } catch (e) {
      // ignore: avoid_print
      print("");
    }
  }
  Future<void> addProduct(Map product) async {
    try {
      await _dioClient.addProduct("https://api.escuelajs.co/api/v1/products/",product);
      
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e);
    } catch (e) {
      // ignore: avoid_print
      print("");
    }
  }
  Future<void> editProduct(String id, Map product) async {
    try {
      await _dioClient.editProduct("https://api.escuelajs.co/api/v1/products/$id",product);
      
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e);
    } catch (e) {
      // ignore: avoid_print
      print("");
    }
  }

  
}
