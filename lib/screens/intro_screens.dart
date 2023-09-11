import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
                    colors: [Colors.blue, Colors.green],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ajoutez ici le widget de la roue colorée avec les icônes
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.list, size: 50),
                        Icon(Icons.calendar_today, size: 50),
                        Icon(Icons.check_circle, size: 50),
                        Icon(Icons.assignment_turned_in, size: 50),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Organize Your Tasks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'Keep your tasks organized by category, priority, or due date.',
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
                    colors: [Colors.red, Colors.green],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.folder, size: 50),
                        Icon(Icons.event_note, size: 50),
                        Icon(Icons.assignment, size: 50),
                        Icon(Icons.inbox, size: 50),
                      ],
                    ),
                    // Ajoutez ici le widget de la roue colorée avec les icônes
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Rebuild your life',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'Change your process and think different',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              // Troisième page de présentation
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.transparent, Colors.yellow],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.lightbulb, size: 50),
                        Icon(Icons.explore, size: 50),
                        Icon(Icons.new_releases, size: 50),
                        Icon(Icons.science, size: 50),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Achieve your goals',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'Use innovate process to change your habits ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    // Ajoutez d'autres éléments à la page, comme des images, des icônes, du texte, etc.
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
                3,
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
                if (_currentPage == 2) {
                  // Si nous sommes sur la dernière page, passez à l'écran de connexion
                  Navigator.pushReplacementNamed(context,
                      '/lib/screens/login_screen.dart'); // Utilisez la route vers l'écran de connexion
                } else {
                  // Sinon, passez à la page suivante
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              child: Text(_currentPage == 2 ? 'Start' : 'Next',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
