part of 'products_bloc.dart';


sealed class ProductsState {}

final class InitialProductsState extends ProductsState {}

final class LoadingProductsState extends ProductsState {}

final class LoadedProductsState extends ProductsState {
  final List<Product> products;

  LoadedProductsState(this.products);
}

final class ErrorProductsState extends ProductsState {
  final String message;

  ErrorProductsState(this.message);
}

class DeletingProductState extends ProductsState {}

class DeletedProductState extends ProductsState {}

class ErrorDeletingProductState extends ProductsState {
  final String message;

  ErrorDeletingProductState(this.message);
}

class AddingProductState extends ProductsState {}

class AddedProductState extends ProductsState {
}

class ErrorAddingProductState extends ProductsState {
  final String message;

  ErrorAddingProductState(this.message);
}
class EditingProductState extends ProductsState {}

class EditedProductState extends ProductsState {
}

class ErrorEditingProductState extends ProductsState {
  final String message;

  ErrorEditingProductState(this.message);
}