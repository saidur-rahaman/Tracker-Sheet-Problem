import 'package:flutter/material.dart';

// Create an app that displays images in a grid layout using GridView.
// The images can be placeholders or from URLs.
// Include some padding between items and ensure the layout is responsive.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Grid View',
      home: ImageGrid(),
    );
  }
}

class ImageGrid extends StatelessWidget {
  ImageGrid({super.key});
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1558685028-c8176074f090?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZSUyMGltYWdlcyUyMGNhcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1645583105436-282dc325839c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZyZWUlMjBpbWFnZXMlMjBjYXJ8ZW58MHx8MHx8fDA%3D',
    'https://images.pexels.com/photos/919073/pexels-photo-919073.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/136872/pexels-photo-136872.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1637859/pexels-photo-1637859.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/761815/pexels-photo-761815.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];
  final List<String> placeholderImages = [
    'assets/images/car.jpg',
    'assets/images/car2.jpg',
    'assets/images/car3.jpg',
    'assets/images/car4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Image Grid View'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.cyanAccent[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Url Based Images',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrls[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 10), // Add some space between the two grids
              Container(
                decoration: BoxDecoration(
                  color: Colors.cyanAccent[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Placeholder Based Images',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: placeholderImages
                      .length, // Ensure itemCount matches the list length
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(placeholderImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
