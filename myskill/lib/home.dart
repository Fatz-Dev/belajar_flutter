import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: const Icon(Icons.home),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: constraints.maxWidth > 1000
                  ? Row(
                      children: [
                        Expanded(child: Gambar()),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              DataGambar(),
                              SizedBox(height: 20),
                              Judul(),
                              SizedBox(height: 20),
                              Deskripsi(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Gambar(),
                        const SizedBox(height: 20),
                        DataGambar(),
                        SizedBox(height: 20),
                        Judul(),
                        Deskripsi(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class Deskripsi extends StatelessWidget {
  const Deskripsi({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Belajar Flutter dan diatas adaah gambar yang saya ambil dari pixabay yaitu sebuah pohon yang sangat indah',
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal),
      textAlign: TextAlign.left,
    );
  }
}

class Judul extends StatelessWidget {
  const Judul({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Flutter Learning ',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class DataGambar extends StatelessWidget {
  const DataGambar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(EvaIcons.heartOutline, color: Colors.red),
        SizedBox(width: 2),
        Text('10k'),
        const SizedBox(width: 20),
        Icon(EvaIcons.messageCircleOutline),
        SizedBox(width: 2),
        Text('4k'),
        const SizedBox(width: 20),
        Icon(EvaIcons.shareOutline),
        SizedBox(width: 2),
        Text('10'),
        Spacer(),
        Icon(EvaIcons.bookmarkOutline),
        SizedBox(width: 2),
        Text('1k'),
      ],
    );
  }
}

class Gambar extends StatelessWidget {
  const Gambar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
