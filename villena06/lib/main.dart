import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/MyCart.dart';
import 'package:flutter_application_1/screen/MyCatalog.dart';
import 'package:flutter_application_1/screen/Checkout.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        "/checkout": (context) => const Checkout(),
      },
      home: const MyCatalog(),
    );
  }
}
