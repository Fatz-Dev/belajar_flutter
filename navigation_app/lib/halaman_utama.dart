import 'package:flutter/material.dart';
// import 'halaman_kedua.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Utama")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return HalamanKedua(
            //         data: "123abcd"
            //       );
            //     }
            //   ),
            // );
            Navigator.pushNamed(context, 'halaman-kedua', arguments: "ARG-001");
          },
          child: const Text("Go to Halaman Kedua"),
        ),
      ),
    );
  }
}
