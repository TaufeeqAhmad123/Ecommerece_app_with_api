
import 'package:ecommerece_app_api/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.3,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isImageLoading = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        height: 256,
        width: 195,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 227, 227),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: widget.aspectRetio,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // ✅ Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.network(
                          widget.product.images[0],
                          fit: BoxFit.cover,
                          frameBuilder:
                              (
                                BuildContext context,
                                Widget child,
                                int? frame,
                                bool wasSynchronouslyLoaded,
                              ) {
                                if (wasSynchronouslyLoaded || frame != null) {
                                  if (_isImageLoading) {
                                    WidgetsBinding.instance.addPostFrameCallback((
                                      _,
                                    ) {
                                      if (mounted) {
                                        setState(() {
                                          _isImageLoading = false;
                                        });
                                      }
                                    });
                                  }
                                  return child;
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                        ),
                      ),
                    ),
      
                    // ✅ Shimmer overlay
                    if (_isImageLoading)
                      Positioned.fill(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
      
              const SizedBox(height: 8),
      
              Text(
                widget.product.title,
                style: GoogleFonts.ibmPlexSans(color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: GoogleFonts.ibmPlexSans(color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Rating : ',
                    style:GoogleFonts.ibmPlexSans(color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.product.rating.toString(),
                    style: GoogleFonts.ibmPlexSans(color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  // Text(
                  //   'Category : ',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontFamily: 'poppins',
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    widget.product.category.toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
