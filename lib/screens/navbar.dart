import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/screens/home_screen.dart';
import 'package:softwaredesignpatternsapplication/screens/to-do-screen/to-do.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    ToDoScreen(),
    Text('Admin Page')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: screens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        currentIndex: currentindex,
        selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_sharp),
              label: 'To-Do',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Admin',
              backgroundColor: Colors.transparent),
        ],
        onTap: (int newIndex) {
          setState(() {
            currentindex = newIndex;
          });
        },
      ),
    );
  }
}
