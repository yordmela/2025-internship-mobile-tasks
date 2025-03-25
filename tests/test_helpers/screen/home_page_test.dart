import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('HomePage displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    // Verify the presence of the greeting text
    expect(find.text('Hello,'), findsOneWidget);
    expect(find.text('Yohannes'), findsOneWidget);

    // Verify the presence of the date
    expect(find.text(DateFormat('MMM d, y').format(DateTime.now())), findsOneWidget);

    // Verify the presence of the "Available Products" text
    expect(find.text('Available Products'), findsOneWidget);

    // Verify the presence of the search icon
    expect(find.byIcon(Icons.search), findsOneWidget);

    // Verify the presence of the notification icon
    expect(find.byIcon(Icons.notifications_none_outlined), findsOneWidget);

    // Verify the presence of the FloatingActionButton
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Verify the presence of product cards
    expect(find.byType(ProductCard), findsNWidgets(3));
  });
}