import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player Rating App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerSelectionScreen(),
    );
  }
}

class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  String? selectedPlayer;
  final List<String> players = [
    'Luke Shaw',
    'Marcus Rashford',
    'Harry Maguire',
    'André Onana',
    'Diogo Dalot',
    'Lisandro Martinez',
    'Raphael Varane',
    'Casemiro',
    'Bruno Fernandes',
    'Rasmus Hojlund',
    'Kobbie Mainoo',
    'Alejandro Garnacho'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Rating',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundscreen.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                        AssetImage('assets/images/unitedlogo.jpeg'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Please select a player based on your favorite team',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: selectedPlayer,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPlayer = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text('Please select a player'),
                      ),
                      ...players.map((player) {
                        return DropdownMenuItem<String>(
                          value: player,
                          child: Text(player),
                        );
                      }).toList(),
                    ],
                  ),
                ),
                if (selectedPlayer != null)
                  FloatingActionButton(
                    onPressed: () {
                      String imagePath = getImagePath(selectedPlayer!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlayerRatingScreen(selectedPlayer!, imagePath),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getImagePath(String playerName) {
    Map<String, String> playerImages = {
      'Luke Shaw': 'assets/images/shaw.jpeg',
      'Marcus Rashford': 'assets/images/rashford.jpeg',
      'Harry Maguire': 'assets/images/maguire.jpeg',
      'André Onana': 'assets/images/onana.jpeg',
      'Diogo Dalot': 'assets/images/dalot.jpeg',
      'Lisandro Martinez': 'assets/images/martinez.jpeg',
      'Raphael Varane': 'assets/images/varane.jpeg',
      'Casemiro': 'assets/images/casemiro.jpeg',
      'Bruno Fernandes': 'assets/images/bruno.jpeg',
      'Rasmus Hojlund': 'assets/images/hojlund.jpeg',
      'Kobbie Mainoo': 'assets/images/kobbie.jpeg',
      'Alejandro Garnacho': 'assets/images/garnacho.jpeg',
    };

    return playerImages[playerName] ?? 'default_image_path';
  }
}

class PlayerRatingScreen extends StatelessWidget {
  final String playerName;
  final String playerImage;

  const PlayerRatingScreen(this.playerName, this.playerImage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Player Profile',
          style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgroundscreen.jpeg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(playerImage),
                ),
                SizedBox(height: 20),
                Text(
                  playerName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Rate Overall Performance',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                StarRating(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Feedback',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayerDetailScreen(playerName, playerImage),
                      ),
                    );
                  },
                  child: const Text(
                    'Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(200, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: SizedBox(
            width: 35,
            height: 35,
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 35,
            ),
          ),
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
          },
        );
      }),
    );
  }
}

class PlayerDetailScreen extends StatelessWidget {
  final String playerName;
  final String playerImage;

  const PlayerDetailScreen(this.playerName, this.playerImage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgroundscreen.jpeg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(playerImage),
                ),
                SizedBox(height: 20),
                Text(
                  playerName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Rate Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                SkillRating(skill: 'Dribbling', fontSize: 18),
                SkillRating(skill: 'Passing', fontSize: 18),
                SkillRating(skill: 'Teamwork', fontSize: 18),
                SkillRating(skill: 'Attitude', fontSize: 18),
                SkillRating(skill: 'Shooting', fontSize: 18),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    primary: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class SkillRating extends StatefulWidget {
  final String skill;
  final double fontSize;

  const SkillRating({Key? key, required this.skill, this.fontSize = 14})
      : super(key: key);

  @override
  _SkillRatingState createState() => _SkillRatingState();
}

class _SkillRatingState extends State<SkillRating> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.skill,
          style: TextStyle(fontSize: widget.fontSize),
        ),
        SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 5,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  rating = index + 1;
                });
              },
            );
          }),
        ),
      ],
    );
  }
}
