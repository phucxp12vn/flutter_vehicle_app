import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor:
            Colors.white, // Background color for all scaffold screens

        // AppBar theme
        appBarTheme: const AppBarTheme(
            color: Colors.white, // AppBar background color
            iconTheme: IconThemeData(color: Colors.orange), // AppBar icon color
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
            borderSide:
                BorderSide(color: Colors.orange), // Border color when focused
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.orange), // Border color when enabled
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
      home: const LoginPage(),
    );
  }
}
