import 'package:flutter/material.dart';
import 'package:motivapp/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MotivApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed:
                    () {}, // Votre code pour gérer l'oubli du mot de passe
                child: Text('Forgot Password?',
                    style: TextStyle(color: Colors.white)), // Couleur du texte
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Votre code pour gérer la connexion
                },
                child: Text('Log In', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Couleur de fond du bouton
                  onPrimary: Colors.white, // Couleur du texte du bouton
                ),
              ),
              SizedBox(height: 8),
              Text('Or', style: TextStyle(color: Colors.white)),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Votre code pour gérer la connexion avec Google
                },
                child: Text(' Log In with Google   ',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Couleur de fond du bouton
                  onPrimary: Colors.white, // Couleur du texte du bouton
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Votre code pour gérer la connexion avec Facebook
                },
                child: Text('Log In with Facebook',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Couleur de fond du bouton
                  onPrimary: Colors.white, // Couleur du texte du bouton
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed:
                    () {}, // Votre code pour gérer la création d'un nouveau compte
                child: Text('  Create a new account  ',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Couleur de fond du bouton
                  onPrimary: Colors.white, // Couleur du texte du bouton
                ), // Couleur du texte
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Naviguez vers l'écran principal sans demander à l'utilisateur de se connecter
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: 'MotivApp - Change ta vie !')),
                  );
                }, // Votre code pour gérer le saut de l'écran de connexion
                child: Text('Skip',
                    style: TextStyle(color: Colors.white)), // Couleur du texte
              ),
            ],
          ),
        ),
      ),
    );
  }
}
