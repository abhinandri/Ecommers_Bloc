part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddtoCart extends CartEvent {
  final ProductModel product;

  AddtoCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart(this.productId);
}

class ClearCart extends CartEvent{}
