import 'package:flutter/material.dart';
import 'package:navigation_app/halaman_ketiga.dart';

class HalamanKedua extends StatelessWidget {
  final String data;

  const HalamanKedua({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    // final dataArg = ModalRoute.of(context)?.settings.arguments as String;
    return WillPopScope(
      onWillPop: () async {
        print("User mencoba kembali");
        final shouldBack = await showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Apakah anda yakin ingin kembali?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Ya"),
              ),
            ],
          );
        });
        print('hasil select dialog: $shouldBack');
        return shouldBack;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Halaman Kedua"),
        ),
        body: Column(
          children: [
            Text('data dari halaman utama'),
            Text(data),
            // Text('data dari argument'),
            // Text(dataArg),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("kembali Halaman Utama"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(
                    builder: (context) {
                      return HalamanKetiga();
                    }
                  ),
                  (Route<dynamic> a) {
                    return a.isFirst;
                  } ,
                );
              },
              child: Text("Halaman Ketiga"),
            ),
          ],
        ),
      ),
    );
  }
}