import 'package:flutter/material.dart';
import 'register_screens.dart';
import 'intro_screens.dart';
import 'maps_screen.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("lib/assets/logo.png"),
        title: Text('On Course !'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Connexion'),
              onTap: () {
                Navigator.pop(context);
                // Ajoutez votre logique de navigation pour la page d'accueil ici
              },
            ),
            ListTile(
              title: Text('Inscription'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Les menus seront bientôt disponibles dans la version V.2 du projet.'),
                  ),
                );
                Navigator.pop(context);
                // Ajoutez votre logique de navigation pour la page des groupes ici
              },
            ),
            ListTile(
              title: Text('Voir la map'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapsScreen()),
                );
              },
            ),
            // Ajoutez d'autres éléments de menu selon vos besoins
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                  16.0), // Ajoute des marges de 16 pixels de tous les côtés
              child: Align(
                alignment: Alignment.center,
                child: Text('Connexion',
                    style:
                        TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 132.0),
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Identifiant',
                      hintText: 'exemple@gmail.com',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.lock, color: Colors.grey),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      hintText: 'Mot de passe',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // TODO: implement login logic
              },
              child: Text('Valider'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                  "lib/assets/Rectangle 4081.png", // Remplace avec le chemin de l'image correct
                  width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
