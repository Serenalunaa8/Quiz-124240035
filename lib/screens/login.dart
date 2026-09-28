import 'package:flutter/material.dart';
import '../models/user.dart';
import 'destination_list.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (users.any(
      (user) => user.username == username && user.password == password,
    )) {
      setState(() {
        isLoggedin = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DestinationListPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login gagal: username atau password salah"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(163, 249, 155, 174),
        title: Text(
          "Login Page",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _usernameField(_usernameController),
              _passwordField(_passwordController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(163, 249, 155, 174),
                  foregroundColor: Colors.white,
                ),
                child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController usernameController) {
  return Container(
    child: TextField(
      controller: usernameController,
      decoration: InputDecoration(
        hintText: "Masukkan username",
        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color.fromARGB(255, 225, 139, 168), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color.fromARGB(255, 169, 30, 77), width: 1.5),
        ),
      ),
    ),
  );
}


Widget _passwordField(TextEditingController passwordController) {
  return Container(
    child: TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Masukkan password",
        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color.fromARGB(255, 225, 139, 168), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color.fromARGB(255, 169, 30, 77), width: 1.5),
        ),
      ),
    ),
  );
}