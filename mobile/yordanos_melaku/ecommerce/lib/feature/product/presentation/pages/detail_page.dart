import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/feature/product/domain/entities/product.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/feature/product/presentation/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(product.imageUrl, height: 286, fit: BoxFit.cover),
                Positioned(
                  top: 30,
                  left: 15,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: IconButton(
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
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Men's shoe",
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: const Color.fromARGB(255, 255, 215, 0),
                        size: 20,
                      ),
                      Text(
                        '4.0',
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        product.price,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Size:',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),
                  // slider
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 60, // Fixed height
                      viewportFraction: 0.2, // Show 3 items at a time
                      enableInfiniteScroll:
                          false, // Disable infinite scroll if needed
                      autoPlay: false, // Disable auto-scroll
                      scrollDirection: Axis.horizontal,
                      padEnds: false, // Remove padding at ends
                    ),
                    items:
                        [39, 40, 41, 42, 43, 44, 45].map((item) {
                          return Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              color:
                                  (item == 41)
                                      ? const Color.fromARGB(255, 63, 81, 243)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text(item.toString())),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 50),

                  Text(
                    product.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),

                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Dispatching DeleteProductEvent...");
                          context.read<ProductBloc>().add(
                            DeleteProductEvent(id: product.id),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Product deleted successfully"),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 152,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Delete',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPage(product: product),
                              ),
                            ),
                        child: Container(
                          width: 152,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 63, 81, 243),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Update',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
