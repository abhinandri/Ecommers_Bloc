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

class ClearCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final String productId;
  IncreaseQuantity(this.productId);
}

class DecreaseQuantity extends CartEvent {
  final String productId;
  DecreaseQuantity(this.productId);
}


