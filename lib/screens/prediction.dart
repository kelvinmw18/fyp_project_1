import 'package:flutter/material.dart';

void main() {
  runApp(PredictionApp());
}

class PredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatelessWidget {
  final List<Match> matches = [
    Match(
      team1: 'Manchester United',
      team2: 'Liverpool',
      date: 'April 15, 2024',
      players: [
        'Harry Maguire', 'Lisandro Martínez', 'Bruno Fernandes',
        'Marcus Rashford ', 'Rasmus Højlund', 'Alisson',
        'Ibrahima Konaté','Virgil van Dijk','Luis Díaz','Mohamed Salah'
      ],
    ),
    Match(
      team1: 'Aston Villa',
      team2: 'Brighton & Hove Albion',
      date: 'April 16, 2024',
      players: ['Emiliano Martínez', 'Pau Torres', 'Ezri Konsa',
        'Ollie Watkins','Leon Bailey','Danny Welbeck',
        'Ansu Fati','Evan Ferguson','Joao Pedro','Kaoru Mitoma'],
    ),
    Match(
      team1: 'Manchester City',
      team2: 'Chelsea',
      date: 'April 15, 2024',
      players: ['De Bruyne', 'Ederson','Rodri','Rico Lewis',
        'Erling Haaland','Robert Sanchez','Axel Disasi','Nicolas Jackson',
        'Cole Palmer', 'Enzo Fernandez'],
    ),
    Match(
      team1: 'Newcastle United',
      team2: 'Fulham',
      date: 'April 16, 2024',
      players: ['Nick Pope', 'Sven Botman','Lewis Hall','Sean Longstaff',
        'Alexander Isak','João Palhinha','Bernd Leno','Alex Iwobi',
        'Willian', 'Raúl Jiménez'],
    ),
    Match(
      team1: 'Everton',
      team2: 'Crystal Palace',
      date: 'April 17, 2024',
      players: ['Jordan Pickford', 'James Tarkowski','Ashley Young','James Garner',
        'Arnaut Danjuma','Dean Henderson','Jefferson Lerma','Eberechi Eze',
        'Odsonne Edouard', 'Jordan Ayew'],
    ),
    Match(
      team1: 'Arsenal',
      team2: 'Wolves',
      date: 'April 18, 2024',
      players: ['David Raya', 'Jurrien Timber','Declan Rice','Leandro Trossard',
        'Bukayo Saka','Hugo Bueno','Pablo Sarabia','Tommy Doyle',
        'Hee-chan Hwang', 'Matheus Cunha'],
    ),
    Match(
      team1: 'Tottenham Hotspur',
      team2: 'Luton Town',
      date: 'April 18, 2024',
      players: ['Guglielmo Vicario', 'Cristian Romero','Pedro Porro','Richarlison',
        'Heung-min Son','Thomas Kaminski','Teden Mengi','Jacob Brown',
        'Elijah Adebayo', 'Jordan Clark'],
    ),
    Match(
      team1: 'West Ham United',
      team2: 'Burnley FC',
      date: 'April 19, 2024',
      players: ['Alphonse Areola', 'Kurt Zouma','Aaron Cresswell','Michail Antonio',
        'Edson Álvarez','James Trafford','Dara OShea','Jay Rodríguez',
        'Zeki Amdouni', 'Mike Trésor'],
    ),
    Match(
      team1: 'Nottingham Forest',
      team2: 'Brighton & Hove Albion',
      date: 'April 27, 2024',
      players: ['Matt Turner', 'Felipe','Chris Wood','Divock Origi',
        'Danilo','Danny Welbeck', 'Ansu Fati','Evan Ferguson',
        'Joao Pedro','Kaoru Mitoma'],
    ),
    Match(
      team1: 'Sheffield United',
      team2: 'AFC Bournemouth',
      date: 'April 30, 2024',
      players: ['Ivo Grbic', 'Jayden Bogle','Tom Davies','Ben Osborn',
        'William Osula','Chris Mepham','Alex Scott','Ryan Christie',
        'Dominic Solanke', 'Enes Ünal'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Predictions',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), // Make the title bold
        ),
        centerTitle: true, // Center the title horizontally
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack fit the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/images/backgroundscreen.jpeg',
            fit: BoxFit.cover, // Ensure the image fully covers the screen
          ),
          ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MatchBox(match: matches[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MatchBox extends StatelessWidget {
  final Match match;

  const MatchBox({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Center( // Center the club name
          child: Text(
            '${match.team1} vs ${match.team2}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Center( // Center the date
          child: Text(
            match.date,
            style: TextStyle(color: Colors.black),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PredictionInputScreen(match: match),
            ),
          );
        },
      ),
    );
  }
}




class PredictionInputScreen extends StatefulWidget {
  final Match match;

  const PredictionInputScreen({required this.match});

  @override
  _PredictionInputScreenState createState() => _PredictionInputScreenState();
}

class _PredictionInputScreenState extends State<PredictionInputScreen> {
  String? selectedManOfTheMatch;
  String? selectedGoalScorer;
  int? scoreTeam1;
  int? scoreTeam2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Predict Details',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), // Make the title bold
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgroundscreen.jpeg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min, // Ensure minimum space between children
                          children: [
                            ScoreSelection(clubName: 'Home', onChanged: (value) => scoreTeam1 = value),
                            const SizedBox(width: 1.0), // Gap between score boxes
                            ScoreSelection(clubName: 'Away', onChanged: (value) => scoreTeam2 = value),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Select Man of the Match',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0), // Increase font size and make it bold
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButton<String>(
                      value: selectedManOfTheMatch,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedManOfTheMatch = newValue!;
                        });
                      },
                      items: widget.match.players.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 16.0)), // Increase font size
                        );
                      }).toList(),
                      hint: Text('Select Man of the Match', style: TextStyle(fontSize: 16.0)), // Increase font size
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Select First Goal Scorer',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0), // Increase font size and make it bold
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButton<String>(
                      value: selectedGoalScorer,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGoalScorer = newValue!;
                        });
                      },
                      items: widget.match.players.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 16.0)), // Increase font size
                        );
                      }).toList(),
                      hint: Text('Select Goal Scorer', style: TextStyle(fontSize: 16.0)), // Increase font size
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Save predictions
                        print('Man of the Match: $selectedManOfTheMatch');
                        print('Goal Scorer: $selectedGoalScorer');
                        print('Score: $scoreTeam1 - $scoreTeam2');

                        // Navigate back
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Adjust button padding
                        primary: Colors.red, // Change button background to red
                      ),
                      child: Text(
                        'Save Predictions',
                        style: TextStyle(fontSize: 18.0, color: Colors.black), // Enlarge button text and change text color to black
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Match {
  final String team1;
  final String team2;
  final String date;
  final List<String> players;

  Match({required this.team1, required this.team2, required this.date, required this.players});
}

class ScoreSelection extends StatefulWidget {
  final String clubName;
  final void Function(int) onChanged;

  ScoreSelection({required this.clubName, required this.onChanged});

  @override
  _ScoreSelectionState createState() => _ScoreSelectionState();
}

class _ScoreSelectionState extends State<ScoreSelection> {
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.clubName),
        const SizedBox(height: 8.0),
        Container(
          width: 100.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _score++;
                    widget.onChanged(_score);
                  });
                },
              ),
              Text(
                '$_score',
                style: const TextStyle(fontSize: 24.0),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_score > 0) _score--;
                    widget.onChanged(_score);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
