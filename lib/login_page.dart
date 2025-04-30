import 'package:app_erpp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_erpp/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // Controla a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Image(
          image: NetworkImage(
            "https://files.cdn-files-a.com/uploads/8880281/400_filter_nobg_67d43c3f11dc3.png",
          ),
          width: 140,
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 29, 27, 27),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 46, 95, 180),
              Color.fromARGB(255, 35, 76, 146),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            const CupertinoTextField(
              padding: EdgeInsets.all(10),
              placeholder: "Digite o seu Usuário",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CupertinoTextField(
                  padding: const EdgeInsets.all(10),
                  placeholder: "Digite a sua Senha",
                  obscureText: _obscureText,
                  placeholderStyle: const TextStyle(
                    color: Color.fromARGB(241, 232, 230, 230),
                    fontSize: 14,
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.white,
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
