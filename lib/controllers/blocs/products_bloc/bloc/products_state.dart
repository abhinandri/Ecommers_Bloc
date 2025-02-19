part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductLoaded extends ProductsState {
  final List<ProductModel> products;


  ProductLoaded(this.products);
}

class ProductError extends ProductsState {
  final String messege;
  ProductError(this.messege);
}
