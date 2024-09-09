import 'package:flutter/material.dart';
import '../dashboard/dashboar_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logo192.png', height: 64, width: 64),
                _buildLoginForm()
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Image.asset(
        'assets/logo/Titan_Logo.png',
        fit: BoxFit.contain,
        width: 106,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings_outlined,
            size: 40.0,
            color: Colors.orange,
          ),
          onPressed: () {}, // Replace with actual functionality
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/login/bg_login.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildRichText(),
            const SizedBox(height: 32),
            _buildTextFormField(
              icon: Icons.person_outlined,
              name: "username",
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              icon: Icons.lock_outlined,
              obscureText: true,
              suffixIcon: Icons.visibility_off,
              name: "password",
            ),
            const SizedBox(height: 16),
            _buildCheckboxAndButton(),
          ],
        ));
  }

  Widget _buildRichText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: "TECHNICIAN\n",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextSpan(
            text: "TIMECLOCK",
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required IconData icon,
    bool obscureText = false,
    IconData? suffixIcon,
    required String name,
  }) {
    return TextFormField(
      obscureText: obscureText,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $name field';
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }

  Widget _buildCheckboxAndButton() {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (bool? value) {},
              checkColor: Colors.white,
            ),
            const Text('Remember me'),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill input')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(140, 46),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Login'),
        ),
      ],
    );
  }
}
