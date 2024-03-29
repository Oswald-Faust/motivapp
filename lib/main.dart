import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motivapp/screens/intro_screens.dart';
import 'package:motivapp/screens/login_screen.dart';
import 'package:animated_check/animated_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    // Créer le contrôleur d'animation avec une durée de 10 secondes
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    // Créer le Tween d'animation avec les couleurs de départ et d'arrivée
    _animation = ColorTween(begin: Colors.white, end: Colors.green)
        .animate(_animationController);
    // Ajouter un écouteur à l'animation pour appeler setState à chaque changement de valeur
    _animation.addListener(() {
      setState(() {});
    });
    // Ajouter un StatusListener à l'animation pour détecter quand l'animation est terminée
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Naviguer vers l'écran suivant
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreen()),
        );
      }
    });
    // Lancer l'animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utiliser la valeur de l'animation pour la couleur du fond
      backgroundColor: _animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Column(
                children: [
                  Container(),
                  SizedBox(height: 40.0),
                  Image.asset("lib/assets/logo.png"),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.0),
          // Utiliser la valeur de l'animation pour la visibilité de la barre de progression
          Visibility(
            visible: _animation.value == Colors.white,
            child: LinearProgressIndicator(
              value: _animationController.isAnimating ? null : 1.0,
              color: const Color.fromARGB(255, 44, 204, 49),
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }
}

class Project {
  String name;
  final DateTime startDate;
  final DateTime endDate;
  Project({required this.name, required this.startDate, required this.endDate});
}

class Task {
  final String name;
  final DateTime date;
  final String description;
  bool isCompleted;

  Task(
      {required this.name,
      required this.description,
      required this.date,
      this.isCompleted = false});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Project> projects = [];
  List<Task> allTasks = [];
  List<Task> openTasks = [];
  List<Task> closedTasks = [];
  List<Task> archivedTasks = [];

  final List<Color> predefinedColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _addProject(Project project) {
    setState(() {
      projects.add(project);
    });
  }

  void _addTask(Task task) {
    setState(() {
      allTasks.add(task);
      openTasks.add(task);
    });
  }

  void _completeTask(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;

      if (task.isCompleted) {
        // Si la tâche est cochée, déplacez-la dans la liste "Closed"
        openTasks.remove(task);
        closedTasks.add(task);
      } else {
        // Si la tâche est décochée, déplacez-la dans la liste "Open"
        closedTasks.remove(task);
        openTasks.add(task);
      }
    });
  }

  final Random _random = Random();

  Color _getRandomColor() {
    return Color.fromRGBO(
      _random.nextInt(1),
      _random.nextInt(1),
      _random.nextInt(1),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Test Name"),
                accountEmail: Text("@testname001"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "T",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  // Mettez à jour l'état de l'application
                  // ...
                  // Puis fermez le tiroir
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Groups'),
                onTap: () {
                  // Affiche un SnackBar avec le message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Les menus seront bientôt disponibles dans la version V.2 du projet.'),
                    ),
                  );
                  // Ferme le tiroir
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tell a friend'),
                onTap: () {
                  // Affiche un SnackBar avec le message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Les menus seront bientôt disponibles dans la version V.2 du projet.'),
                    ),
                  );
                  // Ferme le tiroir
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Information'),
                onTap: () {
                  // Affiche un SnackBar avec le message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Les menus seront bientôt disponibles dans la version V.2 du projet.'),
                    ),
                  );
                  // Ferme le tiroir
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Affiche un SnackBar avec le message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Les menus seront bientôt disponibles dans la version V.2 du projet.'),
                    ),
                  );
                  // Ferme le tiroir
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  // Afficher une boîte de dialogue de confirmation
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation de la déconnexion'),
                        content:
                            Text('Souhaitez-vous vraiment vous en aller  ?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Annuler'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Fermer la boîte de dialogue
                            },
                          ),
                          TextButton(
                            child: Text('Déconnecter'),
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
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('A.png'),
                ),
                title: Row(
                  // Utilisez un Row pour contenir le nom et l'icône
                  children: [
                    Expanded(
                      // Pour que le nom occupe tout l'espace disponible
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Test Time',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                              height:
                                  5), // Ajoute un espace vertical de 5 points
                          Text('Hello, my Tester !'),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment
                          .bottomRight, // Alignez l'icône en bas à droite
                      child: Container(
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle, // Le conteneur sera circulaire
                          color: Colors.white, // Couleur du cercle (rond)
                          border: Border.all(
                            color: Colors.black, // Couleur de la bordure
                            width: 0.2, // Largeur de la bordure
                          ),
                        ),
                        padding:
                            EdgeInsets.all(10), // Ajustez la taille du cercle
                        child: FaIcon(
                          FontAwesomeIcons
                              .bell, // Icône de la cloche de notification
                          size: 24, // Taille de l'icône
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Find your Task, Projects...",
                    prefixIcon: Icon(FontAwesomeIcons
                        .search), // Utilisez FontAwesomeIcons.search ici
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                      gapPadding: 8.0,
                    ),
                    // Personnalisation de la taille du texte et de l'icône
                    labelStyle: TextStyle(fontSize: 18.0), // Taille du texte
                    // Personnalisation de l'espacement entre l'icône et le texte
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Project${projects.length != 1 ? 's' : ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'You have ',
                        style: TextStyle(
                          fontSize: 20, // Taille de la police pour ce segment
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${projects.length}',
                        style: TextStyle(
                          fontSize: 20, // Taille de la police pour ce segment
                          color: Colors.blue, // Couleur bleue pour le nombre
                        ),
                      ),
                      TextSpan(
                        text: ' project${projects.length != 1 ? 's' : ''}',
                        style: TextStyle(
                          fontSize: 20, // Taille de la police pour ce segment
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent
                        .withOpacity(0.3), // Couleur bleue peu foncée
                    borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  ),
                  child: TextButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProjectPage()),
                      );
                      if (result != null) {
                        _addProject(result);
                      }
                    },
                    icon: Icon(Icons.add,
                        color:
                            Colors.blueAccent), // Couleur blanche pour l'icône
                    label: Text(
                      'Add',
                      style: TextStyle(
                        color:
                            Colors.blueAccent, // Couleur blanche pour le texte
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.lightBlueAccent,
                      elevation:
                          5, // Ajoute une légère ombre pour mettre en évidence la carte
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Ajoute des bordures arrondies
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Aligne les éléments au bout de la carte
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      20.0), // Espacement à gauche et en haut
                                  child: Text(
                                    projects[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          26, // Augmente la taille de l'écriture du nom du projet
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (String value) {
                                    if (value == 'edit') {
                                      // Navigation vers la page de modification du projet avec le projet en cours
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ModifyProjectPage(
                                                  projects[index]),
                                        ),
                                      );
                                    } else if (value == 'delete') {
                                      // Supprimer le projet
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                'Confirmation de la suppression'),
                                            content: Text(
                                                'Voulez-vous vraiment supprimer ce projet ?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Supprimer'),
                                                onPressed: () {
                                                  // Ajoutez ici la logique de suppression du projet
                                                  // Après la suppression, vous devrez également mettre à jour votre liste de projets
                                                  setState(() {
                                                    projects.removeAt(index);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 72.0,
                                left: 200,
                              ), // Ajoutez un padding vers le bas
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Pour que la ligne ne prenne que la largeur nécessaire
                                children: [
                                  Icon(
                                    Icons
                                        .calendar_month_sharp, // Utilisez l'icône de calendrier ici
                                    size: 30, // Taille de l'icône
                                    color: Colors.white, // Couleur de l'icône
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    '${DateFormat('MMM d').format(projects[index].startDate)}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              ListTile(
                title: Text(
                  "Today's Task",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    DateFormat('EEEE, d MMMM').format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskPage(),
                        ),
                      );
                      if (result != null) {
                        _addTask(result);
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.blueAccent,
                    ),
                    label: Text(
                      'New Task',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                tabs: [
                  _buildTab('All', allTasks.length),
                  _buildTab('Open', openTasks.length),
                  _buildTab('Closed', closedTasks.length),
                  _buildTab('Archived', archivedTasks.length),
                ],
              ),
              SizedBox(height: 24),
              Container(
                height: 200,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTaskList(allTasks),
                    _buildTaskList(openTasks),
                    _buildTaskList(closedTasks),
                    _buildTaskList(archivedTasks),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildTab(String title, int count) {
    return Tab(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 3),
          Container(
            width: 13, // Ajustez la taille du cercle
            //height: ,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                '$count',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ), // Ajoutez un espacement entre le cercle et le texte
        ],
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final formattedDate =
            DateFormat('d MMMM').format(tasks[index].date.toLocal());
        final taskText = tasks[index].name;
        final taskDescription = tasks[index].description;
        final isCompleted = tasks[index].isCompleted;
        return Container(
          width: 300, // Largeur du conteneur
          height: 130, // Hauteur du conteneur
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Stack(
                children: [
                  if (isCompleted)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 2, // Épaisseur du trait
                          color: Colors.black, // Couleur du trait
                        ),
                      ),
                    ),
                  Text(
                    taskText,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    tasks[index].isCompleted = !tasks[index].isCompleted;

                    if (tasks[index].isCompleted) {
                      // Si la tâche est cochée, déplacez-la vers Closed
                      openTasks.remove(tasks[index]);
                      closedTasks.add(tasks[index]);
                    } else {
                      // Si la tâche est décochée, déplacez-la vers Open
                      closedTasks.remove(tasks[index]);
                      openTasks.add(tasks[index]);
                    }
                  });
                },
                child: Container(
                  width: 24, // Ajustez la taille du cercle
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Couleur de la bordure
                      width: 2, // Épaisseur de la bordure
                    ),
                  ),
                  child: tasks[index].isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16, // Ajustez la taille de la coche
                          color: Colors.black, // Couleur de la coche
                        )
                      : null, // Laissez le cercle vide si la tâche n'est pas cochée
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskDescription,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Divider(
                    color: Colors.grey, // Couleur du trait
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  // Ajoutez la description de la tâche sous la date
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  double _importance = 0;
  DateTime? _date;
  TimeOfDay? _time;
  String? _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Project')),
      backgroundColor: Colors.blueGrey.shade200, // Couleur de fond de la page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'New Project',
                labelStyle: TextStyle(color: Colors.white), // Couleur du texte
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // Couleur de la bordure
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // Couleur de la bordure
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Couleur du texte
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white), // Couleur du texte
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // Couleur de la bordure
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // Couleur de la bordure
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Couleur du texte
              ),
            ),
            SizedBox(height: 8),
            Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Alignement des éléments
                children: [
                  Text('Not Important',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18)), // Couleur et taille du texte
                  Text('Important',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18)), // Couleur et taille du texte
                ]),
            Slider(
              value: _importance,
              onChanged: (double value) {
                setState(() {
                  _importance = value;
                });
              },
              min: 0,
              max: 1,
              activeColor:
                  Colors.white, // Couleur de la partie active du curseur
              inactiveColor: Colors.white
                  .withOpacity(0.3), // Couleur de la partie inactive du curseur
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        setState(() => _date = date);
                      }
                    },
                    child: Text(
                      _date == null
                          ? 'Date'
                          : 'Date : ${DateFormat.yMd().format(_date!)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18), // Couleur et taille du texte
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (time != null) {
                        setState(() => _time = time);
                      }
                    },
                    child: Text(
                      _time == null
                          ? 'Time'
                          : 'Time : ${_time!.format(context)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18), // Couleur et taille du texte
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: _category,
              items: ['Entertaiment', 'Work']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style:
                          TextStyle(color: Colors.white)), // Couleur du texte
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _category = newValue;
                });
              },
              hint: Text('Category',
                  style: TextStyle(color: Colors.white)), // Couleur du texte
              dropdownColor: Colors.purple, // Couleur de fond du menu déroulant
              iconEnabledColor: Colors.white, // Couleur de l'icône
              underline:
                  Container(), // Supprime la ligne sous le menu déroulant
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Alignement des éléments
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(
                      context), // Votre code pour gérer l'appui sur le bouton Annuler
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18)), // Couleur et taille du texte
                ),
                ElevatedButton(
                  onPressed: _nameController.text.isEmpty ||
                          _descriptionController.text.isEmpty ||
                          _date == null ||
                          _time == null ||
                          _category == null
                      ? null
                      : () => Navigator.pop(
                            context,
                            Project(
                              name: _nameController.text,
                              // description: _descriptionController.text,
                              // importance: _importance,
                              startDate:
                                  _date!, // Ajout de l'argument startDate
                              endDate: _date!, // Ajout de l'argument endDate
                              // category: _category!,
                            ),
                          ),
                  child: Text('Confirm', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
                labelStyle: TextStyle(color: Colors.blue), // Couleur du texte
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0), // Couleur de la bordure
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0), // Couleur de la bordure
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue, // Couleur du texte
              ),
            ),
            SizedBox(height: 8),
            TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: 'Task Description',
                    border: OutlineInputBorder())),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() => _date = date);
                      }
                    },
                    child: Text(
                        _date == null ? 'Date' : 'Date : ${_date!.toLocal()}'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: _nameController.text.isEmpty ||
                        _descriptionController.text.isEmpty
                    ? null
                    : () => Navigator.pop(
                        context,
                        Task(
                            name: _nameController.text,
                            description: _descriptionController.text,
                            date: _date!)),
                child: Text('Valider', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

class ModifyProjectPage extends StatefulWidget {
  final Project project;

  ModifyProjectPage(this.project);

  @override
  _ModifyProjectPageState createState() => _ModifyProjectPageState();
}

class _ModifyProjectPageState extends State<ModifyProjectPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.project.name;
    _startDate = widget.project.startDate;
    _endDate = widget.project.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modify Project')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Project Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _startDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() => _startDate = date);
                    }
                  },
                  child: Text(
                    _startDate == null
                        ? 'Start Date'
                        : 'Start Date : ${_startDate!.toLocal()}',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _endDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() => _endDate = date);
                    }
                  },
                  child: Text(
                    _endDate == null
                        ? 'End Date'
                        : 'End Date : ${_endDate!.toLocal()}',
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Créez un nouveau projet avec les modifications
                final modifiedProject = Project(
                  name: _nameController.text,
                  startDate: _startDate ?? widget.project.startDate,
                  endDate: _endDate ?? widget.project.endDate,
                );

                // Retournez à la page précédente avec le projet mis à jour
                Navigator.pop(context, modifiedProject);
              },
              child:
                  Text('Save Changes', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
