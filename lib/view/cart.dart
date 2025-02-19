import 'package:ecommers/controllers/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Shopping Cart',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.items.isEmpty) {
              return Center(
                child: Text('Your cart is empty.'),
              );
            }

            // Calculate the subtotal
            double subtotal = state.items.fold(
              0,
              (total, cartItem) =>
                  total + (cartItem.product.price * cartItem.quantity),
            );

            double shipping = 10.0; // Fixed shipping cost
            double total = subtotal + shipping; // Total price

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: state
                        .items.length, // Replace with actual cart items count
                    itemBuilder: (context, index) {
                      final cartItem = state.items[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Product Image
                            Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(cartItem.product.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Product Details
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.product.title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      cartItem.product.price.toString(),
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Quantity Controls
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove,
                                                    size: 20,
                                                    color: Colors.black87),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                      DecreaseQuantity(cartItem
                                                          .product.id
                                                          .toString()));
                                                },
                                              ),
                                              Text(
                                                cartItem.quantity.toString(),
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add,
                                                    size: 20,
                                                    color: Colors.black87),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                      IncreaseQuantity(cartItem
                                                          .product.id
                                                          .toString()));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Delete Button
                            IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.black54, size: 24),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(RemoveFromCart(cartItem.product.id));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Bottom Summary
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Summary Items
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${subtotal}',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${shipping}',
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '${total}',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Proceed to Checkout',
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
