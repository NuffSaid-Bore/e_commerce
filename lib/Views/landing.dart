import 'package:e_commerce/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedIndex =0;
  final List pages = const [
    Home(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.deepPurple.shade400,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            
          });
          selectedIndex = value;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.search_normal), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Iconsax.notification), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],),
        body: pages[selectedIndex],
    );
  }
}