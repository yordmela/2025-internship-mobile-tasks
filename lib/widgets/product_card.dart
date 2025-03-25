import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final String productCategory;
  final String productRating;
  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productRating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 366,
      child: Column(
        children: [
          Image.asset(imagePath, height: 160),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  productName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                productPrice,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  productCategory,
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.star,
                color: const Color.fromARGB(255, 255, 215, 0),
                size: 20,
              ),
              Text(
                productRating,
                style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}