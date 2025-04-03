import 'package:ecommerce/feature/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/feature/product/presentation/bloc/product_state.dart';
import 'package:ecommerce/feature/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const primaryBlue = Color.fromARGB(255, 63, 81, 243);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("Dispatching GetAllProductEvent...");
    context.read<ProductBloc>().add(GetAllProductEvent());
  });

    String formattedDate = DateFormat('MMM d, y').format(DateTime.now());

    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                                color: const Color.fromARGB(
                                  255,
                                  192,
                                  190,
                                  190,
                                ),
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
      
                // State- dependent content
                _buildProductContent(context, state),
              ],
            ),
          );
        },
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

  Widget _buildProductContent(BuildContext context, ProductState state) {
    print(state);
    if (state is ProductsLoadingState) {
      return Center(child: CircularProgressIndicator(color: primaryBlue));
    } else if (state is ProductsLoadedState) {
      return Column(
        children:
            state.products
                .map(
                  (product) => GestureDetector(
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: product,
                        ),
                    child: ProductCard(
                      imageUrl: product.imageUrl,
                      productName: product.name,
                      productPrice: product.price,
                    ),
                  ),
                )
                .toList(),
      );
    } else if (state is ProductsErrorState) {
      return Center(
        child: Text(state.message, style: TextStyle(color: Colors.red)),
      );
    } else {
      return Center(child: Text("Product not available"));
    }
  }
}
