import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = false;
  bool _isCheck = false;

  String? selectedBahasa = 'ID';

  List<Map<dynamic, dynamic>> bahasa = <Map<dynamic, dynamic>>[
    <dynamic, dynamic>{'id': 'ID', 'title': 'Bahasa Indonesia'},
    <dynamic, dynamic>{'id': 'EN', 'title': 'Bahasa Inggris'},
    <dynamic, dynamic>{'id': 'AR', 'title': 'Bahasa Arab'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Login Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            Text('Selamat datang di aplikasi latihan materi 9'),
            SizedBox(height: 20),
            // dropdown bahasa
            SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                value: selectedBahasa,
                items: bahasa.map<DropdownMenuItem<String>>((
                  Map<dynamic, dynamic> bahasa,
                ) {
                  return DropdownMenuItem<String>(
                    value: bahasa['id'],
                    child: Text(bahasa['title']),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedBahasa = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            // textfield email dan password
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Masukkan email',
                labelText: 'Email',
                icon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // textfield password dengan fitur show/hide password
            TextField(
              controller: _passwordController,
              obscureText: _isVisible ? false : true,
              decoration: InputDecoration(
                hintText: 'Masukkan password',
                labelText: 'Password',
                icon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: Icon(
                    _isVisible
                        ? Icons.visibility_off
                        : Icons.visibility_outlined,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // textbutton lupa password, filledbutton login, dan row daftar
            TextButton(
              onPressed: () {},
              child: Text(
                'Lupa Password',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: _isCheck == true ? () {} : null,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Belum punya akun?'),
                TextButton(onPressed: () {}, child: Text('Daftar')),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCheck = !_isCheck;
                    });
                  },
                ),
                SizedBox(width: 8),
                Expanded(child: Text('Ingat saya')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
