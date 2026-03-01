import 'package:flutter/material.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({super.key});

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page>
    with SingleTickerProviderStateMixin {
  // untuk animasi perpindahan
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // membuat controller animasi dengan durasi 2 detik
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // membuat animasi dengan kurva
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // memulai animasi
    _animationController.forward();

    super.initState();
  }


  @override
  void dispose() {
    
    // membuang controller animasi saat widget dihapus
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home 2 Page")),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purple,
            child: Text("Home 2"),
          ),
        ),


      )
    );
  }
}
