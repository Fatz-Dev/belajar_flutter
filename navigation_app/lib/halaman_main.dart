import 'package:flutter/material.dart';
import 'package:navigation_app/halaman_kedua.dart';
import 'package:navigation_app/halaman_ketiga.dart';
import 'package:navigation_app/halaman_utama.dart';

class HalamanMain extends StatefulWidget {
  const HalamanMain({super.key});

  @override
  State<HalamanMain> createState() => _HalamanMainState();
}

class _HalamanMainState extends State<HalamanMain> {
  // variabel untuk menyimpan index menu yang dipilih
  int selectedMenu = 0;

  // list menu
  List menu = [HalamanUtama(), HalamanKedua(data: "Menu"), HalamanKetiga()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu.elementAtOrNull(selectedMenu),
      appBar: AppBar(title: Text("Halaman Main")),
      drawer: Container(
        width: 200,
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
          children: [
            DrawerHeader(child: Text("Drawer Header")),
            ListTile(
              title: Text("Menu 1"),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  selectedMenu = 0;
                });
              },
            ),
            ListTile(
              title: Text("Menu 2"),
              leading: Icon(Icons.settings),
              onTap: () {
                setState(() {
                  selectedMenu = 1;
                });
              },
            ),
            ListTile(
              title: Text("Menu 3"),
              leading: Icon(Icons.info),
              onTap: () {
                setState(() {
                  selectedMenu = 2;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
        currentIndex: selectedMenu,
        onTap: (index) {
          setState(() {
            selectedMenu = index;
          });
        },
      ),
    );
  }
}
