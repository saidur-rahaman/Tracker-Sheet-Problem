import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Build a custom Card widget that has an image, a title, a subtitle, and a description.
// Ensure it has smooth animations (like hover effect) when tapped.
// Use this custom widget in a ListView to display a list of items.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Flower Shop',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Map<String, String>> products = [
    {
      "image":
          "https://flowers-square.com/cdn/shop/files/Beigebox_4XLarge.jpg?v=1738258966&width=1400",
      "title": "Red Roses",
      "subtitle": "Bright and cheerful for every mood",
      "description":
          "Red Roses Box a charming euphoria. New Era in Floristry.\n- 180 Premium Roses.\n- Height: 50 cm Width: 60 Cm\n- Get a 30 AED gift voucher with this order.\n- Free Delivery above 250 AED.\n- Farm Fresh flowers."
    },
    {
      "image":
          "https://flowers-square.com/cdn/shop/files/Whitehydrangeaboxlarge2.jpg?v=1738518770&width=1400",
      "title": "White Hydrangea",
      "subtitle": "Luxury in every petal",
      "description":
          "Hydrangea Box a charming euphoria. New Era in Floristry.\n- 8 White Hydrangea\n- Height: 30 Cm Width: 25 Cm\n- Get a 30 AED gift voucher with this order.\n- Free Delivery above 250 AED.\n- Farm Fresh flowers."
    },
    {
      "image":
          "https://flowers-square.com/cdn/shop/files/17_FlowersquareSmall_1_611b6777-5d28-486f-9846-7de9f10664ac.jpg?v=1739136624&width=1400",
      "title": "Sunshine Tulips",
      "subtitle": "Calm, soothing, and elegant",
      "description":
          "Our Sunshine Tulips will brighten up any room!\nThe beautiful box contains white and\nyellow tulips sure to make a lasting impression.\nGet your hands on these vibrant blooms and\nadd a delightful splash of color to your home.\n\nSize and Flowers\nHeight: 40 Cm Width 35 Cm\nFlowers: 50 White and Yellow Tulips."
    },
    {
      "image":
          "https://flowers-square.com/cdn/shop/files/ChristmasFlowerBox.png?v=1716807474&width=1400",
      "title": "Mixed Flower",
      "subtitle": "Simplicity with a smile",
      "description":
          "Perfect for gifting or decorating,\nour Flower Box is sure to spread holiday happiness.\n\nFlowers and Size\nHeight: 50 Cm Width: 45 Cm\nFlowers: Roses, Brassica, Chrysanthemum,\nAlstroemeria, Daisies, Sunflower, Christmas toys,\nPine Branches, Pines and other Greenery."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bloom for You',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.lobster().fontFamily,
            ),
          ),
          backgroundColor: Colors.pinkAccent.shade100,
          toolbarHeight: 50,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView takes only the required height
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: .42, // Adjust aspect ratio for card height
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    image: products[index]['image']!,
                    title: products[index]['title']!,
                    subtitle: products[index]['subtitle']!,
                    description: products[index]['description']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });
  final String image;
  final String title;
  final String subtitle;
  final String description;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Builder(builder: (context) {
        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isHovered ? Colors.pinkAccent[100] : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    widget.image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.shade100,
                          fontFamily: GoogleFonts.cormorant().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontFamily: GoogleFonts.tienne().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
