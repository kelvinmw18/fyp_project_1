import 'package:flutter/material.dart';
import 'package:fyp_project_1/screens/favourite_player.dart';
import 'package:fyp_project_1/screens/prediction.dart';
import 'package:fyp_project_1/screens/profile.dart';
import 'package:fyp_project_1/screens/ranking.dart';
import 'package:fyp_project_1/screens/welcome.dart';
import 'package:fyp_project_1/screens/rating.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Your theme data
      ),
      home: const Welcome(), // Set RankingScreen as the initial route
    );
  }
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define your screens here
  final List<Widget> _screens = <Widget>[
    RankingScreen(),// Your RankingScreen
    const PlayerSelectionScreen(),// Your RatingScreen
    PredictionScreen(), // Your PredictionScreen
    FavoriteScreen(), // Your FavouriteScreen
    ProfileScreen(), // Your ProfileScreen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Ranking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: "Rating",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard),
            label: "Prediction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

