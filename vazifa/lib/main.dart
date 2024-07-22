import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/products/products_bloc.dart';
import 'package:lesson81/data/repositories/products_repository.dart';
import 'package:lesson81/data/services/dio_products_service.dart';

import 'app.dart';

void main() {
  final dioProductService = DioProductsService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) {
          return ProductsRepository(dioProductsService: dioProductService);
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ProductsBloc(
                productsRepository: context.read<ProductsRepository>(),
              );
            },
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}
