import 'package:animated_app/home2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isexpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isexpanded = !_isexpanded;
            });
          },
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _isexpanded ? 300 : 100,
                height: _isexpanded ? 300 : 100,
                curve: Curves.easeInOut,
                color: _isexpanded ? Colors.blue : Colors.red,
              
                child: Text("Tap Me"),
              ),

              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 300), 
                duration: Duration(seconds: 3), 
                builder: (context, value, child) {
                  return Container(
                    width: value,
                    height: value,
                    color: Colors.green,
                    child: Text("Tween Animation"),
                  );
                }
              ),

            FilledButton(
              onPressed: () {
                // animasi perpindahan
                Navigator.of(context).push(_createRoute());
              },
              child: Text("Go to Home2"),
            )

            ],
          ),
        ),
      ),
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder:(context, animation, secondaryAnimation) => Home2Page(),
    transitionsBuilder:(context, animation, secondaryAnimation, child) {
      var tween = Tween(
        begin: Offset(1.0, 0), 
        end: Offset.zero,
      );
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}