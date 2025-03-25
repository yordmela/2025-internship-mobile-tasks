import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders correctly in add mode', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AddPage()));

    expect(find.text('Add Product'), findsOneWidget);
    expect(
      find.byType(TextField),
      findsNWidgets(4),
    ); // Name, Category, Price, Description
    expect(find.text('Add'), findsOneWidget);
  });

  testWidgets('Can enter text into fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AddPage()));

    // Find the first TextField (Name) and enter text
    await tester.enterText(find.byType(TextField).first, 'Test Product');
    expect(find.text('Test Product'), findsOneWidget);
  });

  testWidgets('Shows existing product data in edit mode', (tester) async {
    final testProduct = Product(
      id: '1',
      name: 'Existing Product',
      price: '100',
      category: 'Test Category',
      description: 'Test Description',
      imagePath: 'assets/boots.png',
      rating: '3.0',
    );

    await tester.pumpWidget(MaterialApp(home: AddPage(product: testProduct)));

    expect(find.text('Existing Product'), findsOneWidget);
    expect(find.text('Update Product'), findsOneWidget);
  });
}
