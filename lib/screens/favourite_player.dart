import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String selectedClub = '';
  String selectedPlayer = '';
  String selectedPlayerImage = '';
  bool editPressed = false;
  bool isSaved = false;

  void _selectClub() async {
    if (!editPressed) return;
    List<String> clubs = [
      'Manchester United',
      'Manchester City',
      'Liverpool FC',
      'Arsenal FC',
      'Chelsea FC'
    ];

    String club = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Club'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: clubs.map((club) {
              return ListTile(
                title: Text(club),
                onTap: () {
                  Navigator.of(context).pop(club);
                },
              );
            }).toList(),
          ),
        );
      },
    );
    setState(() {
      selectedClub = club ?? '';
    });
  }

  void _selectPlayer() async {
    if (!editPressed) return;
    Map<String, List<Map<String, String>>> clubPlayers = {
      'Manchester United': [
        {'name': 'Luke Shaw', 'image': 'assets/images/shaw.jpeg'},
        {'name': 'Bruno Fernandes', 'image': 'assets/images/bruno.jpeg'},
        {'name': 'Alejandro Garnacho', 'image': 'assets/images/garnacho.jpeg'},
        {'name': 'Kobbie Mainoo', 'image': 'assets/images/kobbie.jpeg'},
        {'name': 'Casemiro', 'image': 'assets/images/casemiro.jpeg'},
        // Add more players for Manchester United
      ],
      'Manchester City': [
        {'name': 'Erling Haaland', 'image': 'assets/images/city1.jpeg'},
        {'name': 'Ederson', 'image': 'assets/images/city2.jpeg'},
        {'name': 'Kyle Walker', 'image': 'assets/images/city3.jpeg'},
        {'name': 'Rodri', 'image': 'assets/images/city4.jpeg'},
        {'name': 'Kevin De Bruyne', 'image': 'assets/images/city5.jpeg'},

      ],
      'Liverpool FC': [
        {'name': 'Mohamed Salah', 'image': 'assets/images/pool1.jpeg'},
        {'name': 'Darwin Nunez', 'image': 'assets/images/pool2.jpeg'},
        {'name': 'Alisson', 'image': 'assets/images/pool3.jpeg'},
        {'name': 'Wataru Endo', 'image': 'assets/images/endo1.jpeg'},
        {'name': 'Virgil van Dijk', 'image': 'assets/images/pool5.jpeg'},

        // Add more players for Liverpool
      ],
      'Arsenal FC': [
        {'name': 'Bukayo Saka', 'image': 'assets/images/a1.jpeg'},
        {'name': 'Declan Rice', 'image': 'assets/images/a2.jpeg'},
        {'name': 'Kai Havertz', 'image': 'assets/images/a3.jpeg'},
        {'name': 'Leandro Trossard', 'image': 'assets/images/a4.jpeg'},
        {'name': 'Takehiro Tomiyasu', 'image': 'assets/images/a5.jpeg'},
        // Add more players for Arsenal
      ],
      'Chelsea FC': [
        {'name': 'Nicolas Jackson', 'image': 'assets/images/c1.jpeg'},
        {'name': 'Raheem Sterling', 'image': 'assets/images/c2.jpeg'},
        {'name': 'Cole Palmer', 'image': 'assets/images/c3.jpeg'},
        {'name': 'Moises Caicedo', 'image': 'assets/images/c4.jpeg'},
        {'name': 'Malo Gusto', 'image': 'assets/images/c5.jpeg'},

        // Add more players for Aston Villa
      ],
    };

    List<Map<String, String>> players = clubPlayers[selectedClub] ?? [];

    Map<String, String> player = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Player'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: players.map((player) {
              return ListTile(
                title: Text(player['name'] ?? ''),
                onTap: () {
                  Navigator.of(context).pop(player);
                },
              );
            }).toList(),
          ),
        );
      },
    );
    setState(() {
      selectedPlayer = player['name'] ?? '';
      selectedPlayerImage = player['image'] ?? '';
    });
  }

  void _editSelection() {
    setState(() {
      editPressed = true;
      isSaved = false;
    });
  }

  void _saveSelection() {
    setState(() {
      isSaved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true, // Center the title
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _editSelection,
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: _saveSelection,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundscreen.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isSaved) // Show only if not saved
                  Text(
                    'Please press edit button to search for the club and choose your favorite player.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 16.0),
                if (isSaved && selectedPlayerImage.isNotEmpty)
                  CircleAvatar(
                    backgroundImage: AssetImage(selectedPlayerImage),
                    backgroundColor: Colors.grey,
                    radius: 150,
                  ),
                const SizedBox(height: 16.0),
                if (!isSaved)
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectClub,
                      child: const Text(
                          'Search Club', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ),
                const SizedBox(height: 16.0),
                if (!isSaved)
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectPlayer,
                      child: const Text('Select Player',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  ),
                if (isSaved)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected Club: $selectedClub',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Selected Player: $selectedPlayer',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
