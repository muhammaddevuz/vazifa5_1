part of 'products_bloc.dart';

sealed class ProductsEvent {}

final class GetProductsEvent extends ProductsEvent {}

class DeleteProductEvent extends ProductsEvent {
  final String productId;

  DeleteProductEvent(this.productId);
}

class AddProductEvent extends ProductsEvent {
  final Map product;

  AddProductEvent(this.product);
}
class EditProductEvent extends ProductsEvent {
  final String id;
  final Map product;

  EditProductEvent(this.product,this.id);
}
