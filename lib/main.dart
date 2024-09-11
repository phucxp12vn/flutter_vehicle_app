import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'store/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'store/reducers/auth_reducer.dart';
import 'db/database.dart';

void main() {
  final store = Store<LoginFormState>(
    loginFormReducer,
    initialState: LoginFormState.initial(),
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<LoginFormState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          theme: Theme.of(context).copyWith(
            scaffoldBackgroundColor:
                Colors.white, // Background color for all scaffold screens

            // AppBar theme
            appBarTheme: const AppBarTheme(
                color: Colors.white, // AppBar background color
                iconTheme:
                    IconThemeData(color: Colors.orange), // AppBar icon color
                actionsIconTheme: IconThemeData(color: Colors.orange)),
            // Button theme
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange, // Text color for buttons
              ),
            ),

            // Input field theme
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[100], // Background color for input fields
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange), // Border color when focused
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange), // Border color when enabled
              ),
              iconColor: Colors.orange,
              prefixIconColor: Colors.orange,
              suffixIconColor: Colors.orange,
              // labelStyle:
              //     const TextStyle(color: Colors.orange), // Color of label text
            ),

            // Icon theme
            iconTheme: const IconThemeData(
              color: Colors.orange, // Default color for icons
            ),

            // Floating Action Button theme
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orange, // Color of FAB
            ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
                .copyWith(secondary: Colors.deepOrange),
          ),
          home: FutureBuilder(
            future: AppDatabase.instance.checkLoginState(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show splash screen or loader
              } else {
                // Navigate based on the login state
                if (snapshot.data == true) {
                  return const DashboardScreen(); // Already logged in, go to dashboard
                } else {
                  return const LoginScreen(); // Not logged in, go to login screen
                }
              }
            },
          ),
        ));
  }
}
