import 'package:bloc/bloc.dart';
import 'package:ecommers/models/cart_model.dart';
import 'package:ecommers/models/products_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddtoCart>((event, emit) {
      final List<CartItem> updatedItems = List.from(state.items);
      final index = updatedItems
          .indexWhere((item) => item.product.id == event.product.id);

      if (index != -1) {
        updatedItems[index] = CartItem(
            product: updatedItems[index].product,
            quantity: updatedItems[index].quantity + 1);
      } else {
        updatedItems.add(CartItem(product: event.product, quantity: 1));
      }
      emit(state.copywith(items: updatedItems));
    });

    on<RemoveFromCart>(
      (event, emit) {
        final updatedItems = state.items
            .where((item) => item.product.id != event.productId)
            .toList();
        emit(state.copywith(items: updatedItems));
      },
    );

    on<ClearCart>((event, emit) {
      emit(state.copywith(items: []));
    });

    on<IncreaseQuantity>(((event, emit) {
      final updatedItems = state.items.map((item) {
        if (item.product.id == event.productId) {
          return CartItem(product: item.product, quantity: item.quantity + 1);
        }
        return item;
      }).toList();
      emit(state.copywith(items: updatedItems));
    }));

    on<DecreaseQuantity>((event, emit) {
      final updatedItems = state.items.map((item) {
        if (item.product.id == event.productId) {
          return CartItem(product: item.product, quantity: item.quantity - 1);
        }
        return item;
      }).toList();
      emit(state.copywith(items: updatedItems));
    });
  }
}
