import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/general_screens/home_page.dart';
import 'screens/general_screens/territories_page.dart';
import 'screens/general_screens/map_page.dart';
import 'screens/flash_screens/login.dart';
import 'package:min_assist/providers/congregation_provider.dart';
import 'package:min_assist/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(
    ChangeNotifierProvider(
      create: (_) => CongregationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ministry Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageDisplayed(),
    );
  }
}

class PageDisplayed extends StatefulWidget {
  const PageDisplayed({Key? key}) : super(key: key);

  @override
  State<PageDisplayed> createState() => _PageDisplayedState();
}

class _PageDisplayedState extends State<PageDisplayed> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  final AuthService _authService = AuthService();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 1; // Set the home page as the default page
    _widgetOptions = [
      const TerritoryPage(),
      const HomePage(),
      const MapPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Future.value(
          _authService.isSignedIn()), // check if the user is signed in or not
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          // if the future completes successfully and returns data, continue with the logic
          bool isSignedIn = snapshot.data!;
          if (isSignedIn) {
            // if the user is signed in, display the HomePage widget
            return Scaffold(
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.folder),
                    label: 'Territories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_outlined),
                    label: 'Map',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            );
          } else {
            // if the user is not signed in, display the LoginPage widget
            return LoginPage();
          }
        } else {
          // if the future has not yet completed, display a loading indicator
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
