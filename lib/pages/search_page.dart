import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static final TextEditingController _categoryController = TextEditingController();
  // static final TextEditingController _searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: '4',
        imagePath: 'assets/boots.png',
        name: 'Derby Leather Shoes',
        price: "\$150",
        category: "Men's shoe",
        rating: '4.5',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
      ),
      Product(
        id: '4',
        imagePath: 'assets/boots.png',
        name: 'Oxford Leather Shoes',
        price: "\$150",
        category: "Men's shoe",
        rating: '4.5',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
      ),
      Product(
        id: '4',
        imagePath: 'assets/boots.png',
        name: 'Oxford Leather Shoes',
        price: "\$150",
        category: "Men's shoe",
        rating: '4.5',
        description:
            'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 322,
                      child: Row(
                        children: [
                          Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Transform.translate(
                        offset: Offset(2, 0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: const Color.fromARGB(255, 63, 81, 243),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Search Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 100, 98, 98),
                      ),
                    ),
                  ],
                ),
              )])),

                    SizedBox(height: 30),

                    Row(
                      children: [
                        Container(
                          width: 250,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 195, 195, 197),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Leather',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                            255,
                                            182,
                                            177,
                                            177,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: const Color.fromARGB(255, 63, 81, 243),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 63, 81, 243),
                          ),
                          child: Icon(Icons.filter_list, color: Colors.white),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    // List of products using Card
                    ...products.map(
                      (product) => GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: product,
                            ),
                        child: ProductCard(
                          imagePath: product.imagePath,
                          productName: product.name,
                          productPrice: product.price,
                          productCategory: product.category,
                          productRating: product.rating,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Category',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10),
            Container(
              width: 366,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 195, 195, 197),
                ),
              ),
              child: TextField(
                controller: _categoryController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Price',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),

            RangeSlider(
              values: RangeValues(20, 80),
              min: 0,
              max: 100,
              labels: RangeLabels("20", "80"),
              onChanged: (value) {},
              activeColor: const Color.fromARGB(
                255,
                63,
                81,
                243,
              ), // Color between thumbs
              inactiveColor: Colors.grey, // Color outside thumbs
            ),
            SizedBox(height: 20),
            Container(
              width: 366,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 63, 81, 243),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Apply',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
