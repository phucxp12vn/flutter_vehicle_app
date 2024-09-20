import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'store/reducers/app_reducer.dart';
import 'store/state/app_state.dart';
import 'db/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final initialState = await AppState.initial();
  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          // ... (theme configuration remains unchanged)
        ),
        home: FutureBuilder(
          future: AppDatabase.instance.checkLoginState(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.data == true) {
              return const DashboardScreen();
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
