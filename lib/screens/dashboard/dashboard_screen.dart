import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/auth_model.dart';
import 'package:flutter_complete_guide/screens/login/login_screen.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/statistical_widget.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/library_widget.dart';
import 'package:flutter_complete_guide/screens/dashboard/components/scan_result.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_complete_guide/models/count_model.dart';
import 'package:flutter_complete_guide/store/actions/count.dart';
import 'package:flutter_complete_guide/store/state/app_state.dart';
import 'package:flutter_complete_guide/screens/camera/camera_screen.dart';
import 'package:flutter_complete_guide/screens/camera/scan_screen.dart';
import 'package:flutter_complete_guide/screens/canvas/canvas_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("render dashboard");
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      actions: [
        StoreConnector<AppState, LoginViewModel>(
          converter: (store) => LoginViewModel.fromStore(store),
          builder: (context, vm) {
            return IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _handleLogout(context, vm.onLogout),
            );
          },
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    return StoreConnector<AppState, CountViewModel>(
      converter: (store) => CountViewModel.fromStore(store),
      builder: (context, vm) {
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
            final category = CountCategory.values[index];
            vm.onIncrementCount(category);
            if (index == 2) {
              // Index 2 corresponds to the 'Photo' button
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CameraScreen()),
              );
            }
            if (index == 3) {
              // Index 3 corresponds to the 'Scan' button
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScanScreen()),
              );
            }
            if (index == 4) {
              // Index 4 corresponds to the 'Signature' button
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CanvasScreen()),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _handleLogout(BuildContext context, Function onLogout) async {
    await onLogout();
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
