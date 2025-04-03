import 'package:ecommerce/feature/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/feature/product/presentation/pages/add_page.dart';
import 'package:ecommerce/feature/product/presentation/pages/detail_page.dart';
import 'package:ecommerce/feature/product/presentation/pages/home_page.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/presentation/pages/search_page.dart';
import 'package:ecommerce/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(BlocProvider(create: (context) => sl<ProductBloc>(), child: MyApp()));
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is! Product) {
            return const HomePage();
          }
          return DetailPage(product: args);
        },
        '/add': (context) => const AddPage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}
