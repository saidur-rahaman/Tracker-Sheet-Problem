import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Build an app that displays an image from the local assets.
// Set up your pubspec.yaml file properly to include the asset.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBarExample(),
    );
  }
}

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});
  @override
  BottomNavBarExampleState createState() => BottomNavBarExampleState();
}

class BottomNavBarExampleState extends State<BottomNavBarExample> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Search(),
    Profile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
        body: _pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Map<String, String>> products = [
    {
      "image": "assets/images/1st.jpg",
      "title": "Red Roses",
      "subtitle": "Bright and cheerful for every mood",
      "description":
          "Red Roses Box a charming euphoria. New Era in Floristry.\n- 180 Premium Roses.\n- Height: 50 cm Width: 60 Cm\n- Get a 30 AED gift voucher with this order.\n- Free Delivery above 250 AED.\n- Farm Fresh flowers."
    },
    {
      "image": "assets/images/2nd.jpg",
      "title": "White Hydrangea",
      "subtitle": "Luxury in every petal",
      "description":
          "Hydrangea Box a charming euphoria. New Era in Floristry.\n- 8 White Hydrangea\n- Height: 30 Cm Width: 25 Cm\n- Get a 30 AED gift voucher with this order.\n- Free Delivery above 250 AED.\n- Farm Fresh flowers."
    },
    {
      "image": "assets/images/3rd.jpg",
      "title": "Sunshine Tulips",
      "subtitle": "Calm, soothing, and elegant",
      "description":
          "Our Sunshine Tulips will brighten up any room!\nThe beautiful box contains white and\nyellow tulips sure to make a lasting impression.\nGet your hands on these vibrant blooms and\nadd a delightful splash of color to your home.\n\nSize and Flowers\nHeight: 40 Cm Width 35 Cm\nFlowers: 50 White and Yellow Tulips."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: .42,
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
    );
  }
}

class ProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
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
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent.shade100,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Search',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade100,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent.shade100,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Emtiaz Ahmed',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent.shade100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent.shade100,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'demo@gmail.com',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
