import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/store/state/auth_state.dart';
import 'package:redux/src/store.dart';
import '../dashboard/dashboard_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/auth_model.dart';
import '../../store/state/app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final store = StoreProvider.of<AppState>(context, listen: false);
    final authState = store.state.authState;
    usernameController = TextEditingController(text: authState.username);
    passwordController = TextEditingController(text: authState.password);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (context, vm) {
        if (vm.isSuccess) {
          Future.microtask(() => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const DashboardScreen())));
        }

        return Form(
            key: _formKey,
            child: Column(
              children: [
                _buildRichText(),
                const SizedBox(height: 32),
                _buildTextFormField(
                  icon: Icons.person_outlined,
                  name: "username",
                  controller: usernameController,
                  onChanged: (value) => vm.onUsernameChanged(value),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  icon: Icons.lock_outlined,
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                  name: "password",
                  controller: passwordController,
                  onChanged: (value) => vm.onPasswordChanged(value),
                ),
                const SizedBox(height: 16),
                _buildCheckboxAndButton(onPressed: vm.onLogin),
              ],
            ));
      },
    );
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

  Widget _buildTextFormField(
      {required IconData icon,
      bool obscureText = false,
      IconData? suffixIcon,
      required String name,
      TextEditingController? controller,
      void Function(String)? onChanged}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $name field';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }

  Widget _buildCheckboxAndButton({required Function onPressed}) {
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
              onPressed();
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
