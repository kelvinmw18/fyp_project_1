import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp_project_1/screens/sign_in.dart'; // Import the sign in page
import '../theme/theme.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int _start = 120; // Set the starting time for the timer (in seconds)
  late Timer _timer; // Define the timer variable
  List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the page initializes
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (timer) {
        if (_start == 0) {
          timer.cancel(); // Cancel the timer when it reaches 0
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()), // Navigate back to sign in page
          );
        } else {
          setState(() {
            _start--; // Decrement the timer by 1 second
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the page is disposed to prevent memory leaks
    for (var controller in _controllers) {
      controller.dispose(); // Dispose all text controllers
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ENTER OTP',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                'Enter the OTP sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                '$_start', // Display the remaining time
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      controller: _controllers[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '', // Hide the character counter
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 4) {
                            FocusScope.of(context).nextFocus(); // Move focus to next TextFormField
                          } else {
                            // Last box, verify OTP or do something else
                          }
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()), // Navigate back to sign in page
                    );
                  },
                  child: const Text('Verify'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
