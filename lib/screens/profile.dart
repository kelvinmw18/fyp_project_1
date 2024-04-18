import 'package:flutter/material.dart';
import 'welcome.dart'; // Assuming WelcomeScreen is the screen to navigate to after logout

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  String _occupation = '';
  String _location = '';
  int? _age;
  String? _selectedGender;
  String _email = '';
  String _country = '';
  bool _isEditMode = true; // Initially set to true to show input fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        centerTitle: true, // Center the title horizontally
        automaticallyImplyLeading: false,
        leading: IconButton( // Edit button
          icon: Icon(Icons.edit),
          onPressed: () {
            setState(() {
              _isEditMode = true; // Enable editing mode
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {
                _isEditMode = false; // Disable editing mode
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack fit the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/images/backgroundscreen.jpeg',
            fit: BoxFit.cover, // Ensure the image fully covers the screen
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildInfoBox(
                  icon: Icons.person,
                  label: 'Name',
                  value: _name,
                  controller: _nameController,
                ),
                const SizedBox(height: 20.0),
                _buildInfoBox(
                  icon: Icons.work,
                  label: 'Occupation',
                  value: _occupation,
                  controller: _occupationController,
                ),
                const SizedBox(height: 20.0),
                _buildInfoBox(
                  icon: Icons.location_on,
                  label: 'Location',
                  value: _location,
                  controller: _locationController,
                ),
                const SizedBox(height: 20.0),
                _buildInfoBox(
                  icon: Icons.cake,
                  label: 'Age',
                  value: _age != null ? '$_age years' : '',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20.0),
                _buildGenderDropdown(),
                const SizedBox(height: 20.0),
                _buildInfoBox(
                  icon: Icons.email,
                  label: 'Email',
                  value: _email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
                _buildInfoBox(
                  icon: Icons.location_city,
                  label: 'Country',
                  value: _country,
                  controller: _countryController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    IconData? icon,
    required String label,
    required String value,
    TextEditingController? controller, // Add this parameter
    TextInputType? keyboardType,
    Function(String)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: Colors.blue,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                _isEditMode
                    ? TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: 'Enter your $label',
                  ),
                )
                    : Text(
                  controller != null ? controller.text : value, // Use controller text if available
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person_outline,
            size: 30.0,
            color: Colors.blue,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                DropdownButton<String>(
                  value: _selectedGender,
                  onChanged: _isEditMode
                      ? (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  }
                      : null,
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () {
                // Perform logout action here
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Welcome(), // Navigate to WelcomeScreen
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
