part of 'cart_bloc.dart';

class CartState {
  final List<CartItem> items;

  CartState({this.items = const []});

  double get totalPrice => items.fold(
      0, (total, item) => total + (item.product.price * item.quantity));

  CartState copywith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);  
  }
}
