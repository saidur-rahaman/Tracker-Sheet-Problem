import 'package:flutter/material.dart';
// Create a side drawer that slides in from the left when a button is pressed, with custom animation.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: toggleDrawer,
        ),
        backgroundColor: Colors.red[400],
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Main Content'),
          ),
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              width: 250,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text('Home',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text('Settings',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text('Logout',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle navigation
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
