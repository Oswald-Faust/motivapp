import 'package:flutter/material.dart';
import 'package:motivapp/screens/new_screen.dart';
import 'package:motivapp/screens/register_screens.dart';
import 'login_screen.dart';
import 'new_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage(
                  '/home/ofaust/MotivApp/GoZeMap/lib/assets/media-image-9.jpg'), // Assure-toi d'utiliser le chemin correct
              fit: BoxFit.cover, // Remplace par le mode de recadrage souhaité
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    '/home/ofaust/MotivApp/GoZeMap/lib/assets/media-image-9.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/logo.png"),
                SizedBox(height: 16.0),
                Text(
                  'Toujours prêts à vous servir !',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*ElevatedButton(
                    child: Text('Connexion'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                    ),
                    onPressed: () {
                      // Naviguez vers la page de connexion ou d'inscription
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16.0),*/
                  ElevatedButton(
                    child: Text('Bienvenue !'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: const Color.fromARGB(255, 22, 58, 23),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
