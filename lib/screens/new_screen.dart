import 'package:flutter/material.dart';
import 'package:motivapp/screens/login_screen.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              // Première page de présentation
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color.fromARGB(255, 61, 194, 49), Colors.green],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ajoutez ici le widget de la roue colorée avec les icônes
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    SizedBox(height: 30),
                    Image.asset("lib/assets/Frame.png"),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 17, 128, 26),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Rapprochez vous de votre cible !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'En un clic, retrouvez-vous parmis cet horizon de possibilités !',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              // Deuxième page de présentation
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Color.fromARGB(255, 3, 119, 7)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/Frame (1).png"),
                    // Ajoutez ici le widget de la roue colorée avec les icônes
                    SizedBox(height: 30),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Raccourcissez le trajet de vos besoins',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'Avoir une visibilité sur quoi, où et quand vous avez besin de vos champions',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: _currentPage == index ? 25 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: InkWell(
              onTap: () {
                if (_currentPage == 1) {
                  // Si nous sommes sur la dernière page, passez à l'écran de connexion
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                } else {
                  // Sinon, passez à la page suivante
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              child: Row(
                children: [
                  Text(_currentPage == 2 ? 'Start' : 'Next',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(width: 4), // Espacement entre le texte et les icônes
                  Icon(Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16), // Définition de la taille de l'icône
                  Icon(Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16), // Définition de la taille de l'icône
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
