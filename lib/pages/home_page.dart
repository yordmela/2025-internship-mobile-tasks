import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const primaryBlue = Color.fromARGB(255, 63, 81, 243);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM d, y').format(DateTime.now());

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 219, 216, 216),
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 192, 190, 190),
                          ),
                        ),
                  
                        Row(
                          children: [
                            Text(
                              'Hello,',
                              style: GoogleFonts.sora(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                  
                            Text(
                              'Yohannes',
                              style: GoogleFonts.sora(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Spacer(),

                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 215, 215),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          size: 24,
                          color: const Color.fromARGB(255, 139, 139, 139),
                        ),
                        Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available Products",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/search'),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromARGB(255, 221, 218, 218),
                      ),
                    ),
                    child: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 152, 150, 150),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: primaryBlue,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),
    );
  }
}
