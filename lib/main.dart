import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/pages/add_page.dart';
import 'package:ecommerce/pages/detail_page.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is! Product) {
            return const HomePage();
          }
          return DetailPage(product: args);
        },
        '/add': (context) => AddPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
