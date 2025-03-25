import 'package:ecommerce/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchPage displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SearchPage(),
      ),
    );

    // Verify the presence of the back button
    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);

    // Verify the presence of the search product text
    expect(find.text('Search Product'), findsOneWidget);

    // Verify the presence of the filter icon
    expect(find.byIcon(Icons.filter_list), findsOneWidget);

    // Verify the presence of the category text
    expect(find.text('Category'), findsOneWidget);

    // Verify the presence of the category text field
    expect(find.byType(TextField), findsOneWidget);

    // Verify the presence of the price text
    expect(find.text('Price'), findsOneWidget);

    // Verify the presence of the range slider
    expect(find.byType(RangeSlider), findsOneWidget);

    // Verify the presence of the apply button
    expect(find.text('Apply'), findsOneWidget);
  });
}