import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/db/database.dart';
import 'package:flutter_complete_guide/screens/login/login_screen.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/statistical_widget.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/library_widget.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/scan_result.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _handleLogout(context),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatisticalWidget(),
            SizedBox(height: 16.0),
            LibraryWidget(),
            SizedBox(height: 16.0),
            ScanResultWidget(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 211, 174, 118),
      fixedColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Vehicle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Person',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_camera),
          label: 'Photo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.draw),
          label: 'Signature',
        ),
      ],
      onTap: (index) {
        // Handle navigation
      },
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    await AppDatabase.instance.clearLoginState();
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
