import 'package:flutter/material.dart';
import '../model/Item.dart';
import "package:provider/provider.dart";
import '../provider/shoppingcart_provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    bool a = true;
    bool checkCart = context.watch<ShoppingCart>().cart.isNotEmpty;
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          computeCost(),
          const Divider(height: 4, color: Colors.black),
          if (checkCart)
            (Flexible(
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                  if (a)
                    ElevatedButton(
                        onPressed: () {
                          context.read<ShoppingCart>().removeAll();

                          a = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Payment successful!"),
                            duration:
                                const Duration(seconds: 1, milliseconds: 100),
                          ));
                        },
                        child: const Text("Pay Now!")),
                ])))),
          TextButton(
            child: const Text("Go back to Product Catalog"),
            onPressed: () {
              Navigator.pushNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;

    return products.isEmpty
        ? const Text('No Items yet!')
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(products[index].name),
                  );
                },
              )),
            ],
          ));
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total cost to pay: ${cart.cartTotal}");
    });
  }
}
