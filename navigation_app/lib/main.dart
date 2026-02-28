import 'package:flutter/material.dart';
import 'package:navigation_app/halaman_kedua.dart';
import 'package:navigation_app/halaman_main.dart';
// import 'package:navigation_app/halaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        // '/': (context) {return HalamanUtama();},
        '/': (context) {return HalamanMain();},
        // 'halaman-kedua': (context) {return HalamanKedua(data: "123abcd");},
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == 'halaman-kedua') {
          final data = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return HalamanKedua(data: data);
            }
          );
        }
        return null;
      },  
    );
  }
}

