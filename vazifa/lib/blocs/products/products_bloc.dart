import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/repositories/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(InitialProductsState()) {
    on<GetProductsEvent>(_getProducts);
    on<DeleteProductEvent>(_deleteProduct);
    on<AddProductEvent>(_addProduct);
    on<EditProductEvent>(_editProduct);
  }

  void _getProducts(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(LoadingProductsState());
    try {
      final response = await _productsRepository.getProducts();
      emit(LoadedProductsState(response));
    } catch (e) {
      emit(ErrorProductsState(e.toString()));
    }
  }

  void _deleteProduct(
    DeleteProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(DeletingProductState());
    GetProductsEvent();
    try {
      await _productsRepository.deleteProducts(event.productId);
      emit(DeletedProductState());
      add(GetProductsEvent());
    } catch (e) {
      emit(ErrorDeletingProductState(e.toString()));
    }
  }

  void _addProduct(
    AddProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(AddingProductState());

    try {
      await _productsRepository.addProducts(event.product);
      emit(AddedProductState());
      add(GetProductsEvent());
    } catch (e) {
      emit(ErrorAddingProductState(e.toString()));
    }
  }
  void _editProduct(
    EditProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(EditingProductState());

    try {
      await _productsRepository.editProducts(event.id ,event.product);
      emit(EditedProductState());
      add(GetProductsEvent());
    } catch (e) {
      emit(ErrorEditingProductState(e.toString()));
    }
  }
}
