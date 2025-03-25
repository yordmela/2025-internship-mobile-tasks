import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/pages/detail_page.dart';

void main() {
  testWidgets('DetailPage displays product details correctly', (WidgetTester tester) async {
    // Arrange
    final product = Product(
      name: 'Test Product',
      category: 'Shoes',
      price: '\$100',
      imagePath: 'assets/boots.png',
      description: 'This is a test product.', id: '1', rating: '4.0',
    );

    // Act
    await tester.pumpWidget(MaterialApp(home: DetailPage(product: product)));

    // Assert
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('Shoes'), findsOneWidget);
    expect(find.text('\$100'), findsOneWidget);
    expect(find.text('This is a test product.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Back button pops the screen', (WidgetTester tester) async {
    // Arrange
    final product = Product(
      name: 'Test Product',
      category: 'Shoes',
      price: '\$100',
      imagePath: 'assets/boots.png',
      description: 'This is a test product.', id: '4.0', rating: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DetailPage(product: product),
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byIcon(Icons.arrow_back_ios));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(DetailPage), findsNothing);
  });
}