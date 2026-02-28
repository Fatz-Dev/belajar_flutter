import 'package:flutter/material.dart';

class HalamanKetiga extends StatelessWidget {
  const HalamanKetiga({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Ketiga"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("kembali Halaman Utama"),
        ),
      ),
    );
  }
}