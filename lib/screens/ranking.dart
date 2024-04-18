import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ranking',
          style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        centerTitle: true, // Center align the title
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Player of the Week
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue,
              child: Column(
                children: [
                  Text(
                    'Top Player of the Week',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Manually insert top player image, name, and score
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/kobbie.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kobbie Mainoo',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '150',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Player Boxes
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                children: [
                  _buildPlayerBox('Andre Onana', '120', 'assets/images/onana.jpeg'),
                  SizedBox(height: 10),
                  _buildPlayerBox('Luke Shaw', '100', 'assets/images/shaw.jpeg'),
                  SizedBox(height: 10),
                  _buildPlayerBox('Kyle Walker', '95', 'assets/images/city3.jpeg'),
                ],
              ),
            ),
            // Feedback Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildFeedback('Not bad. The attacker need to get the ball.', 'assets/images/ppl1.jpeg'),
                  SizedBox(height: 10),
                  _buildFeedback('The goalkeeper is excellent.', 'assets/images/ppl2.jpeg'),
                  SizedBox(height: 10),
                  _buildFeedback('Nice game. Great player.', 'assets/images/ppl3.jpeg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerBox(String playerName, String playerScore, String playerImage) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(playerImage),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                playerName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                playerScore,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedback(String feedbackText, String userImage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userImage),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            feedbackText,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RankingScreen(),
  ));
}
