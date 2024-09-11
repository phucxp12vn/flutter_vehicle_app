import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/db/database.dart';
import 'package:flutter_complete_guide/screens/login/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Handle logout action
              await AppDatabase.instance.clearLoginState();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Horizontal space between cards
          mainAxisSpacing: 16.0, // Vertical space between cards
          children: [
            _buildCard('Card 1', Icons.info, Colors.blue),
            _buildCard('Card 2', Icons.star, Colors.green),
            _buildCard('Card 3', Icons.settings, Colors.orange),
            _buildCard('Card 4', Icons.share, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48.0, color: color),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
