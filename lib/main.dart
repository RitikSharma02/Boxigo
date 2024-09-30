import 'package:flutter/material.dart';

import 'Screens/Home_Screen.dart';
import 'Screens/Leads_Page.dart';
import 'Screens/More_Page.dart';
import 'Screens/Reports_Page.dart';
import 'Screens/Tasks_Page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LeadsTabNavigator(),
    const TasksPage(),
    const ReportsPage(),
    const MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_alt_outlined), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.task_outlined), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: 'More'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}














